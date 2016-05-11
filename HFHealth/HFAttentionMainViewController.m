//
//  HFAttentionMainViewController.m
//  HFHealth
//
//  Created by zhf on 16/5/5.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import "HFAttentionMainViewController.h"

@interface HFAttentionMainViewController ()

/** <#注释#> */
@property (nonatomic, strong) CMRequest *request;

@end

@implementation HFAttentionMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    [self.request POST:@"http://cdn.4399sj.com/app/iphone/v2.2/home.html?start=1&count=10" parameters:nil success:^(CMRequest *request, NSString *responseString) {
        
        NSDictionary *dict = [responseString objectFromJSONString];
        NSLog(@"dict == %@", dict);
        
    } failure:^(CMRequest *request, NSError *error) {
        NSLog(@"error == %@", error);
    }];
    
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
