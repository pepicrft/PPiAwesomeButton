//
//  UIView+AutoLayout.m
//  v1.0.0
//  https://github.com/smileyborg/UIView-AutoLayout
//
//  Copyright (c) 2012 Richard Turton
//  Copyright (c) 2013 Tyler Fox
//
//  This code is distributed under the terms and conditions of the MIT license.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//  IN THE SOFTWARE.
//

#import "UIView+AutoLayout.h"


#pragma mark - UIView+AutoLayout

@implementation UIView (AutoLayout)

#pragma mark Factory & Initializer Methods


#pragma mark Auto Layout Convenience Methods

/** 
 A global variable that determines the priority of all constraints created and added by this category.
 Defaults to Required, will only be a different value while executing a constraints block passed into the
 +[UIView autoSetPriority:forConstraints:] method (as that method will reset the value back to Required
 before returning).
 */
static UILayoutPriority _globalConstraintPriority = UILayoutPriorityRequired;

/**
 Sets the constraint priority to the given value for all constraints created using the UIView+AutoLayout
 category API within the given constraints block.
 
 NOTE: This method will have no effect (and will NOT set the priority) on constraints created or added 
 using the SDK directly within the block!
 
 @param priority The layout priority to be set on all constraints in the constraints block.
 @param block A block of method calls to the UIView+AutoLayout API that create and add constraints.
 */
+ (void)autoSetPriority:(UILayoutPriority)priority forConstraints:(ALConstraintsBlock)block
{
    NSAssert(block, @"The constraints block cannot be nil.");
    _globalConstraintPriority = priority;
    if (block) {
        block();
    }
    _globalConstraintPriority = UILayoutPriorityRequired;
}

/**
 Centers the view in its superview.
 
 @return An array of constraints added.
 */
- (NSArray *)autoCenterInSuperview
{
    NSMutableArray *constraints = [NSMutableArray new];
    [constraints addObject:[self autoAlignAxisToSuperviewAxis:ALAxisHorizontal]];
    [constraints addObject:[self autoAlignAxisToSuperviewAxis:ALAxisVertical]];
    return constraints;
}

/**
 DEPRECATED, will be removed at some point in the future. Use -[autoAlignAxisToSuperviewAxis:] instead.
 (This method has simply been renamed due to confusion. The replacement method works identically.)
 
 Centers the view along the given axis (horizontal or vertical) within its superview.
 
 @param axis The axis of this view and of its superview to center on.
 @return The constraint added.
 */
- (NSLayoutConstraint *)autoCenterInSuperviewAlongAxis:(ALAxis)axis
{
    return [self autoAlignAxisToSuperviewAxis:axis];
}

/**
 Aligns the view to the same axis of its superview.
 
 @param axis The axis of this view and of its superview to align.
 @return The constraint added.
 */
- (NSLayoutConstraint *)autoAlignAxisToSuperviewAxis:(ALAxis)axis
{
    UIView *superview = self.superview;
    NSAssert(superview, @"View's superview must not be nil.\nView: %@", self);
    NSAssert(axis != ALAxisBaseline, @"Cannot center view in superview on the baseline axis.");
    NSLayoutAttribute attribute = [UIView al_attributeForAxis:axis];
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:NSLayoutRelationEqual toItem:superview attribute:attribute multiplier:1.0f constant:0.0f];
    [superview al_addConstraintUsingGlobalPriority:constraint];
    return constraint;
}

/**
 DEPRECATED, will be removed at some point in the future.
 
 Pins the given center axis of the view to a fixed position (X or Y value, depending on axis) in the superview.
 
 @param axis The center axis of this view to pin.
 @param value The x (if horizontal axis) or y (if vertical axis) absolute position in the superview to pin this view at.
 @return The constraint added.
 */
- (NSLayoutConstraint *)autoPinCenterAxis:(ALAxis)axis toPositionInSuperview:(CGFloat)value
{
    UIView *superview = self.superview;
    NSAssert(superview, @"View's superview must not be nil.\nView: %@", self);
    NSLayoutAttribute attribute = [UIView al_attributeForAxis:axis];
    NSLayoutConstraint *constraint = nil;
    if (axis == ALAxisVertical) {
        constraint = [NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeLeft multiplier:1.0f constant:value];
    }
    else {
        constraint = [NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeTop multiplier:1.0f constant:value];
    }
    [superview al_addConstraintUsingGlobalPriority:constraint];
    return constraint;
}

/**
 DEPRECATED, will be removed at some point in the future. Use -[autoPinEdgeToSuperviewEdge:withInset:] instead.
 
 Pins the given edge of the view to a fixed position (X or Y value, depending on edge) in the superview.
 
 @param edge The edge of this view to pin.
 @param value The x (if left or right edge) or y (if top or bottom edge) absolute position in the superview to pin this view at.
 @return The constraint added.
 */
- (NSLayoutConstraint *)autoPinEdge:(ALEdge)edge toPositionInSuperview:(CGFloat)value
{
    UIView *superview = self.superview;
    NSAssert(superview, @"View's superview must not be nil.\nView: %@", self);
    ALEdge superviewEdge;
    switch (edge) {
        case ALEdgeLeft:
        case ALEdgeRight:
            superviewEdge = ALEdgeLeft;
            break;
        case ALEdgeTop:
        case ALEdgeBottom:
            superviewEdge = ALEdgeTop;
            break;
        case ALEdgeLeading:
        case ALEdgeTrailing:
            superviewEdge = ALEdgeLeading;
            break;
        default:
            NSAssert(nil, @"Not a valid edge.");
            break;
    }
    return [self autoPinEdge:edge toEdge:superviewEdge ofView:superview withOffset:value];
}

/**
 Pins the given edge of the view to the same edge of the superview with an inset.
 
 @param edge The edge of this view and the superview to pin.
 @param inset The amount to inset this view's edge from the superview's edge.
 @return The constraint added.
 */
- (NSLayoutConstraint *)autoPinEdgeToSuperviewEdge:(ALEdge)edge withInset:(CGFloat)inset
{
    return [self autoPinEdgeToSuperviewEdge:edge withInset:inset relation:NSLayoutRelationEqual];
}

/**
 Pins the given edge of the view to the same edge of the superview with an inset as a maximum or minimum.
 
 @param edge The edge of this view and the superview to pin.
 @param inset The amount to inset this view's edge from the superview's edge.
 @param relation Whether the inset should be at least, at most, or exactly equal to the given value.
 @return The constraint added.
 */
- (NSLayoutConstraint *)autoPinEdgeToSuperviewEdge:(ALEdge)edge withInset:(CGFloat)inset relation:(NSLayoutRelation)relation
{
    UIView *superview = self.superview;
    NSAssert(superview, @"View's superview must not be nil.\nView: %@", self);
    if (edge == ALEdgeBottom || edge == ALEdgeRight || edge == ALEdgeTrailing) {
        // The bottom, right, and trailing insets (and relations, if an inequality) are inverted to become offsets
        inset = -inset;
        if (relation == NSLayoutRelationLessThanOrEqual) {
            relation = NSLayoutRelationGreaterThanOrEqual;
        } else if (relation == NSLayoutRelationGreaterThanOrEqual) {
            relation = NSLayoutRelationLessThanOrEqual;
        }
    }
    return [self autoPinEdge:edge toEdge:edge ofView:superview withOffset:inset relation:relation];
}

/**
 Pins the edges of the view to the edges of its superview with the given edge insets.
 
 @param insets The insets for this view's edges from the superview's edges.
 @return An array of constraints added.
 */
- (NSArray *)autoPinEdgesToSuperviewEdgesWithInsets:(UIEdgeInsets)insets
{
    UIView *superview = self.superview;
    NSAssert(superview, @"View's superview must not be nil.\nView: %@", self);
    NSMutableArray *constraints = [NSMutableArray new];
    [constraints addObject:[self autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:superview withOffset:insets.top]];
    [constraints addObject:[self autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:superview withOffset:insets.left]];
    [constraints addObject:[self autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:superview withOffset:-insets.bottom]];
    [constraints addObject:[self autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:superview withOffset:-insets.right]];
    return constraints;
}

/**
 Pins an edge of the view to a given edge of another view.
 
 @param edge The edge of this view to pin.
 @param toEdge The edge of the peer view to pin to.
 @param peerView The peer view to pin to. Must be in the same view hierarchy as this view.
 @return The constraint added.
 */
- (NSLayoutConstraint *)autoPinEdge:(ALEdge)edge toEdge:(ALEdge)toEdge ofView:(UIView *)peerView
{
    return [self autoPinEdge:edge toEdge:toEdge ofView:peerView withOffset:0.0f];
}

/**
 Pins an edge of the view to a given edge of another view with an offset.
 
 @param edge The edge of this view to pin.
 @param toEdge The edge of the peer view to pin to.
 @param peerView The peer view to pin to. Must be in the same view hierarchy as this view.
 @param offset The offset between the edge of this view and the edge of the peer view.
 @return The constraint added.
 */
- (NSLayoutConstraint *)autoPinEdge:(ALEdge)edge toEdge:(ALEdge)toEdge ofView:(UIView *)peerView withOffset:(CGFloat)offset
{
    return [self autoPinEdge:edge toEdge:toEdge ofView:peerView withOffset:offset relation:NSLayoutRelationEqual];
}

/**
 Pins an edge of the view to a given edge of another view with an offset as a maximum or minimum.
 
 @param edge The edge of this view to pin.
 @param toEdge The edge of the peer view to pin to.
 @param peerView The peer view to pin to. Must be in the same view hierarchy as this view.
 @param offset The offset between the edge of this view and the edge of the peer view.
 @param relation Whether the offset should be at least, at most, or exactly equal to the given value.
 @return The constraint added.
 */
- (NSLayoutConstraint *)autoPinEdge:(ALEdge)edge toEdge:(ALEdge)toEdge ofView:(UIView *)peerView withOffset:(CGFloat)offset relation:(NSLayoutRelation)relation
{
    UIView *superview = [self al_commonSuperviewWithView:peerView];
    NSLayoutAttribute attribute = [UIView al_attributeForEdge:edge];
    NSLayoutAttribute toAttribute = [UIView al_attributeForEdge:toEdge];
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:relation toItem:peerView attribute:toAttribute multiplier:1.0f constant:offset];
    [superview al_addConstraintUsingGlobalPriority:constraint];
    return constraint;
}

/**
 Aligns an axis of the view to the same axis of another view.
 
 @param axis The axis of this view and the peer view to align.
 @param peerView The peer view to align to. Must be in the same view hierarchy as this view.
 @return The constraint added.
 */
- (NSLayoutConstraint *)autoAlignAxis:(ALAxis)axis toSameAxisOfView:(UIView *)peerView
{
    return [self autoAlignAxis:axis toSameAxisOfView:peerView withOffset:0.0f];
}

/**
 Aligns an axis of the view to the same axis of another view with an offset.
 
 @param axis The axis of this view and the peer view to align.
 @param peerView The peer view to align to. Must be in the same view hierarchy as this view.
 @param offset The offset between the axis of this view and the axis of the peer view.
 @return The constraint added.
 */
- (NSLayoutConstraint *)autoAlignAxis:(ALAxis)axis toSameAxisOfView:(UIView *)peerView withOffset:(CGFloat)offset
{
    UIView *superview = [self al_commonSuperviewWithView:peerView];
    NSLayoutAttribute attribute = [UIView al_attributeForAxis:axis];
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:NSLayoutRelationEqual toItem:peerView attribute:attribute multiplier:1.0f constant:offset];
    [superview al_addConstraintUsingGlobalPriority:constraint];
    return constraint;
}

/**
 Matches a dimension of the view to a given dimension of another view.
 
 @param dimension The dimension of this view to pin.
 @param toDimension The dimension of the peer view to pin to.
 @param peerView The peer view to match to. Must be in the same view hierarchy as this view.
 @return The constraint added.
 */
- (NSLayoutConstraint *)autoMatchDimension:(ALDimension)dimension toDimension:(ALDimension)toDimension ofView:(UIView *)peerView
{
    return [self autoMatchDimension:dimension toDimension:toDimension ofView:peerView withOffset:0.0f];
}

/**
 Matches a dimension of the view to a given dimension of another view with an offset.
 
 @param dimension The dimension of this view to pin.
 @param toDimension The dimension of the peer view to pin to.
 @param peerView The peer view to match to. Must be in the same view hierarchy as this view.
 @param offset The offset between the dimension of this view and the dimension of the peer view.
 @return The constraint added.
 */
- (NSLayoutConstraint *)autoMatchDimension:(ALDimension)dimension toDimension:(ALDimension)toDimension ofView:(UIView *)peerView withOffset:(CGFloat)offset
{
    return [self autoMatchDimension:dimension toDimension:toDimension ofView:peerView withOffset:offset relation:NSLayoutRelationEqual];
}

/**
 Matches a dimension of the view to a given dimension of another view with an offset as a maximum or minimum.
 
 @param dimension The dimension of this view to pin.
 @param toDimension The dimension of the peer view to pin to.
 @param peerView The peer view to match to. Must be in the same view hierarchy as this view.
 @param offset The offset between the dimension of this view and the dimension of the peer view.
 @param relation Whether the offset should be at least, at most, or exactly equal to the given value.
 @return The constraint added.
 */
- (NSLayoutConstraint *)autoMatchDimension:(ALDimension)dimension toDimension:(ALDimension)toDimension ofView:(UIView *)peerView withOffset:(CGFloat)offset relation:(NSLayoutRelation)relation
{
    UIView *superview = [self al_commonSuperviewWithView:peerView];
    NSLayoutAttribute attribute = [UIView al_attributeForDimension:dimension];
    NSLayoutAttribute toAttribute = [UIView al_attributeForDimension:toDimension];
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:relation toItem:peerView attribute:toAttribute multiplier:1.0f constant:offset];
    [superview al_addConstraintUsingGlobalPriority:constraint];
    return constraint;
}

/**
 Matches a dimension of the view to a multiple of a given dimension of another view.
 
 @param dimension The dimension of this view to pin.
 @param toDimension The dimension of the peer view to pin to.
 @param peerView The peer view to match to. Must be in the same view hierarchy as this view.
 @param multiplier The multiple of the peer view's given dimension that this view's given dimension should be.
 @return The constraint added.
 */
- (NSLayoutConstraint *)autoMatchDimension:(ALDimension)dimension toDimension:(ALDimension)toDimension ofView:(UIView *)peerView withMultiplier:(CGFloat)multiplier
{
    return [self autoMatchDimension:dimension toDimension:toDimension ofView:peerView withMultiplier:multiplier relation:NSLayoutRelationEqual];
}

/**
 Matches a dimension of the view to a multiple of a given dimension of another view as a maximum or minimum.
 
 @param dimension The dimension of this view to pin.
 @param toDimension The dimension of the peer view to pin to.
 @param peerView The peer view to match to. Must be in the same view hierarchy as this view.
 @param multiplier The multiple of the peer view's given dimension that this view's given dimension should be.
 @param relation Whether the multiple should be at least, at most, or exactly equal to the given value.
 @return The constraint added.
 */
- (NSLayoutConstraint *)autoMatchDimension:(ALDimension)dimension toDimension:(ALDimension)toDimension ofView:(UIView *)peerView withMultiplier:(CGFloat)multiplier relation:(NSLayoutRelation)relation
{
    UIView *superview = [self al_commonSuperviewWithView:peerView];
    NSLayoutAttribute attribute = [UIView al_attributeForDimension:dimension];
    NSLayoutAttribute toAttribute = [UIView al_attributeForDimension:toDimension];
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:relation toItem:peerView attribute:toAttribute multiplier:multiplier constant:0.0f];
    [superview al_addConstraintUsingGlobalPriority:constraint];
    return constraint;
}

/**
 Sets the view to a specific size.
 
 @param size The size to set this view's dimensions to.
 @return An array of constraints added.
 */
- (NSArray *)autoSetDimensionsToSize:(CGSize)size
{
    NSMutableArray *constraints = [NSMutableArray new];
    [constraints addObject:[self autoSetDimension:ALDimensionWidth toSize:size.width]];
    [constraints addObject:[self autoSetDimension:ALDimensionHeight toSize:size.height]];
    return constraints;
}

/**
 Sets the given dimension of the view to a specific size.
 
 @param dimension The dimension of this view to set.
 @param size The size to set the given dimension to.
 @return The constraint added.
 */
- (NSLayoutConstraint *)autoSetDimension:(ALDimension)dimension toSize:(CGFloat)size
{
    return [self autoSetDimension:dimension toSize:size relation:NSLayoutRelationEqual];
}

/**
 Sets the given dimension of the view to a specific size as a maximum or minimum.
 
 @param dimension The dimension of this view to set.
 @param size The size to set the given dimension to.
 @param relation Whether the size should be at least, at most, or exactly equal to the given value.
 @return The constraint added.
 */
- (NSLayoutConstraint *)autoSetDimension:(ALDimension)dimension toSize:(CGFloat)size relation:(NSLayoutRelation)relation
{
    NSLayoutAttribute attribute = [UIView al_attributeForDimension:dimension];
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:relation toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0f constant:size];
    [self al_addConstraintUsingGlobalPriority:constraint];
    return constraint;
}



#pragma mark Internal Helper Methods

/**
 Adds the given constraint to the view after setting the constraint's priority to the global constraint priority.
 
 This method is the only one that calls the SDK addConstraint: method directly; all other instances in this category
 should use this method to add constraints so that the global priority is correctly set on constraints.
 
 @param constraint The constraint to set the global priority on and then add to this view.
 */
- (void)al_addConstraintUsingGlobalPriority:(NSLayoutConstraint *)constraint
{
    constraint.priority = _globalConstraintPriority;
    [self addConstraint:constraint];
}

/**
 Returns the corresponding NSLayoutAttribute for the given ALEdge.
 
 @return The layout attribute for the given edge.
 */
+ (NSLayoutAttribute)al_attributeForEdge:(ALEdge)edge
{
    NSLayoutAttribute attribute;
    switch (edge) {
        case ALEdgeTop:
            attribute = NSLayoutAttributeTop;
            break;
        case ALEdgeLeft:
            attribute = NSLayoutAttributeLeft;
            break;
        case ALEdgeBottom:
            attribute = NSLayoutAttributeBottom;
            break;
        case ALEdgeRight:
            attribute = NSLayoutAttributeRight;
            break;
        case ALEdgeLeading:
            attribute = NSLayoutAttributeLeading;
            break;
        case ALEdgeTrailing:
            attribute = NSLayoutAttributeTrailing;
            break;
        default:
            NSAssert(nil, @"Not a valid edge.");
            break;
    }
    return attribute;
}

/**
 Returns the corresponding NSLayoutAttribute for the given ALAxis.
 
 @return The layout attribute for the given axis.
 */
+ (NSLayoutAttribute)al_attributeForAxis:(ALAxis)axis
{
    NSLayoutAttribute attribute;
    switch (axis) {
        case ALAxisHorizontal:
            attribute = NSLayoutAttributeCenterY;
            break;
        case ALAxisVertical:
            attribute = NSLayoutAttributeCenterX;
            break;
        case ALAxisBaseline:
            attribute = NSLayoutAttributeBaseline;
            break;
        default:
            NSAssert(nil, @"Not a valid axis.");
            break;
    }
    return attribute;
}

/**
 Returns the corresponding NSLayoutAttribute for the given ALDimension.
 
 @return The layout attribute for the given dimension.
 */
+ (NSLayoutAttribute)al_attributeForDimension:(ALDimension)dimension
{
    NSLayoutAttribute attribute;
    switch (dimension) {
        case ALDimensionWidth:
            attribute = NSLayoutAttributeWidth;
            break;
        case ALDimensionHeight:
            attribute = NSLayoutAttributeHeight;
            break;
        default:
            NSAssert(nil, @"Not a valid dimension.");
            break;
    }
    return attribute;
}

/**
 Returns the common superview for this view and the given peer view.
 Raises an exception if this view and the peer view do not share a common superview.
 
 @return The common superview for the two views.
 */
- (UIView *)al_commonSuperviewWithView:(UIView *)peerView
{
    UIView *commonSuperview = nil;
    UIView *startView = self;
    do {
        if ([peerView isDescendantOfView:startView]) {
            commonSuperview = startView;
        }
        startView = startView.superview;
    } while (startView && !commonSuperview);
    NSAssert(commonSuperview, @"View and peer must have a common superview.");
    return commonSuperview;
}

/**
 Aligns this view to a peer view with an alignment option.
 
 @param peerView The peer view to align to.
 @param alignment The alignment option to apply to the two views.
 @param axis The axis along which the views are distributed, used to validate the alignment option.
 @return The constraint added.
 */
- (NSLayoutConstraint *)al_alignToView:(UIView *)peerView withOption:(NSLayoutFormatOptions)alignment forAxis:(ALAxis)axis
{
    NSLayoutConstraint *constraint = nil;
    switch (alignment) {
        case NSLayoutFormatAlignAllCenterX:
            NSAssert(axis == ALAxisVertical, @"Cannot align views that are distributed horizontally with NSLayoutFormatAlignAllCenterX.");
            constraint = [self autoAlignAxis:ALAxisVertical toSameAxisOfView:peerView];
            break;
        case NSLayoutFormatAlignAllCenterY:
            NSAssert(axis != ALAxisVertical, @"Cannot align views that are distributed vertically with NSLayoutFormatAlignAllCenterY.");
            constraint = [self autoAlignAxis:ALAxisHorizontal toSameAxisOfView:peerView];
            break;
        case NSLayoutFormatAlignAllBaseline:
            NSAssert(axis != ALAxisVertical, @"Cannot align views that are distributed vertically with NSLayoutFormatAlignAllBaseline.");
            constraint = [self autoAlignAxis:ALAxisBaseline toSameAxisOfView:peerView];
            break;
        case NSLayoutFormatAlignAllTop:
            NSAssert(axis != ALAxisVertical, @"Cannot align views that are distributed vertically with NSLayoutFormatAlignAllTop.");
            constraint = [self autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:peerView];
            break;
        case NSLayoutFormatAlignAllLeft:
            NSAssert(axis == ALAxisVertical, @"Cannot align views that are distributed horizontally with NSLayoutFormatAlignAllLeft.");
            constraint = [self autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:peerView];
            break;
        case NSLayoutFormatAlignAllBottom:
            NSAssert(axis != ALAxisVertical, @"Cannot align views that are distributed vertically with NSLayoutFormatAlignAllBottom.");
            constraint = [self autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:peerView];
            break;
        case NSLayoutFormatAlignAllRight:
            NSAssert(axis == ALAxisVertical, @"Cannot align views that are distributed horizontally with NSLayoutFormatAlignAllRight.");
            constraint = [self autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:peerView];
            break;
        case NSLayoutFormatAlignAllLeading:
            NSAssert(axis == ALAxisVertical, @"Cannot align views that are distributed horizontally with NSLayoutFormatAlignAllLeading.");
            constraint = [self autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:peerView];
            break;
        case NSLayoutFormatAlignAllTrailing:
            NSAssert(axis == ALAxisVertical, @"Cannot align views that are distributed horizontally with NSLayoutFormatAlignAllTrailing.");
            constraint = [self autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:peerView];
            break;
        default:
            NSAssert(nil, @"Unsupported alignment option.");
            break;
    }
    return constraint;
}

@end


#pragma mark - NSArray+AutoLayout

@implementation NSArray (AutoLayout)

- (NSArray *)autoDistributeViewsAlongAxis:(ALAxis)axis withFixedSpacing:(CGFloat)spacing alignment:(NSLayoutFormatOptions)alignment
{
    NSAssert([self al_containsMinimumNumberOfViews:2], @"This array must contain at least 2 views to distribute.");
    ALDimension matchedDimension;
    ALEdge firstEdge, lastEdge;
    switch (axis) {
        case ALAxisHorizontal:
        case ALAxisBaseline:
            matchedDimension = ALDimensionWidth;
            firstEdge = ALEdgeLeading;
            lastEdge = ALEdgeTrailing;
            break;
        case ALAxisVertical:
            matchedDimension = ALDimensionHeight;
            firstEdge = ALEdgeTop;
            lastEdge = ALEdgeBottom;
            break;
        default:
            NSAssert(nil, @"Not a valid axis.");
            return nil;
    }
    
    NSMutableArray *constraints = [NSMutableArray new];
    UIView *previousView = nil;
    for (id object in self) {
        if ([object isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)object;
            if (previousView) {
                [constraints addObject:[view autoPinEdge:firstEdge toEdge:lastEdge ofView:previousView withOffset:spacing]];
                [constraints addObject:[view autoMatchDimension:matchedDimension toDimension:matchedDimension ofView:previousView]];
                [constraints addObject:[view al_alignToView:previousView withOption:alignment forAxis:axis]];
            }
            else {
                [constraints addObject:[view autoPinEdgeToSuperviewEdge:firstEdge withInset:spacing]];
            }
            previousView = view;
        }
    }
    if (previousView) {
        [constraints addObject:[previousView autoPinEdgeToSuperviewEdge:lastEdge withInset:spacing]];
    }
    return constraints;
}

#pragma mark Internal Helper Methods

/**
 Returns the common superview for the views in this array.
 Raises an exception if the views in this array do not share a common superview.
 
 @return The common superview for the views in this array.
 */
- (UIView *)al_commonSuperviewOfViews
{
    UIView *commonSuperview = nil;
    UIView *previousView = nil;
    for (id object in self) {
        if ([object isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)object;
            if (previousView) {
                commonSuperview = [view al_commonSuperviewWithView:commonSuperview];
            } else {
                commonSuperview = view;
            }
            previousView = view;
        }
    }
    NSAssert(commonSuperview, @"Views must share a common superview.");
    return commonSuperview;
}

/**
 Determines whether this array contains a minimum number of views.
 
 @param minimumNumberOfViews The minimum number of views to check for.
 @return YES if this array contains at least the minimum number of views, NO otherwise.
 */
- (BOOL)al_containsMinimumNumberOfViews:(NSUInteger)minimumNumberOfViews
{
    NSUInteger numberOfViews = 0;
    for (id object in self) {
        if ([object isKindOfClass:[UIView class]]) {
            numberOfViews++;
            if (numberOfViews >= minimumNumberOfViews) {
                return YES;
            }
        }
    }
    return NO;
}

/**
 Creates a copy of this array containing only the view objects in it.
 
 @return A new array containing only the views that are in this array.
 */
- (NSArray *)al_copyViewsOnly
{
    NSMutableArray *viewsOnlyArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (id object in self) {
        if ([object isKindOfClass:[UIView class]]) {
            [viewsOnlyArray addObject:object];
        }
    }
    return viewsOnlyArray;
}

@end
