//
//  JSScanViewController.m
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/9.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSScanViewController.h"

@implementation JSScanViewController



- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self prepareScanView];
    
}

// 设置视图
- (void)prepareScanView{
    
    self.view.backgroundColor = [UIColor js_randomColor];
    UIImage *backImage = [[UIImage imageNamed:@"v2_goback"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backImage style:UIBarButtonItemStylePlain target:self action:@selector(clickLeftBarButtonItem:)];
}

- (void)clickLeftBarButtonItem:(UIBarButtonItem *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
