//
//  CWSelectPicker.m
//  CreativeWorkshop
//
//  Created by HeChuang⌚️ on 2017/11/30.
//  Copyright © 2017年 HeChuang. All rights reserved.
//

#import "CWSelectPicker.h"

@interface CWSelectPicker ()<UIPickerViewDelegate, UIPickerViewDataSource>

@end

@implementation CWSelectPicker

- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.backgroundColor = [UIColor whiteColor];
    self.cancelButton.frame = CGRectMake(0, 0, KPickerSize_W * 0.5, KPickerButton_H);
    self.selButton.frame = CGRectMake(KPickerSize_W * 0.5, 0, KPickerSize_W * 0.5, KPickerButton_H);
    self.pickerView.frame = CGRectMake(0, KPickerButton_H, KPickerSize_W, KPickerSize_H - KPickerButton_H);
    [self addSubview:self.cancelButton];
    [self addSubview:self.selButton];
    [self addSubview:self.pickerView];
}

#pragma mark - UIPickerViewDataSource & UIPickerViewDelegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _pickerDataArray.count;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return KPickerItemHeight;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.pickerDataArray[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.selectResult = self.pickerDataArray[row];
}

- (UIPickerView *)pickerView{
    if (_pickerView == nil) {
        _pickerView = [[UIPickerView alloc] init];
        _pickerView.backgroundColor = [UIColor whiteColor];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
        [_pickerView selectRow:0 inComponent:0 animated:YES];
    }
    return _pickerView;
}

- (UIButton *)cancelButton{
    if (_cancelButton == nil) {
        _cancelButton = [[UIButton alloc] init];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cancelButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        [_cancelButton setBackgroundColor:SelButtonBgColor];
    }
    return _cancelButton;
}

- (UIButton *)selButton{
    if (_selButton == nil) {
        _selButton = [[UIButton alloc] init];
        [_selButton setTitle:@"确认" forState:UIControlStateNormal];
        [_selButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_selButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        [_selButton setBackgroundColor:SelButtonBgColor];
    }
    return _selButton;
}

- (void)dealloc{
    
}

@end
