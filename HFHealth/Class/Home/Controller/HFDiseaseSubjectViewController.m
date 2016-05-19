//
//  HFDiseaseSubjectViewController.m
//  HFHealth
//
//  Created by zhf on 16/5/19.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import "HFDiseaseSubjectViewController.h"

@implementation HFDiseaseSubjectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"专题";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[HFNetworkManager sharedNetworkManager] sendGetRequestWithURLString:@"/feature/index" parameters:nil progress:^(NSProgress *downloadProgress) {
        
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"responseObject == %@", responseObject);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    } noNetWork:^{
        
    }];
    
}
@end
