//
//  LyfCell.m
//  SDAutoLayoutDemo
//
//  Created by 住朋购友 on 2017/3/18.
//  Copyright © 2017年 LYF. All rights reserved.
//

#import "LyfCell.h"
#import "SDAutoLayout.h"
#import "PhotosContainerView.h"
@implementation LyfCell
{
    PhotosContainerView *_photosContainer;
}

- (void)awakeFromNib {
    [super awakeFromNib];

    self.contentView.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1];
    PhotosContainerView *photosContainer = [[PhotosContainerView alloc] initWithMaxItemsCount:9 withRowCount:4 verticalMargin:10 horizontalMargin:10 leftMargin:0 right:0];
    _photosContainer = photosContainer;
    [self.contentView addSubview:photosContainer];
    
    self.contentLable.font = [UIFont systemFontOfSize:15];
    self.contentLable.textColor = [UIColor grayColor];
    
    self.mainImageView.sd_layout
    .leftSpaceToView(self.contentView, 10)
    .topSpaceToView(self.contentView, 10)
    .widthIs(50)
    .heightEqualToWidth();
    
    self.contentLable.sd_layout
    .leftSpaceToView(self.mainImageView, 10)
    .topEqualToView(self.mainImageView)
    .rightSpaceToView(self.contentView, 10)
    .autoHeightRatio(0);
    
    /*
     // 如果你需要限制最多显示多少行文字可以这样做
     [self.contentLabel setMaxNumberOfLinesToShow:6];
     */
    
    _photosContainer.sd_layout
    .leftEqualToView(self.contentLable)
    .rightEqualToView(self.contentLable)
    .topSpaceToView(self.contentLable, 10); // 高度自适应了，不需要再设置约束
}
- (void)setModel:(LyfModel *)model{
    _model = model;
    
    self.contentLable.text = model.title;
    self.mainImageView.image = [UIImage imageNamed:model.iconImagePath];
    
    
    UIView *bottomView =  self.contentLable;
    
    _photosContainer.photoNamesArray = model.imagePathsArray;
    if (model.imagePathsArray.count > 0) {
        _photosContainer.hidden = NO;
        bottomView = _photosContainer;
    } else {
        _photosContainer.hidden = YES;
    }
    
    
    [self setupAutoHeightWithBottomView:bottomView bottomMargin:10]; // 如果你不能确定具体哪个view会在contentview的最底部，你可以把所有可能的view都包装在一个数组里面传过去，对应的方法为 [self setupAutoHeightWithBottomViewsArray:<#(NSArray *)#> bottomMargin:<#(CGFloat)#>]
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
