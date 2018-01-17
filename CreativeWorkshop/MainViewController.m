//
//  MainViewController.m
//  CreativeWorkshop
//
//  Created by HeChuang⌚️ on 2018/1/8.
//  Copyright © 2018年 HeChuang. All rights reserved.
//

#import "MainViewController.h"
#import "CWBaseViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray * titleArray = @[@"Tools", @"Live", @"Other"];
    NSArray * iconArray  = @[@"Tools", @"Live", @"Other"];
    NSArray * classArray = @[@"ToolsViewController", @"LiveViewController", @"OtherViewController"];
    NSMutableArray * controllerArray = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < titleArray.count; i++) {
        CWBaseViewController * controller = [[NSClassFromString(classArray[i]) alloc] init];
        UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:controller];
        controller.title = titleArray[i];
        controller.tabBarItem.image = [self OriginImageWithIconName:iconArray[i]];
        [controllerArray addObject:nav];
    }
    self.viewControllers = controllerArray;
    self.tabBar.tintColor = [UIColor blackColor];
}

- (UIImage *)OriginImageWithIconName:(NSString *)iconName{
    UIGraphicsBeginImageContext(CGSizeMake(24, 24));//size 为CGSize类型，即你所需要的图片尺寸
    UIImage * image = [UIImage imageNamed:iconName];
    [image drawInRect:CGRectMake(0, 0, 24, 24)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;   //返回的就是已经改变的图片
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
