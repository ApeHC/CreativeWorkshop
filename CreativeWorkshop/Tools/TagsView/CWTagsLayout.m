//
//  CWTagsLayout.m
//  CreativeWorkshop
//
//  Created by HeChuang⌚️ on 2017/12/25.
//  Copyright © 2017年 HeChuang. All rights reserved.
//

#import "CWTagsLayout.h"

@interface CWTagsLayout ()

@end

@implementation CWTagsLayout

- (instancetype)initWithCWTagStr:(NSString *)tagStr{
    if (self = [super init]) {
        _tagStr = tagStr;
        [self layout];
    }
    return self;
}

- (void)layout{
    _titleWidth = [self calculateWidthWithString:_tagStr TextFont:kCWTagsTitleFont] + kCWTagsTitleSpace * 2;
    _titleHeight = kCWTagsTitleFont + kCWTagsTitleSpace * 2;
}

- (CGFloat)calculateWidthWithString:(NSString *)string TextFont:(NSInteger)font{
    CGSize stringSize = [string boundingRectWithSize:CGSizeMake(kCWTagsViewScreenSize_W, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:font]} context:nil].size;
    return stringSize.width;
}

@end
