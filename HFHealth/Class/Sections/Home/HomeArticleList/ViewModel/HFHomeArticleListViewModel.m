//
//  HFHomeArticleListViewModel.m
//  HFHealth
//
//  Created by zhf on 16/5/11.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import "HFHomeArticleListViewModel.h"

@implementation HFHomeArticleListViewModel

- (void)hf_initialize
{
    
    [self.request POST:@"http://cdn.4399sj.com/app/iphone/v2.2/home.html?start=1&count=10" parameters:nil success:^(CMRequest *request, NSString *responseString) {
        
        NSDictionary *dict = [responseString objectFromJSONString];
        NSLog(@"dict == %@", dict);
        
    } failure:^(CMRequest *request, NSError *error) {
        NSLog(@"error == %@", error);
    }];
}

@end
