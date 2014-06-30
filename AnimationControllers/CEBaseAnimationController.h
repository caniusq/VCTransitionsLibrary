//
//  CEBaseAnimationController.h
//  ViewControllerTransitions
//
//  Created by canius on 14-6-30.
//  Copyright (c) 2014 canius. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, CEDirection) {
    CEDirectionHorizontal,
    CEDirectionVertical
};

/**
 A base class for animation controllers which provide reversible animations. A reversible animation is often used with navigation controllers where the reverse property is set based on whether this is a push or pop operation, or for modal view controllers where the reverse property is set based o whether this is a show / dismiss.
 */
@interface CEBaseAnimationController : NSObject <UIViewControllerAnimatedTransitioning>

/**
 The reverse of the animation.
 */
@property (nonatomic, assign) BOOL reverse;

/**
 The direction of the animation.
 */
@property (nonatomic, assign) CEDirection direction;

/**
 The animation duration.
 */
@property (nonatomic, assign) NSTimeInterval duration;

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC fromView:(UIView *)fromView toView:(UIView *)toView;

@end
