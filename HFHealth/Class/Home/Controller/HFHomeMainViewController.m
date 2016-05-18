//
//  HFHomeMainViewController.m
//  HFHealth
//
//  Created by zhf on 16/5/5.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import "HFHomeMainViewController.h"
#import "HFArticle.h"
#import "HFHomeTableViewCell.h"
#import "HFHomeAct.h"

@interface HFHomeMainViewController () <UITableViewDataSource, UITableViewDelegate, SDCycleScrollViewDelegate>

/** table */
@property (nonatomic, strong) UITableView *tableView;
/** cycle view */
@property (nonatomic, strong) SDCycleScrollView *scrollView;
/** act model array */
@property (nonatomic, strong) NSMutableArray *acts;
/** article model array */
@property (nonatomic, strong) NSMutableArray *articles;

@property (nonatomic, strong) MJRefreshAutoNormalFooter *footer;
/** iscontinue */
@property (nonatomic, assign) BOOL isContinue;
/** startid */
@property (nonatomic, copy) NSString *startid;

@end

@implementation HFHomeMainViewController

#pragma mark - lazy load

- (UITableView *)tableView
{
    if (_tableView == nil) {
        
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 100;
        
        // add header refresh
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
        _tableView.mj_header = header;
        
        // add header view
        UIView *headerView = [UIView new];
        _scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, 150) delegate:self placeholderImage:[UIImage imageNamed:@"image_placeholder"]];
        _scrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        _scrollView.currentPageDotColor = kRGB(9, 185, 7);
        [headerView addSubview:_scrollView];
        
        [headerView setupAutoHeightWithBottomView:_scrollView bottomMargin:0];
        
        _tableView.tableHeaderView = _scrollView;
    }
    return _tableView;
}

#pragma mark - life cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    self.navigationController.navigationBar.barTintColor = kRGB(9, 185, 7);
    
    self.acts = [NSMutableArray array];
    self.articles = [NSMutableArray array];
    
    [self.view addSubview:self.tableView];
    
    [self requestHomeArticleListRefreshType:HFRefreshTypeNormal];
}

#pragma mark -  request network

- (void)requestHomeArticleListRefreshType:(HFRefreshType)refreshType
{
    
    NSDictionary *dict = @{
                           @"querytype": @(refreshType),
                           @"querycount": @10,
                           @"startid": @0,
                           @"cateid": @0
                           };
    [[HFNetworkManager sharedNetworkManager] sendGetRequestWithURLString:@"/article/index" parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        
        NSLog(@"%@", responseObject);
        
        NSInteger code = [responseObject[@"code"] integerValue];
        
        if (code == 0) {
            // 轮播图
            NSArray *actArray = [responseObject[@"data"] objectForKey:@"actlist"];
            self.acts = [HFHomeAct mj_objectArrayWithKeyValuesArray:actArray];
            NSMutableArray *imageURLStrings = [NSMutableArray array];
            for (HFHomeAct *model in self.acts) {
                [imageURLStrings addObject:model.imageurl];
            }
            self.scrollView.imageURLStringsGroup = imageURLStrings;
            NSMutableArray *titlesGroup = [NSMutableArray array];
            for (HFHomeAct *model in self.acts) {
                [titlesGroup addObject:model.title];
            }
            
            self.scrollView.titlesGroup = titlesGroup;
            
            NSLog(@"self.acts == %@", self.acts);
            
            // 文章 字典转模型
            NSArray *articleArray = [[responseObject[@"data"] objectForKey:@"articlelist"] objectForKey:@"datalist"];
            self.articles = [HFArticle mj_objectArrayWithKeyValuesArray:articleArray];
            
            [self.tableView reloadData];
            
            self.isContinue = [[[responseObject[@"data"] objectForKey:@"articlelist"] objectForKey:@"iscontinue"] boolValue];
            
            if (self.isContinue) {
                
                self.startid = [[self.articles lastObject] sortindexv4];
                
                // 添加底部加载更多控件
                self.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
                // 设置颜色
                self.footer.stateLabel.textColor = kRGB(9, 185, 7);
                
                self.tableView.mj_footer = self.footer;
            }
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error == %@", error);
    } noNetWork:^{
        NSLog(@"noNetWork");
    }];
}

#pragma mark - header refresh

- (void)loadNewData
{
//    [self.articles removeAllObjects];
    
    // 网络请求
    [self requestHomeArticleListRefreshType:HFRefreshTypePullDown];
    
    [self.tableView.mj_header endRefreshing];
}

#pragma mark - load more
- (void)loadMoreData
{
    NSDictionary *dict = @{
                           @"querytype": @1,
                           @"querycount": @10,
                           @"startid": self.startid,
                           @"cateid": @0
                           };
    [[HFNetworkManager sharedNetworkManager] sendGetRequestWithURLString:@"/article/index" parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        
        NSLog(@"%@", responseObject);
        
        NSInteger code = [responseObject[@"code"] integerValue];
        if (code == 0) {
            
            // 文章 字典转模型
            NSArray *articleArray = [[responseObject[@"data"] objectForKey:@"articlelist"] objectForKey:@"datalist"];
            [self.articles addObjectsFromArray:[HFArticle mj_objectArrayWithKeyValuesArray:articleArray]];
            
            
            [self.tableView reloadData];
            
            self.isContinue = [[[responseObject[@"data"] objectForKey:@"articlelist"] objectForKey:@"iscontinue"] boolValue];
            
            if (self.isContinue) {
                
                self.startid = [[self.articles lastObject] sortindexv4];
                
                // 添加底部加载更多控件
                self.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
                // 设置颜色
                self.footer.stateLabel.textColor = kRGB(9, 185, 7);
                
                self.tableView.mj_footer = self.footer;
            }
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error == %@", error);
    } noNetWork:^{
        NSLog(@"noNetWork");
    }];
}



#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.articles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    HFHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[HFHomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.article = self.articles[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
