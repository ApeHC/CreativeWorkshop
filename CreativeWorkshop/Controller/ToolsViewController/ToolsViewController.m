//
//  ToolsViewController.m
//  CreativeWorkshop
//
//  Created by HeChuang⌚️ on 2017/11/30.
//  Copyright © 2017年 HeChuang. All rights reserved.
//

#import "ToolsViewController.h"

#define KTableViewCell_H 44

@interface ToolsViewController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
@property (strong, nonatomic) UITableView * tabelView;
@property (strong, nonatomic) NSMutableArray * titleArray;
@property (strong, nonatomic) NSMutableArray * ClassArray;
@end

@implementation ToolsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleArray = @[].mutableCopy;
    self.ClassArray = @[].mutableCopy;
    [self createTableView];
}

#pragma mark - CreateUI
- (void)createTableView{
    self.tabelView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds
                                                  style:UITableViewStylePlain];
    self.tabelView.backgroundColor = [UIColor whiteColor];
    self.tabelView.showsVerticalScrollIndicator = NO;
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.tabelView];
    [self AddtableViewCellWithTitle:@"滚动标签"
                              Class:@"PickerViewController"];
    [self AddtableViewCellWithTitle:@"波浪动画"
                              Class:@"WaveViewController"];
    [self AddtableViewCellWithTitle:@"标签操作"
                              Class:@"TagsViewController"];
    [self.tabelView reloadData];
}

- (void)AddtableViewCellWithTitle:(NSString *)title
                            Class:(NSString *)class{
    [_titleArray addObject:title];
    [_ClassArray addObject:class];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return KTableViewCell_H;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID;
    UITableViewCell * Cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (Cell == nil) {
        Cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    Cell.textLabel.text = _titleArray[indexPath.row];
    return Cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tabelView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController * vc = [[NSClassFromString(_ClassArray[indexPath.row]) alloc] init];
    vc.title = _titleArray[indexPath.row];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView
                     withVelocity:(CGPoint)velocity
              targetContentOffset:(inout CGPoint *)targetContentOffset{
    [self.navigationController setNavigationBarHidden:velocity.y > 0 animated:YES];
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
