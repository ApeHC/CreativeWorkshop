//
//  PIckerViewController.m
//  CreativeWorkshop
//
//  Created by HeChuang⌚️ on 2017/11/30.
//  Copyright © 2017年 HeChuang. All rights reserved.
//

#import "PickerViewController.h"
#import "CWPickerView.h"

@interface PickerViewController ()
@property (nonatomic, strong) NSArray * pickerDataArray;
@end

@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIButton * SelButton = [[UIButton alloc] init];
    SelButton.frame = CGRectMake(0, CW_NAV_HEIGHT, 100, 44);
    SelButton.center = self.view.center;
    SelButton.backgroundColor = [UIColor whiteColor];
    SelButton.layer.borderWidth = 1.0;
    SelButton.layer.borderColor = [UIColor blueColor].CGColor;
    [SelButton setTitle:@"PickerView" forState:UIControlStateNormal];
    [SelButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [SelButton addTarget:self
                  action:@selector(selClick:)
        forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:SelButton];
}

- (void)selClick:(UIButton *)sender{
    CWPickerView * picker = [[CWPickerView alloc] initWithDataArray:self.pickerDataArray];
    [picker didFinishSelectedItem:^(NSString *selItem) {
        NSLog(@"PickerView Select : %@", selItem);
    }];
}

- (NSArray *)pickerDataArray{
    if (_pickerDataArray == nil) {
        _pickerDataArray = @[@"PlayStation",
                             @"Steam",
                             @"Xbox",
                             @"Nintendo Switch"];
    }
    return _pickerDataArray;
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
