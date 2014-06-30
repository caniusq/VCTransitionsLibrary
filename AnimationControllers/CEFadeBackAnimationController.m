//
//  CEFadeBackAnimationController.h
//  ViewControllerTransitions
//
//  Created by canius on 14-6-30.
//  Copyright (c) 2014 canius. All rights reserved.
//

#import "CEFadeBackAnimationController.h"

@interface CEFadeBackAnimationController ()
{
    UIView *_overlayView;
}
@end

@implementation CEFadeBackAnimationController

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    if (self.reverse) {
        [self animateTransitionBackward:transitionContext];
    }
    else {
        [self animateTransitionForward:transitionContext];
    }
}

- (void)animateTransitionForward:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *inView = [transitionContext containerView];
    
    UIView *from = fromViewController.view;
    UIView *to = toViewController.view;
    
    [inView addSubview:to];
    [self addOverlayToView:from alpha:0.0];
    
    if (self.direction == CEDirectionHorizontal) {
        to.transform = CGAffineTransformMakeTranslation(inView.bounds.size.width, 0.0);
    }
    else if (self.direction == CEDirectionVertical) {
        to.transform = CGAffineTransformMakeTranslation(0.0,inView.bounds.size.height);
    }
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        if (self.direction == CEDirectionHorizontal) {
            from.transform = CGAffineTransformMakeTranslation(30, 30);
        }
        else if (self.direction == CEDirectionVertical) {
            from.transform = CGAffineTransformMakeScale(0.9, 0.9);
        }
        to.transform = CGAffineTransformIdentity;
        _overlayView.alpha = 0.8;
    } completion:^(BOOL finished) {
        [_overlayView removeFromSuperview];
        from.transform = CGAffineTransformIdentity;
        to.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

- (void)animateTransitionBackward:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *inView = [transitionContext containerView];
    
    UIView *from = fromViewController.view;
    UIView *to = toViewController.view;
    
    [inView insertSubview:to belowSubview:from];
    [self addOverlayToView:to alpha:0.8];
    
    if (self.direction == CEDirectionHorizontal) {
        to.transform = CGAffineTransformMakeTranslation(30, 30);
    }
    else if (self.direction == CEDirectionVertical) {
        to.transform = CGAffineTransformMakeScale(0.9, 0.9);
    }
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        if (self.direction == CEDirectionHorizontal) {
            from.transform = CGAffineTransformMakeTranslation(inView.bounds.size.width, 0.0);
        }
        else if (self.direction == CEDirectionVertical) {
            from.transform = CGAffineTransformMakeTranslation(0.0,inView.bounds.size.height);
        }
        to.transform = CGAffineTransformIdentity;
        _overlayView.alpha = 0;
    } completion:^(BOOL finished) {
        [_overlayView removeFromSuperview];
        from.transform = CGAffineTransformIdentity;
        to.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

- (void)addOverlayToView:(UIView *)view alpha:(CGFloat)alpha
{
    if (!_overlayView) {
        _overlayView = [[UIView alloc] init];
        _overlayView.backgroundColor = [UIColor blackColor];
    }
    _overlayView.alpha = alpha;
    _overlayView.frame = CGRectMake(0, 0, CGRectGetWidth(view.bounds), CGRectGetHeight(view.bounds));
    [view addSubview:_overlayView];
}

@end
