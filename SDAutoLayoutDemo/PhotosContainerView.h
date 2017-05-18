//
//  PhotosContainerView.h
//  SDAutoLayoutDemo
//
//  Created by 住朋购友 on 2017/3/18.
//  Copyright © 2017年 LYF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotosContainerView : UIView

// 最大数count 每行个数rowCount 上下间距yMargin xMargin左右间距 左边间隔 右边间隔
- (instancetype)initWithMaxItemsCount:(NSInteger)count withRowCount:(NSInteger)rowCount verticalMargin:(CGFloat)yMargin horizontalMargin:(CGFloat)xMargin leftMargin:(CGFloat)lMargin right:(CGFloat)rMargin;

@property (nonatomic, strong) NSArray *photoNamesArray;

@property (nonatomic, assign) NSInteger maxItemsCount;

@end
