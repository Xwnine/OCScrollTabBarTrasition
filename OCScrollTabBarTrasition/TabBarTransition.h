//
//  TabBarTransition.h
//  OCScrollTabBarTrasition
//
//  Created by Andrew on 16/5/26.
//  Copyright © 2016年 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



typedef NS_ENUM(NSUInteger, OperationType) {
    OperationLeft,
    OperationRight,
};


@interface TabBarTransition : NSObject <UIViewControllerAnimatedTransitioning>

@property(nonatomic, assign) OperationType transitionType;

@end
