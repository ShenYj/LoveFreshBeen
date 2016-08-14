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
#import "JSMenumNavController.h"
#import <SafariServices/SafariServices.h>
#import "JSMenumView.h"
#import <WebKit/WebKit.h>


CGFloat headerViewHeight = 250;

@interface JSHomeTableViewController () <JSMenumViewDelegate>

// 导航栏左侧扫一扫按钮
@property (nonatomic,strong) JSCustomFrameButton *leftScanButton;
// 导航栏右侧搜索按钮
@property (nonatomic,strong) JSCustomFrameButton *rightSearchButton;
// 自定义HeaderView
@property (nonatomic,strong) JSHeaderView *headerView;

// UIWebView
@property (nonatomic,strong) WKWebView *webView;


@end

@implementation JSHomeTableViewController{
    
    // 首页数据容器
    JSHomeDataModel *_homeData;
}

+ (void)load{
    [super load];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 请求首页数据
    [self loadHomePageData];
     
    // 设置导航栏视图
    [self prepareNavigationItems];
    
}

#pragma mark -- 设置头View视图
- (void)prepareHeaderView{
    
    JSHeaderView *headerView = [[JSHeaderView alloc] initWithFrame:CGRectMake(0, 0, 0, headerViewHeight) withData:_homeData];
    
    __weak typeof(self) weakSelf = self;
    
    [headerView setPresentSafariHandler:^(SFSafariViewController *safari) {
        [weakSelf presentViewController:safari animated:YES completion:nil];
    }];
    
    // 点击菜单区按钮
    [headerView setMenumButtonHandler:^(JSMenumNavController *nav) {
        
        [weakSelf.navigationController pushViewController:nav animated:YES];
        
    }];
    
//    [headerView setMenumButtonHandler:^(NSInteger index) {
//        
//        JSIconsModel *model = _homeData.icons[index];
//        UIWebView *webView = [[UIWebView alloc] init];
//        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:model.customURL]]];
//        
//        UIViewController *viewController = [[UIViewController alloc] init];
//        viewController.view = webView;
//        UINavigationController *navigation= [[UINavigationController alloc] initWithRootViewController:viewController];
//        
//
//        
////        [self.navigationController pushViewController:navigation animated:YES];
//        
//        NSLog(@"%zd",index);
//        NSLog(@"%@",model.customURL);
//    }];
    
    for (UIView *view in headerView.subviews) {
        
        if ([view isKindOfClass:NSClassFromString(@"JSMenumView")]) {
            JSMenumView *menumView = (JSMenumView *)view;
            menumView.delegate = self;
        }
    }
    
    self.tableView.tableHeaderView = headerView;
}

#pragma mark -- 请求首页数据
- (void)loadHomePageData{
    
    NSDictionary *para = @{@"call": @"1"};
    [[JSNetworkManager sharedManager] requestHomePageDataWithParameters:para withfinishedBlock:^(id res, NSError *error) {
        
        if (res == nil || error != nil) {
            NSLog(@"请求数据失败:%@",error);
            return ;
        }
        NSDictionary *data = res[@"data"];
        
        JSHomeDataModel *dataModel = [JSHomeDataModel DataWithDict:data];
        // 成员变量赋值
        _homeData = dataModel;
        
        // 设置HeaderView视图
        [self prepareHeaderView];
        
    }];

}


#pragma mark -- 设置导航栏视图
- (void)prepareNavigationItems{
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftScanButton];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightSearchButton];

}


#pragma mark -- 导航栏按钮点击事件
- (void)clickLeftNavButton:(UIBarButtonItem *)button{
    
    JSScanViewController *scanViewController = [[JSScanViewController alloc] init];
    [self.navigationController pushViewController:scanViewController animated:YES];
}

- (void)clickRightNavButton:(UIBarButtonItem *)button{
    NSLog(@"点击右侧导航栏按钮");
    [self.webView reload];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- present webView界面导航栏按钮点击事件

- (void)clickLeftBarButtonItem:(UIBarButtonItem *)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)clickRightBarButtonItem:(UIBarButtonItem *)sender{
    
    NSLog(@"刷新页面");
}


#pragma mark -- JSMenumViewDelegate

- (void)menumView:(JSMenumView *)menumView withButton:(JSMenumButton *)button{
    
    
    JSIconsModel *model = _homeData.icons[button.tag - 1000];
//    UIWebView *webView = [[UIWebView alloc] init];
    WKWebView *webView = [[WKWebView alloc] init];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:model.customURL]]];
    
    
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view = webView;
    JSMenumNavController *navigation= [[JSMenumNavController alloc] initWithRootViewController:viewController withJSIconsModel:model];
    
    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"v2_goback"] style:UIBarButtonItemStylePlain target:self action:@selector(clickLeftBarButtonItem:)];
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"v2_refresh"] style:UIBarButtonItemStylePlain target:self action:@selector(clickRightBarButtonItem:)];
    
    self.webView = webView;
    
//        [self.navigationController pushViewController:navigation animated:YES];
    [self presentViewController:navigation animated:YES completion:nil];
    
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
