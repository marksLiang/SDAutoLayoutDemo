//
//  LyfCell.h
//  SDAutoLayoutDemo
//
//  Created by 住朋购友 on 2017/3/18.
//  Copyright © 2017年 LYF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LyfModel.h"


@interface LyfCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UILabel *contentLable;
@property (nonatomic, strong) LyfModel *  model;
@end
