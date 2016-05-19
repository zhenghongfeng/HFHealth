//
//  HFArticleDetailViewController.m
//  HFHealth
//
//  Created by zhf on 16/5/19.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import "HFArticleDetailViewController.h"
#import "HFHomeAct.h"

@interface HFArticleDetailViewController () <UIWebViewDelegate>

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
    NSURL *url = [NSURL URLWithString:self.homeAct.url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    
    //获取页面title
    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    NSLog(@"title == %@", title);
    
    //获取当前的URL
    NSString *currenturl = [webView stringByEvaluatingJavaScriptFromString:@"document.location.href"];
    NSLog(@"currenturl == %@", currenturl);
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
