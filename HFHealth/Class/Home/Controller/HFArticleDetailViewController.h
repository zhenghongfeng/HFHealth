//
//  HFArticleDetailViewController.h
//  HFHealth
//
//  Created by zhf on 16/5/19.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol ArticleDetailHtmlJSExportProtocol <JSExport>

JSExportAs
(Follow  /** handleFactorialCalculateWithNumber 作为js方法的别名 */,
 - (void)handleFunctionFollowWithFollowNumber:(NSNumber *)followNumber professorId:(NSNumber *)professorId
 );

@end


@class HFHomeAct;

@interface HFArticleDetailViewController : UIViewController

/** model */
@property (nonatomic, strong) HFHomeAct *homeAct;




@end
