//
//  LLCell.m
//  RunNima
//
//  Created by Mr Lee on 2017/7/24.
//  Copyright © 2017年 zhubch. All rights reserved.
//

#import "LLCell.h"

@implementation LLCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

-(void)setModel:(LLModel *)model
{
    _indexL.text = model.index;
    _scoreL.text = model.score ;
//    _distL.text = [model.dist substringFromIndex:5]; ;
   _timeL.text = model.time;
}

@end
