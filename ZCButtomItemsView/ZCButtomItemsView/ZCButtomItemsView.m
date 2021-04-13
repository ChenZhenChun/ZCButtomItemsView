//
//  ZCButtomItemsView.m
//  
//
//  Created by gulu on 2018/10/9.
//  Copyright © 2018年 gulu. All rights reserved.
//

#import "ZCButtomItemsView.h"

@interface ZCButtomItemsView()

@end

@implementation ZCButtomItemsView

- (instancetype)initWithWidth:(CGFloat)width
                        count:(NSInteger)count
                        itemH:(CGFloat)itemH
          itemLRContentInsets:(CGFloat)itemLRContentInsets
                    lineSpace:(CGFloat)lineSpace
               interitemSpace:(CGFloat)interitemSpace {
    self = [super init];
    if (self) {
        _width = width;
        _count = count;
        _itemH = itemH;
        _itemLRContentInsets = itemLRContentInsets;
        _lineSpace = lineSpace;
        _interitemSpace = interitemSpace;
    }
    return self;
}

- (void)configWithWidth:(CGFloat)width
                  count:(NSInteger)count
                  itemH:(CGFloat)itemH
    itemLRContentInsets:(CGFloat)itemLRContentInsets
              lineSpace:(CGFloat)lineSpace
         interitemSpace:(CGFloat)interitemSpace {
    _width = width;
    _count = count;
    _itemH = itemH;
    _itemLRContentInsets = itemLRContentInsets;
    _lineSpace = lineSpace;
    _interitemSpace = interitemSpace;
}

- (CGSize)showWithView:(UIView *)view {
    CGFloat minY = 0;
    CGFloat maxX = 0;
    for (UIView *view in [self subviews]) {
        [view removeFromSuperview];
    }
    for (int i = 0; i<_count;i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundColor:[UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1]];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        btn.layer.cornerRadius = _itemH/2.0;
        [btn setTitleColor:[UIColor colorWithRed:71/255.0 green:133/255.0 blue:255/255.0 alpha:1] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(extraFlagBtnClickAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.adjustsImageWhenHighlighted = NO;
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        btn.tag = i;
        
        if (self.itemTitleBlock) {
            [btn setTitle:self.itemTitleBlock(i) forState:UIControlStateNormal];
        }else {
            NSLog(@"请初始化itemTitleBlock获取item的title");
            [btn setTitle:nil forState:UIControlStateNormal];
        }
        if (self.configItemBlock) {
            self.configItemBlock(btn);
        }
        [btn sizeToFit];
        
        CGFloat width = btn.frame.size.width+_itemLRContentInsets;
        //换行显示
        if (maxX+width>_width) {
            minY+= (_itemH+_lineSpace);
            maxX = 0;
        }
        if (width>_width) {
            width = _width;
        }
        btn.frame = CGRectMake(maxX,minY,width,_itemH);
        if (self.itemFrameBlock) {
            self.itemFrameBlock(btn.frame, btn.tag);
        }
        maxX+=(width+_interitemSpace);
        [self addSubview:btn];
    }
    if (view) {
        [view addSubview:self];
    }
    return CGSizeMake(_width,minY+_itemH);
}

#pragma mark - 标签点击
- (void)extraFlagBtnClickAction:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    if (self.clickItemBlock) {
        self.clickItemBlock(sender);
    }
}

@end
