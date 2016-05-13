//
//  HFHomeMainViewController.m
//  HFHealth
//
//  Created by zhf on 16/5/5.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import "HFHomeMainViewController.h"

static NSString *const HFRequestURL = @"http://cdn.4399sj.com/app/iphone/v2.2/home.html?start=1&count=10";

@interface HFHomeMainViewController () <UITableViewDataSource, UITableViewDelegate>


@end

@implementation HFHomeMainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    self.navigationController.navigationBar.barTintColor = kRGB(9, 185, 7);
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 100;
    [self.view addSubview:tableView];
    
    [[HFNetworkManager sharedNetworkManager] getRequestWithUrlString:HFRequestURL];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager GET:HFRequestURL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject == %@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error == %@", error);
    }];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

@end
