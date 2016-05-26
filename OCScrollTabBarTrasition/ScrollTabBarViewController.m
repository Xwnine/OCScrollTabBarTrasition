//
//  ScrollTabBarViewController.m
//  OCScrollTabBarTrasition
//
//  Created by Andrew on 16/5/26.
//  Copyright © 2016年 Andrew. All rights reserved.
//

#import "ScrollTabBarViewController.h"
#import "CustomTabBarTransitionDelegate.h"



@interface ScrollTabBarViewController ()

//@property (nonatomic, strong) UIPanGestureRecognizer *pan;
@property (nonatomic, assign) NSInteger subControllerCount;
@property (nonatomic, strong) CustomTabBarTransitionDelegate *tabBarTrasitionDelegate;



@end

@implementation ScrollTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _subControllerCount = self.viewControllers.count;

    self.tabBarTrasitionDelegate = [CustomTabBarTransitionDelegate new];
    self.delegate = _tabBarTrasitionDelegate;
    
    self.tabBar.tintColor = [UIColor greenColor];

    UIPanGestureRecognizer *panGr = [[UIPanGestureRecognizer alloc] init];
    [panGr addTarget:self action:@selector(handlerPanGr:)];
    
    [self.view addGestureRecognizer:panGr];
    
    
}


- (void)handlerPanGr:(UIPanGestureRecognizer *)pan {

    CGFloat transitionX = [pan translationInView:self.view].x;
    CGFloat transtionAbs = transitionX > 0 ? transitionX : -transitionX;
    CGFloat progress = transtionAbs / self.view.frame.size.width;
    
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
        {
            CGPoint velocity = [pan velocityInView:self.view];
            if (velocity.x < 0) {
                
                if (self.selectedIndex < self.subControllerCount) {
                    
                    self.selectedIndex += 1;
                }
            }else {
            
                if (self.selectedIndex > 0) {
                    self.selectedIndex -= 1;
                }
            }
        }
            break;
            
        case UIGestureRecognizerStateChanged:
            [self.tabBarTrasitionDelegate.interactionController updateInteractiveTransition:progress];
            break;
            
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
            
            if (progress > 0.3) {
                self.tabBarTrasitionDelegate.interactionController.completionSpeed = 0.99;
                [self.tabBarTrasitionDelegate.interactionController finishInteractiveTransition];
            }else {
            
                self.tabBarTrasitionDelegate.interactionController.completionSpeed = 0.99;
                [self.tabBarTrasitionDelegate.interactionController cancelInteractiveTransition ];
            }
            self.tabBarTrasitionDelegate.interactive = NO;
            break;
            
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
