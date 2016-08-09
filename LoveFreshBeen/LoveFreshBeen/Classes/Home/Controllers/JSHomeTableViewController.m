//
//  JSHomeTableViewController.m
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/9.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSHomeTableViewController.h"
#import "JSNavigationButton.h"


@interface JSHomeTableViewController ()

@property (nonatomic,strong) JSNavigationButton *leftScanButton;
@property (nonatomic,strong) JSNavigationButton *rightSearchButton;

@end

@implementation JSHomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareNavigationItems];
    
}

- (void)prepareNavigationItems{
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftScanButton];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightSearchButton];
    
    

}


// 导航栏按钮点击事件
- (void)clickLeftNavButton:(UIBarButtonItem *)button{
    NSLog(@"点击左侧导航栏按钮");
}

- (void)clickRightNavButton:(UIBarButtonItem *)button{
    NSLog(@"点击右侧导航栏按钮");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}


#pragma mark -- 懒加载

- (UIButton *)leftScanButton{
    if (_leftScanButton == nil) {
        _leftScanButton = [[JSNavigationButton alloc] init];
        [_leftScanButton setImage:[UIImage imageNamed:@"icon_black_scancode"] forState:UIControlStateNormal];
        [_leftScanButton setTitle:@"扫一扫" forState:UIControlStateNormal];
        [_leftScanButton addTarget:self action:@selector(clickLeftNavButton:) forControlEvents:UIControlEventTouchUpInside];
        [_leftScanButton sizeToFit];
        
    }
    return _leftScanButton;
}

- (UIButton *)rightSearchButton{
    if (_rightSearchButton == nil) {
        _rightSearchButton = [[JSNavigationButton alloc] init];
        [_rightSearchButton setImage:[UIImage imageNamed:@"icon_search"] forState:UIControlStateNormal];
        [_rightSearchButton setTitle:@"搜索" forState:UIControlStateNormal];
        [_rightSearchButton addTarget:self action:@selector(clickRightNavButton:) forControlEvents:UIControlEventTouchUpInside];
        [_rightSearchButton sizeToFit];
    }
    return _rightSearchButton;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
