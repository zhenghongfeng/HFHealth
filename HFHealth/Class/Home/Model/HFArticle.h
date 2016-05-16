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
/** <#注释#> */
@property (nonatomic, copy) NSString *href;
/** <#注释#> */
@property (nonatomic, assign) NSInteger id;
/** <#注释#> */
@property (nonatomic, copy) NSString *imageurl;
/** <#注释#> */
@property (nonatomic, copy) NSString *mpname;
/** <#注释#> */
@property (nonatomic, assign) NSInteger readcount;
/** <#注释#> */
@property (nonatomic, assign) NSInteger sortindex;
/** <#注释#> */
@property (nonatomic, copy) NSString *sortindexv4;
/** <#注释#> */
@property (nonatomic, copy) NSString *title;
/** <#注释#> */
@property (nonatomic, assign) NSInteger type;

//- (instancetype)initWithDic:(NSDictionary *)dic;
//
//+ (instancetype)dossierWithDic:(NSDictionary *)dic;
//
//// 字典数组转模型数组
//+ (NSMutableArray *)arrayWithDossierList:(NSArray *)array;

@end
