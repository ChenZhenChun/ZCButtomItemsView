//
//  ZCButtomItemsView.h
//  
//
//  Created by gulu on 2018/10/9.
//  Copyright © 2018年 gulu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCButtomItemsView : UIView
@property (nonatomic,assign) CGFloat    width;//view的宽度
@property (nonatomic,assign) NSInteger  count;//总数
@property (nonatomic,assign) CGFloat    itemH;//item的高度
@property (nonatomic,assign) CGFloat    itemLRContentInsets;//item文字左右两边内间距总和
@property (nonatomic,assign) CGFloat    lineSpace;//item纵向间距
@property (nonatomic,assign) CGFloat    interitemSpace;//item横向间距

/**
 使用构造函数初始化
 
 @param width view的宽度（高度由内容的多少决定）
 @param count items总个数
 @param itemH item高度
 @param itemLRContentInsets item文字左右两边内间距总和
 @param lineSpace item纵向间距
 @param interitemSpace item横向间距
 @return instancetype
 */
- (instancetype)initWithWidth:(CGFloat)width
                        count:(NSInteger)count
                        itemH:(CGFloat)itemH
          itemLRContentInsets:(CGFloat)itemLRContentInsets
                    lineSpace:(CGFloat)lineSpace
               interitemSpace:(CGFloat)interitemSpace;

- (void)configWithWidth:(CGFloat)width
                  count:(NSInteger)count
                  itemH:(CGFloat)itemH
    itemLRContentInsets:(CGFloat)itemLRContentInsets
              lineSpace:(CGFloat)lineSpace
         interitemSpace:(CGFloat)interitemSpace;

/**
 展示视图

 @param view 父视图
 */
- (CGSize)showWithView:(UIView *)view;

@property (nonatomic,copy) NSString *(^itemTitleBlock)(NSInteger index);//获取标题
@property (nonatomic,copy) void(^configItemBlock)(UIButton *sender);
@property (nonatomic,copy) void(^clickItemBlock)(UIButton *sender);
@end
