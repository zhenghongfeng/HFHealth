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

//- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
//{
//    NSURL *url = [request URL];
//    if([[url scheme] isEqualToString:@"devzeng"]) {
//        //处理JavaScript和Objective-C交互
//        if([[url host] isEqualToString:@"login"])
//        {
//            //获取URL上面的参数
//            NSDictionary *params = [self getParams:[url query]];
//            BOOL status = [self login:[params objectForKey:@"name"] password:[params objectForKey:@"password"]];
//            if(status)
//            {
//                //调用JS回调
//                [webView stringByEvaluatingJavaScriptFromString:@"alert('登录成功!')"];
//            }
//            else
//            {
//                [webView stringByEvaluatingJavaScriptFromString:@"alert('登录失败!')"];
//            }
//        }
//        return NO;
//    }
//    return YES;
//}



@end
