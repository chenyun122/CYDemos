//
//  DataModel.m
//  WebViewInTableViewDemo
//
//  Created by Yun CHEN on 2018/6/21.
//  Copyright © 2018年 Yun CHEN. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

+ (NSArray<DataModel *> *)parseDictionaries:(NSArray *)dictionaries {
    NSMutableArray *models = [NSMutableArray array];
    for (NSDictionary *dict in dictionaries) {
        DataModel *model = [[DataModel alloc] init];
        [model parseDictionary:dict];
        [models addObject:model];
    }
    
    return models;
}

- (void)parseDictionary:(NSDictionary *)dictionary {
    self.contentId = [[dictionary objectForKey:@"id"] integerValue];
    self.content = [dictionary objectForKey:@"content"];
}

@end
