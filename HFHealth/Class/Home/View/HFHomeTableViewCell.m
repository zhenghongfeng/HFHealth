//
//  HFHomeTableViewCell.m
//  HFHealth
//
//  Created by zhf on 16/5/17.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import "HFHomeTableViewCell.h"
#import "HFArticle.h"

@interface HFHomeTableViewCell ()

/** title label */
@property (nonatomic, weak) UILabel *titleLabel;

@end

@implementation HFHomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *titleLabel = [UILabel new];
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
    }
    return self;
}

- (void)setArticle:(HFArticle *)article
{
    self.titleLabel.text = article.title;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .topSpaceToView(self.contentView, 15)
    .rightSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
}
@end
