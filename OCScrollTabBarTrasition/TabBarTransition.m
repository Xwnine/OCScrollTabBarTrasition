//
//  TabBarTransition.m
//  OCScrollTabBarTrasition
//
//  Created by Andrew on 16/5/26.
//  Copyright © 2016年 Andrew. All rights reserved.
//

#import "TabBarTransition.h"

@implementation TabBarTransition

- (void)setTransitionType:(OperationType)transitionType {

    _transitionType = transitionType;
}


- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    
    return .5;

}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {

    
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *contrainerView = [transitionContext containerView];
    
    
    CGFloat transition  = contrainerView.frame.size.width;
    switch (_transitionType) {
        case OperationLeft:
            transition = transition;
            break;
        case OperationRight:
            transition = -transition;
            break;
            
        default:
            break;
    }
    
    [contrainerView addSubview:toVc.view];

    CGAffineTransform toViewTransform = CGAffineTransformMakeTranslation(-transition, 0);
    CGAffineTransform fromViewTransform = CGAffineTransformMakeTranslation(transition, 0);
    
    toVc.view.transform = toViewTransform;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        fromVc.view.transform = fromViewTransform;
        toVc.view.transform = CGAffineTransformIdentity;
        
        
    } completion:^(BOOL finished) {
        
        fromVc.view.transform = CGAffineTransformIdentity;
        toVc.view.transform = CGAffineTransformIdentity;
        
        BOOL isCancelled = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!isCancelled];
    }];
}

@end
