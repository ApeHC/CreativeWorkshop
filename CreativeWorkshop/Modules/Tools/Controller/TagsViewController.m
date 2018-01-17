//
//  TagsViewController.m
//  CreativeWorkshop
//
//  Created by HeChuang⌚️ on 2017/11/30.
//  Copyright © 2017年 HeChuang. All rights reserved.
//

#import "TagsViewController.h"
#import "CWTagsView.h"

#define kBUTTON_H 44
@interface TagsViewController ()
@property (nonatomic, strong) NSArray * dataArray;
@property (nonatomic, strong) CWTagsView * TagView;
@end

@implementation TagsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CGFloat buttonY = CW_ScreenSize_H - kBUTTON_H - CW_HomBar_H;
    //Edit
    UIButton * leftButton = [[UIButton alloc] init];
    leftButton.frame = CGRectMake(0, buttonY, CW_ScreenSize_W * 0.5, kBUTTON_H);
    [leftButton setTitle:@"Edit" forState:UIControlStateNormal];
    [leftButton setTitle:@"Cancel" forState:UIControlStateSelected];
    [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [leftButton addTarget:self action:@selector(leftClick:) forControlEvents:UIControlEventTouchUpInside];
    //Insert
    UIButton * rightButton = [[UIButton alloc] init];
    rightButton.frame = CGRectMake(CW_ScreenSize_W * 0.5, buttonY,
                                   CW_ScreenSize_W * 0.5, kBUTTON_H);
    [rightButton setTitle:@"Insert" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [rightButton addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    //
    CGRect rect = self.view.bounds;
    rect.size.height -= kBUTTON_H;
    _TagView = [[CWTagsView alloc] initWithFrame:rect ItemArray:self.dataArray];
    [self.view addSubview:_TagView];
    [self.view addSubview:leftButton];
    [self.view addSubview:rightButton];
}

- (void)leftClick:(UIButton *)sender{
    sender.selected = !sender.isSelected;
    _TagView.isEditing = sender.isSelected ? YES : NO;
}

- (void)rightClick:(UIButton *)sender{
    [_TagView CWTagsViewInsertWithItem:@"插插插插插插插插"];
}

- (NSArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = @[@"近日苹果更新",
                       @"AppStore的",
                       @"平台",
                       @"条例在支付板块一栏",
                       @"指出App内容中包含的战利",
                       @"或是",
                       @"其它随机获得道具的机制",
                       @"必须",
                       @"在消费者购买",
                       @"之前就公开每一类物品的获取机率"];
    }
    return _dataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
