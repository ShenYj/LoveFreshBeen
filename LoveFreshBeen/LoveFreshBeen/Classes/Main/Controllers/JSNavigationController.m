//
//  JSNavigationController.m
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/9.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSNavigationController.h"

@interface JSNavigationController ()

@end

@implementation JSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self prepareNavigationBar];
    
}

// 设置导航栏布局
- (void)prepareNavigationBar{
    
    // 设置导航栏背景图片
    UIImage *backgroundImage = [UIImage imageNamed:@"navigationBar"];
    
    [self.navigationBar setBackgroundImage:[backgroundImage stretchableImageWithLeftCapWidth:backgroundImage.size.width*0.5 topCapHeight:backgroundImage.size.height*0.5] forBarMetrics:UIBarMetricsDefault];
    
//    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
    
//    self.navigationBar.tintColor = [UIColor blackColor];
    
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
