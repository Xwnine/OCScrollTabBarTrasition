//
//  CustomTabBarTransitionDelegate.h
//  OCScrollTabBarTrasition
//
//  Created by Andrew on 16/5/26.
//  Copyright © 2016年 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface CustomTabBarTransitionDelegate : NSObject <UITabBarControllerDelegate>

@property (nonatomic, assign) BOOL interactive;
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactionController;
@end
