//
//  UIBarButtonItem+Extension.h
//  GameShow
//
//  Created by zhf on 15/11/24.
//  Copyright © 2015年 郑洪锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action;

@end
