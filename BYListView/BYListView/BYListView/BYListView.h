//
//  BYListView.h
//  BYListView
//
//  Created by Satelens on 2017/11/30.
//  Copyright © 2017年 Satelens. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BYListViewDelegate;
@protocol BYListViewDataSource;

typedef NS_ENUM(NSInteger, BYListViewSelectionStyle) {
    BYListViewSelectionStyleNone,
    BYListViewSelectionStyleGray,
};

@interface BYListView : UIView

@property(nonatomic, assign)id<BYListViewDataSource>dataSource;
@property(nonatomic, assign)id<BYListViewDelegate>delegate;
@property(nonatomic, assign)CGFloat columnWidth;
@property(nonatomic, assign)CGFloat rowHeight;
@property(nonatomic, strong)UIColor *backgroundColor UI_APPEARANCE_SELECTOR;
@property(nonatomic, strong)UIColor *separatorColor UI_APPEARANCE_SELECTOR;
@property(nonatomic, assign)BYListViewSelectionStyle selectionStyle;
@property(nonatomic, strong)UIColor *selectionColor;
@property(nonatomic, readonly)UIScrollView *contentScrollView;
- (void)reloadData;
- (void)reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation;
- (void)reloadRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;

@end

@protocol BYListViewDelegate <NSObject>

@optional
- (void)listView:(BYListView *)listView didSelectedRowAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)listView:(BYListView *)listView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)listView:(BYListView *)listView widthForCulumnAtIndex:(NSInteger)index;
- (CGFloat)listView:(BYListView *)listView heightForHeaderInSection:(NSInteger)section;
- (UIView *)listView:(BYListView *)listView reuseViewForHeader:(UIView *)reuseView inSection:(NSInteger)section inColumn:(NSInteger)inColumn;

@end

@protocol BYListViewDataSource <NSObject>

@required
- (NSInteger)listView:(BYListView *)listView numberOfRowsInSection:(NSInteger)section;
- (NSInteger)numberOfColumnsEachRowInListView:(BYListView *)listView ;
- (UIView *)listView:(BYListView *)listView reuseView:(UIView *)reuseView indexPath:(NSIndexPath *)indexPath inColumn:(NSInteger)inColumn;

@optional
- (NSInteger)numberOfSectionsInListView:(BYListView *)listView;

@end
