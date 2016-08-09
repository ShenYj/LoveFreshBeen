//
//  JSHomeTableViewController.m
//  LoveFreshBeen
//
//  Created by ShenYj on 16/8/9.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "JSHomeTableViewController.h"
#import "JSScanViewController.h"
#import "JSCustomFrameButton.h"
#import "JSHeaderView.h"
#import "JSHomeDataModel.h"
#import "JSActivitiesModel.h"


@interface JSHomeTableViewController ()

@property (nonatomic,strong) JSCustomFrameButton *leftScanButton;
@property (nonatomic,strong) JSCustomFrameButton *rightSearchButton;

// 首页数据容器
@property (nonatomic,strong) NSArray <JSHomeDataModel *> *dataArr;

@end

@implementation JSHomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏视图
    [self prepareNavigationItems];
    
    // 请求首页数据
    [self loadHomePageData];
    
    // 设置HeaderView视图
    [self prepareHeaderView];
    
    // 请求数据
    [self prepareHeaderView];
    
}

#pragma mark -- 设置头View视图
- (void)prepareHeaderView{
    
    self.tableView.tableHeaderView = [[JSHeaderView alloc] initWithFrame:CGRectMake(0, 0, 0, 320)];
}

// 请求首页数据
- (void)loadHomePageData{
    
    NSDictionary *para = @{
                           @"call": @"1"
                           };
    
    
    [[JSNetworkManager sharedManager] requestHomePageDataWithParameters:para withfinishedBlock:^(id res, NSError *error) {
        
        if (res == nil || error != nil) {
            
            NSLog(@"请求数据失败:%@",error);
            return ;
        }
        NSDictionary *data = res[@"data"];
        
        NSLog(@"%@",data);
//
//        NSLog(@"%@",[data[@"activities"] class]);
//        NSLog(@"%@",[data[@"focus"] class]);
//        NSLog(@"%@",[data[@"icons"] class]);
        
        JSHomeDataModel *dataModel = [JSHomeDataModel DataWithDict:data];
        NSArray *arr = [NSArray arrayWithObject:dataModel];
        
        NSLog(@"%@",dataModel.activities);
        NSLog(@"%@",dataModel.focus);
        NSLog(@"%@",dataModel.icons);
        
        
//        NSDictionary; *activitiesDict = [data[@"activities"] lastObject];
        

//        
//        for (NSDictionary *dict in activitiesDict) {
//            
//            JSActivitiesModel *model = [JSActivitiesModel activitiesWithDict:activitiesDict];
//            [mArr addObject:model];
//        }
//        NSLog(@"%@",mArr);
//        
//        weakSelf.dataArr = mArr.copy;
        
    }];
    
}

// 设置导航栏视图
- (void)prepareNavigationItems{
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftScanButton];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightSearchButton];
    
//    self.navigationItem.titleView = []

}


// 导航栏按钮点击事件
- (void)clickLeftNavButton:(UIBarButtonItem *)button{
    NSLog(@"点击左侧导航栏按钮");
    
    JSScanViewController *scanViewController = [[JSScanViewController alloc] init];
//    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"v2_goback"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(clickBackNavButton:)];
    [self.navigationController pushViewController:scanViewController animated:YES];
}

- (void)clickRightNavButton:(UIBarButtonItem *)button{
    NSLog(@"点击右侧导航栏按钮");
}


//- (void)clickBackNavButton:(UIBarButtonItem *)button{
//    [self.navigationController popViewControllerAnimated:YES];
//}


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

- (NSArray *)dataArr{
    
    if (_dataArr == nil) {
        _dataArr = [NSArray array];
    }
    return _dataArr;
}

- (UIButton *)leftScanButton{
    if (_leftScanButton == nil) {
        _leftScanButton = [[JSCustomFrameButton alloc] init];
        [_leftScanButton setImage:[UIImage imageNamed:@"icon_black_scancode"] forState:UIControlStateNormal];
        [_leftScanButton setTitle:@"扫一扫" forState:UIControlStateNormal];
        [_leftScanButton addTarget:self action:@selector(clickLeftNavButton:) forControlEvents:UIControlEventTouchUpInside];
        [_leftScanButton sizeToFit];
        
    }
    return _leftScanButton;
}

- (UIButton *)rightSearchButton{
    if (_rightSearchButton == nil) {
        _rightSearchButton = [[JSCustomFrameButton alloc] init];
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
