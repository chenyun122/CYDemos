//
//  DataModel.h
//  WebViewInTableViewDemo
//
//  Created by Yun CHEN on 2018/6/21.
//  Copyright © 2018年 Yun CHEN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataModel : NSObject

@property(nonatomic,assign) NSInteger contentId;
@property(nonatomic,copy) NSString *content;
@property(nonatomic,assign) CGFloat contentHeight;

+ (NSArray<DataModel *> *)parseDictionaries:(NSArray *)dictionaries;
- (void)parseDictionary:(NSDictionary *)dictionary;

@end
