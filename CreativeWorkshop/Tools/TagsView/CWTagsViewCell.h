//
//  CWTagsViewCell.h
//  CreativeWorkshop
//
//  Created by HeChuang⌚️ on 2017/12/25.
//  Copyright © 2017年 HeChuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWTagsLayout.h"

@class CWTagsViewCell;

@protocol CWTagCellDeleteDeleagte <NSObject>

- (void)CWTagCellDeleteWithCell:(CWTagsViewCell *)cell;

@end

@interface CWTagsViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel * TagsLabel;

@property (nonatomic, strong) UIButton * DelButton;

@property (nonatomic, assign) BOOL isEditing;

@property (nonatomic, strong) CWTagsLayout * layout;

@property (nonatomic, weak) id<CWTagCellDeleteDeleagte> delegate;

@end
