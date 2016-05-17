//
//  HFHomeTableViewCell.h
//  HFHealth
//
//  Created by zhf on 16/5/17.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HFArticle;

@interface HFHomeTableViewCell : UITableViewCell

/** article */
@property (nonatomic, strong) HFArticle *article;

@end
