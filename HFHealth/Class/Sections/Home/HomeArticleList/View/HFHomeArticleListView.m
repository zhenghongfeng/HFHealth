//
//  HFHomeArticleListView.m
//  HFHealth
//
//  Created by zhf on 16/5/11.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import "HFHomeArticleListView.h"
#import "HFHomeArticleListViewModel.h"

@interface HFHomeArticleListView () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) HFHomeArticleListViewModel *viewModel;


@end

@implementation HFHomeArticleListView


#pragma mark - system

- (instancetype)initWithViewModel:(id<HFViewModelProtocol>)viewModel {
    
    self.viewModel = (HFHomeArticleListViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

#pragma mark - lazyLoad
- (HFHomeArticleListViewModel *)viewModel {
    
    if (!_viewModel) {
        
        _viewModel = [[HFHomeArticleListViewModel alloc] init];
    }
    
    return _viewModel;
}

@end
