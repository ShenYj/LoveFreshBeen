//
//  JSTabBarViewController.m
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/9.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSTabBarViewController.h"
#import "JSNavigationController.h"
#import "JSHomeTableViewController.h"
#import "JSStoreTableViewController.h"
#import "JSCartTableViewController.h"
#import "JSMineTableViewController.h"

@interface JSTabBarViewController ()

@end

@implementation JSTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加tabBar子控制器
    [self addChildViewControllers:[[JSHomeTableViewController alloc]init] withTitle:@"首页" withImageName:@"v2_home"];
    [self addChildViewControllers:[[JSStoreTableViewController alloc]init] withTitle:@"闪电超市" withImageName:@"v2_order"];
    [self addChildViewControllers:[[JSCartTableViewController alloc]init] withTitle:@"购物车" withImageName:@"v2_shopCart"];
    [self addChildViewControllers:[[JSMineTableViewController alloc]init] withTitle:@"我的" withImageName:@"v2_my"];
                                  
}

/**
 *  添加子控制器
 *
 *  @param viewcontroller 子控制器
 *  @param title          子控制器标题
 *  @param imageName      自控制提图标
 */
- (void)addChildViewControllers:(UIViewController *)viewcontroller withTitle:(NSString *)title withImageName:(NSString *)imageName{
    
    UIImage *image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_r",imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    JSNavigationController *navigationController = [[JSNavigationController alloc] initWithRootViewController:viewcontroller];
    navigationController.view.backgroundColor = [UIColor js_randomColor];
    
    navigationController.tabBarItem.image = image;
    navigationController.tabBarItem.selectedImage = selectedImage;
    navigationController.tabBarItem.title = title;
    
    [navigationController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]} forState:UIControlStateNormal];
    
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
