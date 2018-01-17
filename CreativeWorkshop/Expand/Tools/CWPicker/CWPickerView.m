//
//  CWPickerView.m
//  CreativeWorkshop
//
//  Created by HeChuang⌚️ on 2017/11/30.
//  Copyright © 2017年 HeChuang. All rights reserved.
//

#import "CWPickerView.h"
#import "CWSelectPicker.h"

#define kCWPickerScreenSize_W [UIScreen mainScreen].bounds.size.width
#define kCWPickerScreenSize_H [UIScreen mainScreen].bounds.size.height

@interface CWPickerView ()
@property (nonatomic, strong) UIButton * bgButton;
@property (nonatomic, strong) CWSelectPicker * selectPicker;
@property (nonatomic, strong) PickerSelectedItem selectBlock;
@end

@implementation CWPickerView

- (instancetype)initWithDataArray:(NSArray *)dataArray{
    if (self = [super initWithFrame:[[UIScreen mainScreen] bounds]]) {
        [[[UIApplication sharedApplication] keyWindow] addSubview:self];
        //BackgroundButton
        self.bgButton = [[UIButton alloc] init];
        [self addSubview:self.bgButton];
        [self.bgButton addTarget:self
                          action:@selector(dismissPickerView)
                forControlEvents:UIControlEventTouchUpInside];
        self.bgButton.backgroundColor = [UIColor blackColor];
        self.bgButton.alpha = 0.0;
        self.bgButton.frame = CGRectMake(0, 0, kCWPickerScreenSize_W, kCWPickerScreenSize_H);
        //PickerView
        self.selectPicker = [[CWSelectPicker alloc] init];
        self.selectPicker.pickerDataArray = dataArray;
        [self addSubview:self.selectPicker];
        self.selectPicker.frame =  CGRectMake(0, kCWPickerScreenSize_H, kCWPickerScreenSize_W, KPickerSize_H);
        [self.selectPicker.cancelButton addTarget:self
                                           action:@selector(dismissPickerView)
                                 forControlEvents:UIControlEventTouchUpInside];
        [self.selectPicker.selButton addTarget:self
                                        action:@selector(SelectClick:)
                              forControlEvents:UIControlEventTouchUpInside];
        self.selectPicker.selectResult = dataArray.firstObject;
        [self showPickerView];
    }
    return self;
}

- (void)SelectClick:(id)sender{
    if (_selectBlock) {
        _selectBlock(_selectPicker.selectResult);
    }
    [self dismissPickerView];
}

- (void)didFinishSelectedItem:(PickerSelectedItem)SelItem{
    _selectBlock = SelItem;
}

- (void)showPickerView{
    __weak typeof(self) _weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        _weakSelf.selectPicker.frame = CGRectMake(0, kCWPickerScreenSize_H - KPickerSize_H, kCWPickerScreenSize_W, KPickerSize_H);
        _weakSelf.bgButton.alpha = 0.15;
    }];
}

- (void)dismissPickerView{
    __weak typeof(self) _weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        _weakSelf.selectPicker.frame = CGRectMake(0, kCWPickerScreenSize_H, kCWPickerScreenSize_W, KPickerSize_H);
        _weakSelf.bgButton.alpha = 0.0;
    } completion:^(BOOL finished) {
        [_weakSelf.selectPicker removeFromSuperview];
        _weakSelf.selectPicker = nil;
        [_weakSelf.bgButton removeFromSuperview];
        _weakSelf.bgButton = nil;
        [self removeFromSuperview];
    }];
}

- (void)dealloc{
    
}

@end
