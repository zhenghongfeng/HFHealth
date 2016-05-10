//
//  HFHomeMainViewController.m
//  HFHealth
//
//  Created by zhf on 16/5/5.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import "HFHomeMainViewController.h"
#import "HFMyTest.h"
#import "NSArray+Swizzle.h"

static NSString *const HFRequestURL = @"http://cdn.4399sj.com/app/iphone/v2.2/home.html?start=1&count=10";

@interface HFHomeMainViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation HFHomeMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    self.navigationController.navigationBar.barTintColor = kRGB(9, 185, 7);
    
    HFMyTest *myTest = [[HFMyTest alloc] init];
    NSLog(@"test == %@", myTest);
    
    
    NSArray *arr = @[@"0", @"1", @"2", @"3"];
    NSString *lastStr = [arr lastObject];
    NSLog(@"lastStr == %@", lastStr);
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    manager.baseURL = [NSURL URLWithString:@"http://kkhealth.api.kk-me.com/v6"];
    //    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    //     manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:HFRequestURL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //        NSLog(@"responseObject == %@", responseObject);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
//        NSLog(@"dic == %@", dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    [@[@1,@2,@3] bk_each:^(id obj) {
        NSLog(@"%@", obj);
    }];
    
    [@[@1,@2,@3] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"%@", obj);
    }];
    
    // 为一个已经存在的类添加属性
    NSObject *test = [[NSObject alloc] init];
    [test bk_associateValue:@"Draveness" withKey:@"name"];
    NSLog(@"%@", [test bk_associatedValueForKey:@"name"]);
    
    
    UITapGestureRecognizer *singleTap = [UITapGestureRecognizer bk_recognizerWithHandler:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
        NSLog(@"Single tap.");
    } delay:0.18];
    [self.view addGestureRecognizer:singleTap];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 100;
    [self.view addSubview:tableView];
    
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
