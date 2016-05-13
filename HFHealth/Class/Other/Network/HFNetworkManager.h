//
//  HFNetwork.h
//  HFHealth
//
//  Created by zhf on 16/5/13.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HFNetworkManager : NSObject

+ (HFNetworkManager *)sharedNetworkManager;


- (void)getRequestWithUrlString:(NSString *)urlString;


@end
