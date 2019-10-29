//
//  ViewController.m
//  BYListView
//
//  Created by Satelens on 2017/11/30.
//  Copyright © 2017年 Satelens. All rights reserved.
//

#import "ViewController.h"
#import "BYListView.h"
#import "MJRefresh.h"

@interface ViewController () <BYListViewDelegate, BYListViewDataSource>

@property (nonatomic, strong) BYListView *listView;

@property (nonatomic, strong) NSArray *datas;

@end

@implementation ViewController
// 
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"BYListView";
    self.datas = @[@"第一行", @"第二行", @"第三行", @"第四行", @"第五行", @"第六行", @"第七行", @"第八行", @"第九行", @"第十行", @"第十一行", @"第十二行", @"第十三行", @"第十四行", @"第十五行"];
    
    [[BYListView appearance] setSeparatorColor:[UIColor grayColor]];
    [[BYListView appearance] setBackgroundColor:[UIColor whiteColor]];
    
    _listView = [[BYListView  alloc] initWithFrame:CGRectMake(0,  [[UIApplication sharedApplication] statusBarFrame].size.height + 44, self.view.frame.size.width, self.view.frame.size.height - [[UIApplication sharedApplication] statusBarFrame].size.height - 44)];
    _listView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _listView.dataSource = self;
    _listView.delegate = self;
    _listView.selectionStyle = BYListViewSelectionStyleNone;
    
    _listView.selectionColor = [UIColor greenColor];
    [self.view addSubview:_listView];
    
    _listView.contentScrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [_listView reloadData];
            [_listView.contentScrollView.mj_header endRefreshing];
        });
    }];
    _listView.contentScrollView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [_listView.contentScrollView.mj_footer endRefreshing];
        });
    }];
}


#pragma BYListViewDelegate
-(void)listView:(BYListView *)listView didSelectedRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 点击某一行
}
-(CGFloat)listView:(BYListView *)listView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
-(CGFloat)listView:(BYListView *)listView widthForCulumnAtIndex:(NSInteger)index
{
    if (index == 0) {
        return 90;
    } else {
        return 60;
    }
}
-(CGFloat)listView:(BYListView *)listView heightForHeaderInSection:(NSInteger)section
{
    return 25;
}

-(UIView *)listView:(BYListView *)listView reuseViewForHeader:(UIView *)reuseView inSection:(NSInteger)section inColumn:(NSInteger)inColumn
{
    NSArray *arr = @[@"aa",@"bb",@"cc",@"dd",@"ee",@"ff",@"aa",@"bb",@"cc",@"dd",@"ee",@"ff",@"aa"];
    if (!reuseView) {
        reuseView = [[UILabel alloc] init];
    }
    
    ((UILabel *)reuseView).text = arr[inColumn];
    
    ((UILabel *)reuseView).textColor = [UIColor whiteColor];
    ((UILabel *)reuseView).textAlignment = NSTextAlignmentRight;
    reuseView.backgroundColor = [UIColor grayColor];
    
    return reuseView;
}

#pragma BYListViewDataSource
-(NSInteger)numberOfSectionsInListView:(BYListView *)listView
{
    return 1;
}
-(NSInteger)listView:(BYListView *)listView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}
-(NSInteger)numberOfColumnsEachRowInListView:(BYListView *)listView
{
    return 6 * 2;
}
-(UIView *)listView:(BYListView *)listView reuseView:(UIView *)reuseView indexPath:(NSIndexPath *)indexPath inColumn:(NSInteger)inColumn
{
    
    if (reuseView==nil) {
        reuseView = [[UILabel alloc]init];
        
    }
    if (inColumn == 0) {
        ((UILabel *)reuseView).backgroundColor = [UIColor redColor];
        ((UILabel *)reuseView).text = [NSString stringWithFormat:@"%@",self.datas[indexPath.row]];
        ((UILabel *)reuseView).textColor = [UIColor whiteColor];
    }else
    {
        ((UILabel *)reuseView).backgroundColor = [UIColor clearColor];
        ((UILabel *)reuseView).text = [NSString stringWithFormat:@"%ld",indexPath.section + inColumn];
        ((UILabel *)reuseView).textColor = [UIColor blackColor];
    }
    ((UILabel *)reuseView).textAlignment = NSTextAlignmentRight;
    
    return reuseView;
}


@end
