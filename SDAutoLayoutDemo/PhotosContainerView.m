//
//  PhotosContainerView.m
//  SDAutoLayoutDemo
//
//  Created by 住朋购友 on 2017/3/18.
//  Copyright © 2017年 LYF. All rights reserved.
//

#import "PhotosContainerView.h"
#import "UIView+SDAutoLayout.h"

@implementation PhotosContainerView
{
    NSMutableArray *_imageViewsArray;
    NSInteger _rowCount;
    CGFloat _yMargin;
    CGFloat _xMargin;
    CGFloat _lMargin;
    CGFloat _rMargin;
}

- (instancetype)initWithMaxItemsCount:(NSInteger)count withRowCount:(NSInteger)rowCount verticalMargin:(CGFloat)yMargin horizontalMargin:(CGFloat)xMargin leftMargin:(CGFloat)lMargin right:(CGFloat)rMargin{
    if (self = [super init]) {
        self.maxItemsCount = count;
        _rowCount = rowCount;
        _yMargin = yMargin;
        _xMargin = xMargin;
        _lMargin = lMargin;
        _rMargin = rMargin;
    }
    return self;
}
- (void)setPhotoNamesArray:(NSArray *)photoNamesArray
{
    _photoNamesArray = photoNamesArray;
    
    if (!_imageViewsArray) {
        _imageViewsArray = [NSMutableArray new];
    }
    
    int needsToAddItemsCount = (int)(_photoNamesArray.count - _imageViewsArray.count);
    
    if (needsToAddItemsCount > 0) {
        for (int i = 0; i < needsToAddItemsCount; i++) {
            UIImageView *imageView = [UIImageView new];
            [self addSubview:imageView];
            [_imageViewsArray addObject:imageView];
        }
    }
    
    NSMutableArray *temp = [NSMutableArray new];
    
    [_imageViewsArray enumerateObjectsUsingBlock:^(UIImageView *imageView, NSUInteger idx, BOOL *stop) {
        if (idx < _photoNamesArray.count) {
            imageView.hidden = NO;
            imageView.sd_layout.autoHeightRatio(1);
            imageView.image = [UIImage imageNamed:_photoNamesArray[idx]];
            [temp addObject:imageView];
        } else {
            [imageView sd_clearAutoLayoutSettings];
            imageView.hidden = YES;
        }
    }];
    
    [self setupAutoWidthFlowItems:[temp copy] withPerRowItemsCount:_rowCount verticalMargin:_yMargin horizontalMargin:_xMargin verticalEdgeInset:_lMargin horizontalEdgeInset:_rMargin];
}



@end
