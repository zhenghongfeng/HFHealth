//
//  HFHomeMainViewController.m
//  HFHealth
//
//  Created by zhf on 16/5/5.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import "HFHomeMainViewController.h"
#import "HFArticle.h"

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
    
    
    NSDictionary *dict = @{
                           @"querytype": @0,
                           @"querycount": @10,
                           @"startid": @0,
                           @"cateid": @0
                           };
    [[HFNetworkManager sharedNetworkManager] sendGetRequestWithURLString:@"/article/index" parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        
//        NSLog(@"%@", responseObject);
        NSArray *array = [[responseObject[@"data"] objectForKey:@"articlelist"] objectForKey:@"datalist"];
//        NSLog(@"array == %@", array);
        
        
        NSArray *models = [HFArticle mj_objectArrayWithKeyValuesArray:array];
        
        NSLog(@"models == %@", [models[0] myDescription]);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error == %@", error);
    } noNetWork:^{
        NSLog(@"noNetWork");
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
