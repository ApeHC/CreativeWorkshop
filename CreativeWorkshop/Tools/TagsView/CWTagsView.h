//
//  CWTagsView.h
//  CreativeWorkshop
//
//  Created by HeChuang⌚️ on 2017/12/25.
//  Copyright © 2017年 HeChuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CWTagsView : UIView

@property (nonatomic, assign) BOOL isEditing;

@property (nonatomic, strong, readonly) NSMutableArray * selectedItem;

- (instancetype)initWithFrame:(CGRect)frame ItemArray:(NSArray *)itemArray;

- (void)CWTagsViewInsertWithItem:(NSString *)item;

@end
