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
@property (nonatomic, weak) UILabel *myTitleLabel;
/** right imageView */
@property (nonatomic, weak) UIImageView *myimageView;
/** mpname label */
@property (nonatomic, weak) UILabel *myMpNameLabel;
/** ReadImageView */
@property (nonatomic, strong) UIImageView *myReadImageView;
/** readCount label */
@property (nonatomic, weak) UILabel *myReadCountLabel;


@end

@implementation HFHomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *titleLabel = [UILabel new];
        [self.contentView addSubview:titleLabel];
        self.myTitleLabel = titleLabel;
        
        UIImageView *imageView = [UIImageView new];
        [self.contentView addSubview:imageView];
        self.myimageView = imageView;
        
        UILabel *mpNameLabel = [UILabel new];
        mpNameLabel.textColor = [UIColor grayColor];
        mpNameLabel.font = [UIFont systemFontOfSize:12];
        /** 设置单行文本label宽度自适应 from sd_autolayout*/
        [mpNameLabel setSingleLineAutoResizeWithMaxWidth:MAXFLOAT];
        [self.contentView addSubview:mpNameLabel];
        self.myMpNameLabel = mpNameLabel;
        
        UIImageView *readImageView = [UIImageView new];
        readImageView.image = [UIImage imageNamed:@"forward"];
        [self.contentView addSubview:readImageView];
        self.myReadImageView = readImageView;
        
        UILabel *readCountLabel = [UILabel new];
        readCountLabel.textColor = [UIColor grayColor];
        readCountLabel.font = [UIFont systemFontOfSize:12];
        [readCountLabel setSingleLineAutoResizeWithMaxWidth:MAXFLOAT];
        [self.contentView addSubview:readCountLabel];
        self.myReadCountLabel = readCountLabel;
        
    }
    return self;
}

- (void)setArticle:(HFArticle *)article
{
    _article = article;
    
    self.myTitleLabel.text = article.title;
    [self.myimageView sd_setImageWithURL:[NSURL URLWithString:article.imageurl] placeholderImage:[UIImage imageNamed:@"image_placeholder"]];
    self.myMpNameLabel.text = article.mpname;
    self.myReadCountLabel.text = [NSString stringWithFormat:@"%zd", article.readcount];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.myimageView.sd_layout
    .topSpaceToView(self.contentView, 15)
    .rightSpaceToView(self.contentView, 15)
    .widthIs(100)
    .heightIs(70);
    
    self.myTitleLabel.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .topSpaceToView(self.contentView, 15)
    .rightSpaceToView(self.myimageView, 0)
    .autoHeightRatio(0);
    
    self.myMpNameLabel.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .bottomSpaceToView(self.contentView, 10)
    .widthIs(MAXFLOAT)
    .heightIs(15);
    
    self.myReadImageView.sd_layout
    .leftSpaceToView(self.myMpNameLabel, 5)
    .bottomSpaceToView(self.contentView, 10)
    .widthIs(20)
    .heightIs(15);
    
    self.myReadCountLabel.sd_layout
    .leftSpaceToView(self.myReadImageView, 5)
    .bottomSpaceToView(self.contentView, 10)
    .widthIs(MAXFLOAT)
    .heightIs(15);
    
}
@end
