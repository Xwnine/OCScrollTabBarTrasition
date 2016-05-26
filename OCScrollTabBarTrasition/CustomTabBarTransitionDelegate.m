//
//  CustomTabBarTransitionDelegate.m
//  OCScrollTabBarTrasition
//
//  Created by Andrew on 16/5/26.
//  Copyright © 2016年 Andrew. All rights reserved.
//

#import "CustomTabBarTransitionDelegate.h"
#import "TabBarTransition.h"


@implementation CustomTabBarTransitionDelegate


- (nullable id<UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {


    return self.interactive ? self.interactionController : nil;
}


- (nullable id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
                     animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                                       toViewController:(UIViewController *)toVC {

    TabBarTransition *anmiator = [TabBarTransition new];
    
    NSInteger fromIndex = [tabBarController.viewControllers indexOfObject:fromVC];
    NSInteger toIndex = [tabBarController.viewControllers indexOfObject:toVC];
    
    anmiator.transitionType = toIndex < fromIndex ? OperationLeft : OperationRight;

    return  anmiator;
}





@end
