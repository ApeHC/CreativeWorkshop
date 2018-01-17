//
//  CWTagsLayout.h
//  CreativeWorkshop
//
//  Created by HeChuang⌚️ on 2017/12/25.
//  Copyright © 2017年 HeChuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kCWTagsViewScreenSize_W [UIScreen mainScreen].bounds.size.width
#define kCWTagsTitleFont 15 //字号
#define kCWTagsTitleSpace 5 //label与cell边框的间距

@interface CWTagsLayout : NSObject

@property (nonatomic, copy) NSString * tagStr;

@property (nonatomic, assign) CGFloat titleWidth;

@property (nonatomic, assign) CGFloat titleHeight;

- (instancetype)initWithCWTagStr:(NSString *)tagStr;

@end
