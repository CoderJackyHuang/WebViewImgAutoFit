//
//  ViewController.m
//  UIWebViewImgAutoFit
//
//  Created by huangyibiao on 16/3/7.
//  Copyright © 2016年 huangyibiao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
  webView.backgroundColor = [UIColor whiteColor];
  [self.view addSubview:webView];
  self.view.backgroundColor = [UIColor whiteColor];
  
  NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"];
  [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:path]]];

  webView.delegate = self;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
  NSString *js = @"function imgAutoFit() { \
     var imgs = document.getElementsByTagName('img'); \
     for (var i = 0; i < imgs.length; ++i) {\
        var img = imgs[i];   \
        img.style.maxWidth = %f;   \
     } \
  }";
  js = [NSString stringWithFormat:js, [UIScreen mainScreen].bounds.size.width - 20];
  
  [webView stringByEvaluatingJavaScriptFromString:js];
  [webView stringByEvaluatingJavaScriptFromString:@"imgAutoFit()"];
}

@end
