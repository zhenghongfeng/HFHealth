//
//  HFDiscoverMainViewController.m
//  HFHealth
//
//  Created by zhf on 16/5/5.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import "HFDiscoverMainViewController.h"

@interface HFDiscoverMainViewController ()

@end

@implementation HFDiscoverMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    NSLog(@"navigationBar.subviews = %@", self.navigationController.navigationBar.subviews);
    
//    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//    
//    self.navigationController.navigationBar.shadowImage = [UIImage new];
    
    
    
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
