//
//  HFArticle.h
//  HFHealth
//
//  Created by zhf on 16/5/16.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HFArticle : NSObject


/** 评论数 */
@property (nonatomic, assign) NSInteger commentcount;
/** 描述 */
@property (nonatomic, copy) NSString *myDescription;
/** h5 */
@property (nonatomic, copy) NSString *href;
/** 文章id */
@property (nonatomic, strong) NSNumber *myId;
/** 图片url */
@property (nonatomic, copy) NSString *imageurl;
/** <#注释#> */
@property (nonatomic, copy) NSString *mpname;
/** 阅读数 */
@property (nonatomic, assign) NSInteger readcount;
/** <#注释#> */
@property (nonatomic, assign) NSInteger sortindex;
/** <#注释#> */
@property (nonatomic, copy) NSString *sortindexv4;
/** 标题 */
@property (nonatomic, copy) NSString *title;
/** 文章类型 */
@property (nonatomic, assign) NSInteger myType;

@end
