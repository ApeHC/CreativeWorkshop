//
//  WaveViewController.m
//  CreativeWorkshop
//
//  Created by HeChuang⌚️ on 2017/11/30.
//  Copyright © 2017年 HeChuang. All rights reserved.
//

#import "WaveViewController.h"
#import "CWWaveAnimationView.h"

@interface WaveViewController ()

@end

@implementation WaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIButton * rightButton = [[UIButton alloc] init];
    rightButton.frame = CGRectMake(0, 0, 22, 22);
    [rightButton setTitle:@"" forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    UIBarButtonItem * right = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = right;
    
    CWWaveAnimationView * waveView = [[CWWaveAnimationView alloc] initWithFrame:self.view.bounds HeightPercent:0.5];
    waveView.gradualColorsArray = @[CWTHEMECOLOR_R, CWTHEMECOLOR_B];
    [self.view addSubview:waveView];
}

- (void)click:(UIButton *)sender{
    
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
