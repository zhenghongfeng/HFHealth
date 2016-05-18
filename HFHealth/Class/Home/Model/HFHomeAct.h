//
//  HFHomeAct.h
//  HFHealth
//
//  Created by zhf on 16/5/17.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HFHomeAct : NSObject

/** <#注释#> */
@property (nonatomic, copy) NSString *myDescription;
/** <#注释#> */
@property (nonatomic, strong) NSNumber *myId;
/** <#注释#> */
@property (nonatomic, copy) NSString *imageurl;
/** <#注释#> */
@property (nonatomic, copy) NSString *title;
/** 类型 */
@property (nonatomic, assign) NSInteger type;
/** <#注释#> */
@property (nonatomic, copy) NSString *url;
@end
