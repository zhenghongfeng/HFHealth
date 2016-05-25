//
//  HFArticleDetailViewController.m
//  HFHealth
//
//  Created by zhf on 16/5/19.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import "HFArticleDetailViewController.h"
#import "HFHomeAct.h"

@interface HFArticleDetailViewController () <UIWebViewDelegate, ArticleDetailHtmlJSExportProtocol>

@property (nonatomic, strong) JSContext *context;

@end

@implementation HFArticleDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"文章详情";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"model == %@", self.homeAct);
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    webView.delegate = self;
    NSString *urlString = [NSString stringWithFormat:@"%@?from=app&accesstoken=%@&apiversion=%@&appversion=%@&deviceid=%@&devicename=%@&devicetype=%@", self.homeAct.url, TokenGet, apiversion, AppVersion, DeviceId, DeviceName, DeviceType];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    
    JSContext *context = [[JSContext alloc] init];
    context.exceptionHandler = ^(JSContext *con, JSValue *exception) {
        NSLog(@"%@", exception);
        con.exception = exception;
    };
    
    
    context[@"log"] = ^() {
        NSArray *args = [JSContext currentArguments];
        for (id obj in args) {
            NSLog(@"%@",obj);
        }
    };
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    //保存上次加载的页面里的字体大小  以备下次没网的时候进行加载
//    NSArray *urlArr = [self.url componentsSeparatedByString:@"&fontsize="];
//    if (urlArr.count==2)
//    {
//        NSString *lastFontSizeStr = [urlArr lastObject];
//        LastH5FontSizeSave(lastFontSizeStr);
//        fontString = lastFontSizeStr;
//    }
//    
//    NSLog(@"fontstringwebload = %@",fontString);
//    //
    _context = [[JSContext alloc] init];
    _context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    NSLog(@"_context = %@",_context);
    
    _context[@"kk"] = self;
}

#pragma mark - 关注和取消关注的交互方法
- (void)handleFunctionFollowWithFollowNumber:(NSNumber *)followNumber professorId:(NSNumber *)professorId
{
    NSLog(@"followNumber = %@",followNumber);
    NSLog(@"professorId = %@",professorId);
}




@end
