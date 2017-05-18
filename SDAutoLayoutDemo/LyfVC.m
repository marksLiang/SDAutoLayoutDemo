//
//  LyfVC.m
//  SDAutoLayoutDemo
//
//  Created by 住朋购友 on 2017/3/18.
//  Copyright © 2017年 LYF. All rights reserved.
//

#import "LyfVC.h"
#import "LyfModel.h"
#import "SDAutoLayout.h"
#import "LyfCell.h"

@interface LyfVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * myTableView;
@property(nonatomic,strong) NSMutableArray * modelsArray;
@end

@implementation LyfVC
- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        [_myTableView registerNib:[UINib nibWithNibName:@"LyfCell" bundle:nil] forCellReuseIdentifier:@"LyfCell"];
    }
    return _myTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getDataWithCount:20];
    [self.view addSubview:self.myTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - getdata
- (void)getDataWithCount:(NSInteger)count{
    if (!_modelsArray) {
        _modelsArray = [NSMutableArray new];
    }
    NSArray *iconImageNamesArray = @[@"icon0.jpg",
                                     @"icon1.jpg",
                                     @"icon2.jpg",
                                     @"icon3.jpg",
                                     @"icon4.jpg",
                                     @"icon0.jpg",
                                     @"icon1.jpg",
                                     @"icon2.jpg",
                                     @"icon3.jpg"
                                     ];
    NSArray *textArray = @[@"当你的 app 没有提供 3x 的LaunchImage 时。然后等比例拉伸屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任小。但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                           @"然后等比例拉伸到大屏。屏幕宽度返回 320否则在大屏上会显得字大长期处于这种模式下，否则在大屏上会显得字大，内容少这种情况下对界面不会",
                           @"长期处于这种模式下，否则在大屏上会显得字大，内容少这种情况下对界面不会但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                           @"但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                           @"屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任小。但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。"
                           ];
    for (int i = 0; i < count; i++) {
        
        int nameRandomIndex = arc4random_uniform(5);
        
        LyfModel *model = [[LyfModel alloc]init];
        model.title = textArray[nameRandomIndex];
        model.iconImagePath = iconImageNamesArray[arc4random_uniform(9)];
        
        // 模拟“有或者无图片”
        int random = arc4random_uniform(1);
        if (random <= 8) {
            NSMutableArray *temp = [NSMutableArray new];
            
            int randomImagesCount = arc4random_uniform(9);
            for (int i = 0; i < randomImagesCount; i++) {
                int randomIndex = arc4random_uniform(9);
                NSString *text = iconImageNamesArray[randomIndex];
                [temp addObject:text];
            }
            
            model.imagePathsArray = [temp copy];
        }
        
        [self.modelsArray addObject:model];
    }
//    [self.myTableView reloadData];
}
#pragma mark - tableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LyfCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LyfCell"];
    cell.model = self.modelsArray[indexPath.row];
    LyfModel * model = self.modelsArray[indexPath.row];
    CGFloat height = [self.myTableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[LyfCell class] contentViewWidth:self.view.frame.size.width];

    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.modelsArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    LyfModel * model = self.modelsArray[indexPath.row];
    return [self.myTableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[LyfCell class] contentViewWidth:self.view.frame.size.width];
}

@end
