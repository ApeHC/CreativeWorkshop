//
//  CreativeWorkshop.h
//  CreativeWorkshop
//
//  Created by HeChuang⌚️ on 2017/11/29.
//  Copyright © 2017年 HeChuang. All rights reserved.
//

#ifndef CreativeWorkshop_h
#define CreativeWorkshop_h

#ifdef DEBUG
#define CWLog(...) NSLog(__VA_ARGS__)
#else
#define CWLog(...)
#endif

//URL
#define CWURL_Live @"http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1"

//AppKey

//Color
#define CWTHEMECOLOR_G [UIColor colorWithRed:143.0/255.0 green:250.0/255 blue:11.0/255.0  alpha:1.0]
#define CWTHEMECOLOR_B [UIColor colorWithRed:40.0/255.0  green:235.0/255 blue:212.0/255.0 alpha:1.0]
#define CWTHEMECOLOR_R [UIColor colorWithRed:248.0/255.0 green:49.0/255  blue:120.0/255.0 alpha:1.0]

//UIScreen SIZE
#define CW_ScreenSize_W [UIScreen mainScreen].bounds.size.width
#define CW_ScreenSize_H [UIScreen mainScreen].bounds.size.height
#define CW_KEYBOARD_HEIGHT 220
#define CW_NAV_HEIGHT ([UIScreen mainScreen].bounds.size.height == 812 ? 88 : 64)
#define CW_TABBAR_HEIGHT ([UIScreen mainScreen].bounds.size.height == 812 ? 83 : 49)
#define CW_HomBar_H ([UIScreen mainScreen].bounds.size.height == 812 ? 34 : 0)

//DefaultAlert
#define HS_ALERT_NORMAL(AlertTitle, Message) \
UIAlertController * alert = [UIAlertController alertControllerWithTitle:AlertTitle\
message:Message\
preferredStyle:UIAlertControllerStyleAlert];\
UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"确定"\
style:UIAlertActionStyleCancel\
handler:nil];\
[alert addAction:cancelAction];\
[self presentViewController:alert animated:YES completion:nil]
#endif /* CreativeWorkshop_h */
