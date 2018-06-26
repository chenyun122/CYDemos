//
//  WebViewTableViewCell.m
//  WebViewInTableViewDemo
//
//  Created by Yun CHEN on 2018/6/20.
//  Copyright © 2018年 Yun CHEN. All rights reserved.
//

#import "WebViewTableViewCell.h"
#import <WebKit/WebKit.h>


@interface WebViewTableViewCell() <WKNavigationDelegate,WKScriptMessageHandler> {
    WKWebView *webView;
}

@end

@implementation WebViewTableViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    config.userContentController = [[WKUserContentController alloc] init];
    [config.userContentController addScriptMessageHandler:self name:@"AppHandler"];

    webView = [[WKWebView alloc] initWithFrame:self.bounds configuration:config];
    webView.scrollView.scrollEnabled = NO;
    webView.navigationDelegate = self;
    [self addSubview:webView];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(DataModel *)model {
    if (![_model isEqual:model]) {
        _model = model;
        
        if (model.contentHeight <= 0) {
            webView.frame = CGRectMake(0, 0, self.contentView.frame.size.width, 5);
            NSString *jsFormat = @"window.addEventListener('load', function() { window.webkit.messageHandlers.AppHandler.postMessage({id:%d,documentHeight: document.body.scrollHeight}); });";
            NSString *js = [NSString stringWithFormat:jsFormat,self.model.contentId];
            WKUserScript *userScript = [[WKUserScript alloc] initWithSource:js injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:YES];
            [webView.configuration.userContentController removeAllUserScripts];
            [webView.configuration.userContentController addUserScript:userScript];
        }
        else{
            webView.frame = CGRectMake(0, 0, self.contentView.frame.size.width, model.contentHeight);
        }
        
        NSString *htmlFormat = @"<html><meta name=\"viewport\" content=\"initial-scale=1.0\"/><head><style>img{max-width:100%%;}</style></head><body>%@</body></html>";
        [webView loadHTMLString:[NSString stringWithFormat:htmlFormat,_model.content] baseURL:nil];
    }
}

#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"error:%@",error.localizedDescription);
}


#pragma mark - WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    NSInteger contentId = [[message.body objectForKey:@"id"] integerValue];
    if (self.model.contentId == contentId) {
        self.model.contentHeight = [[message.body objectForKey:@"documentHeight"] floatValue];
        NSLog(@"document height:%f",self.model.contentHeight);
        
        webView.frame = CGRectMake(0, 0,  self.contentView.frame.size.width, self.model.contentHeight);
        if (self.delegate != nil && [self.delegate respondsToSelector:@selector(webViewTableViewCell:)]) {
            [self.delegate webViewTableViewCell:self];
        }
    }
}

@end
