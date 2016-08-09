//
//  JSTabBarViewController.m
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/9.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSTabBarViewController.h"
#import "JSNavigationController.h"

@interface JSTabBarViewController ()

@end

@implementation JSTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

/**
 *  添加子控制器
 *
 *  @param viewcontroller 子控制器
 *  @param title          子控制器标题
 *  @param imageName      自控制提图标
 */
- (void)addChildViewControllers:(UIViewController *)viewcontroller withTitle:(NSString *)title withImageName:(NSString *)imageName{
    
    JSNavigationController *navigationController = [[JSNavigationController alloc] initWithRootViewController:viewcontroller];
    navigationController.view.backgroundColor = [UIColor js_randomColor];
    [self addChildViewController:navigationController];
    
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
