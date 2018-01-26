//
//  LLCell.h
//  RunNima
//
//  Created by Mr Lee on 2017/7/24.
//  Copyright © 2017年 zhubch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLModel.h"

@interface LLCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *indexL;

@property (weak, nonatomic) IBOutlet UILabel *scoreL;
@property (weak, nonatomic) IBOutlet UILabel *distL;
@property (weak, nonatomic) IBOutlet UILabel *timeL;

@property(nonatomic,strong)LLModel *model;

@end
