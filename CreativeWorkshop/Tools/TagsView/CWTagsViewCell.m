//
//  CWTagsViewCell.m
//  CreativeWorkshop
//
//  Created by HeChuang⌚️ on 2017/12/25.
//  Copyright © 2017年 HeChuang. All rights reserved.
//

#import "CWTagsViewCell.h"

@implementation CWTagsViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundView.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor blueColor].CGColor;
        [self.contentView addSubview:self.TagsLabel];
        [self.contentView addSubview:self.DelButton];
    }
    return self;
}

- (void)setLayout:(CWTagsLayout *)layout{
    _layout = layout;
    self.TagsLabel.text = layout.tagStr;
    CGRect frame = self.contentView.bounds;
    frame.size.width -= kCWTagsTitleSpace * 2;
    frame.size.height -= kCWTagsTitleSpace * 2;
    frame.origin.x += kCWTagsTitleSpace;
    frame.origin.y += kCWTagsTitleSpace;
    self.TagsLabel.frame = frame;
    
    self.DelButton.frame = CGRectMake(0, 0, 12, 12);
    self.DelButton.center = CGPointMake(CGRectGetMaxX(self.bounds), CGRectGetMinY(self.bounds));
    self.DelButton.layer.cornerRadius = 6;
    self.DelButton.hidden = _isEditing ? NO : YES;
}

- (void)DelAction:(UIButton *)sender{
    if ([_delegate respondsToSelector:@selector(CWTagCellDeleteWithCell:)]) {
        [_delegate CWTagCellDeleteWithCell:self];
    }
}

#pragma mark - lazyload
- (UILabel *)TagsLabel{
    if (_TagsLabel == nil) {
        _TagsLabel = [[UILabel alloc] init];
        _TagsLabel.backgroundColor = [UIColor clearColor];
        _TagsLabel.font = [UIFont systemFontOfSize:kCWTagsTitleFont];
        _TagsLabel.textAlignment = NSTextAlignmentCenter;
        _TagsLabel.textColor = [UIColor blueColor];
    }
    return _TagsLabel;
}

- (UIButton *)DelButton{
    if (_DelButton == nil) {
        _DelButton = [[UIButton alloc] init];
        _DelButton.backgroundColor = [UIColor whiteColor];
        [_DelButton setImage:[UIImage imageNamed:@"delete.png"] forState:UIControlStateNormal];
        [_DelButton addTarget:self action:@selector(DelAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _DelButton;
}

#pragma mark - 使按钮超出父视图范围仍可点击
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView * view = [super hitTest:point withEvent:event];
    if (view == nil) {
        CGPoint newPoint = [self.DelButton convertPoint:point fromView:self];
        if (CGRectContainsPoint(self.DelButton.bounds, newPoint)) {
            view = self.DelButton;
        }
    }
    return view;
}

- (void)awakeFromNib {
    [super awakeFromNib];

}

@end
