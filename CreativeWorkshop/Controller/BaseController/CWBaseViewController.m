//
//  CWBaseViewController.m
//  CreativeWorkshop
//
//  Created by HeChuang⌚️ on 2017/11/29.
//  Copyright © 2017年 HeChuang. All rights reserved.
//

#import "CWBaseViewController.h"
#import <UINavigationController+FDFullscreenPopGesture.h>
@interface CWBaseViewController ()

@end

@implementation CWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.barTintColor = CWTHEMECOLOR_G;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationController.fd_fullscreenPopGestureRecognizer.enabled = YES;
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
