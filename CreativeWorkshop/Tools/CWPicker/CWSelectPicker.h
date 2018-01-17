//
//  CWSelectPicker.h
//  CreativeWorkshop
//
//  Created by HeChuang⌚️ on 2017/11/30.
//  Copyright © 2017年 HeChuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#define KPickerSize_W [UIScreen mainScreen].bounds.size.width
#define KPickerSize_H 220  //总高度
#define KPickerButton_H 44 //按钮高度
#define KPickerItemHeight 35 //PickView条目高度
#define SelButtonBgColor [UIColor colorWithRed:223/255.0 green:223/255.0 blue:225/255.0 alpha:1.0]
@interface CWSelectPicker : UIView
@property (nonatomic, strong) UIPickerView * pickerView;
@property (nonatomic, strong) UIButton * selButton;
@property (nonatomic, strong) UIButton * cancelButton;
@property (nonatomic, strong) NSArray  * pickerDataArray;
@property (nonatomic, copy  ) NSString * selectResult;
@end
