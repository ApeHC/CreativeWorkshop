//
//  CWTagsView.m
//  CreativeWorkshop
//
//  Created by HeChuang⌚️ on 2017/12/25.
//  Copyright © 2017年 HeChuang. All rights reserved.
//

#import "CWTagsView.h"
#import "CWTagsViewCell.h"
#import "CWCellFlowLayout.h"

@interface CWTagsView ()<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
CWTagCellDeleteDeleagte>
@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) CWCellFlowLayout * FlowLayout;
@property (nonatomic, strong) NSMutableArray * ItemsArray;
@end

@implementation CWTagsView

- (instancetype)initWithFrame:(CGRect)frame ItemArray:(NSArray *)itemArray{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        for (NSString * tagStr in itemArray) {
            CWTagsLayout * layout = [[CWTagsLayout alloc] initWithCWTagStr:tagStr];
            [self.ItemsArray addObject:layout];
        }
        [self addSubview:self.collectionView];
        [self.collectionView reloadData];
    }
    return self;
}

#pragma mark - UICollectionViewDelegate & UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _ItemsArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CWTagsLayout * layout = self.ItemsArray[indexPath.row];
    return CGSizeMake(layout.titleWidth, layout.titleHeight);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CWTagsViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CWTagsCell"
                                                                      forIndexPath:indexPath];
    cell.layout = self.ItemsArray[indexPath.row];
    cell.isEditing = _isEditing;
    cell.delegate = self;
    return cell;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CWTagsViewCell * cell = (id)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor blueColor];
    cell.TagsLabel.textColor = [UIColor whiteColor];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    CWTagsViewCell * cell = (id)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.TagsLabel.textColor = [UIColor blueColor];
}

#pragma mark - Delete
- (void)CWTagCellDeleteWithCell:(CWTagsViewCell *)cell{
    NSIndexPath * indexPath = [self.collectionView indexPathForCell:cell];
    [self.ItemsArray removeObjectAtIndex:indexPath.row];
    [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
}

#pragma mark - Insert
- (void)CWTagsViewInsertWithItem:(NSString *)item{
    CWTagsLayout * layout = [[CWTagsLayout alloc] initWithCWTagStr:item];
    [self.ItemsArray insertObject:layout atIndex:0];
    [self.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:0 inSection:0]]];
}

#pragma mark- Set
- (void)setIsEditing:(BOOL)isEditing{
    _isEditing = isEditing;
    for (NSInteger i = 0; i < _ItemsArray.count; i++) {
        CWTagsViewCell * cell = (CWTagsViewCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        cell.DelButton.hidden = !isEditing;
    }
}

#pragma mark- Get
- (NSMutableArray *)selectedItem{
    NSMutableArray * selectArray = [[NSMutableArray alloc] init];
    for (NSIndexPath * indexPath in self.collectionView.indexPathsForSelectedItems) {
        NSString * str = ((CWTagsLayout *)self.ItemsArray[indexPath.row]).tagStr;
        [selectArray addObject:str];
    }
    return selectArray;
}

#pragma mark - lazyload
- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        _FlowLayout = [[CWCellFlowLayout alloc] initWithCellType:AlignTypeWithLeft BetweenOfCell:8.0];
        CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        _collectionView = [[UICollectionView alloc] initWithFrame:rect
                                             collectionViewLayout:_FlowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.allowsMultipleSelection = YES;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[CWTagsViewCell class]
            forCellWithReuseIdentifier:@"CWTagsCell"];
    }
    return _collectionView;
}

- (NSMutableArray *)ItemsArray{
    if (_ItemsArray == nil) {
        _ItemsArray = [[NSMutableArray alloc] init];
    }
    return _ItemsArray;
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];

}

@end
