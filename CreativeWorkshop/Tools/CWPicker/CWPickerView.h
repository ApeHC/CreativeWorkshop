//
//  CWPickerView.h
//  CreativeWorkshop
//
//  Created by HeChuang⌚️ on 2017/11/30.
//  Copyright © 2017年 HeChuang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^PickerSelectedItem)(NSString * selItem);

@interface CWPickerView : UIView

@property (nonatomic, copy) NSString * SelItem;

- (instancetype)initWithDataArray:(NSArray *)dataArray;

- (void)didFinishSelectedItem:(PickerSelectedItem)SelItem;

@end
