//
//  LiveViewController.m
//  CreativeWorkshop
//
//  Created by HeChuang⌚️ on 2018/1/8.
//  Copyright © 2018年 HeChuang. All rights reserved.
//

#import "LiveViewController.h"
#import "CWHTTPRequest.h"

@interface LiveViewController ()<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) NSMutableArray * dataArray;
@end

@implementation LiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self StartMonitoringNetwork];
    [self createUI];
    [self loadData];
}

- (void)createUI{
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.delegate = self;
    _collectionView.dataSource= self;
    [self.view addSubview:_collectionView];
}

- (void)loadData{
    [CWHTTPRequest getLiveListWithSuccess:^(id response) {
        NSLog(@"%@", response);
    } Failure:^(NSError *error) {
        
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, 100);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

- (void)StartMonitoringNetwork{
    [HCNetworking networkStatusWithBlock:^(HCNetworkStatusType status) {
        switch (status) {
            case HCNetworkStatusUnknown:
            case HCNetworkStatusNotReachable:
                CWLog(@"无网络");
                break;
            case HCNetworkStatusReachableViaWiFi:
                CWLog(@"WiFi");
                break;
            case HCNetworkStatusReachableViaWWAN:
                CWLog(@"移动数据");
                break;
        }
    }];
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
