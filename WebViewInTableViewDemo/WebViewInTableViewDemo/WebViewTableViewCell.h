//
//  WebViewTableViewCell.h
//  WebViewInTableViewDemo
//
//  Created by Yun CHEN on 2018/6/20.
//  Copyright © 2018年 Yun CHEN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"

@class WebViewTableViewCell;

@protocol WebViewTableViewCellDelegate <NSObject>
-(void)webViewTableViewCell:(WebViewTableViewCell *)cell;
@end


@interface WebViewTableViewCell : UITableViewCell

@property(nonatomic,weak) id<WebViewTableViewCellDelegate> delegate;
@property(nonatomic,strong) DataModel *model;

@end
