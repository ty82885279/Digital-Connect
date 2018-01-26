//
//  LLdb.h
//  lottery
//
//  Created by MrLee on 2017/6/27.
//  Copyright © 2017年 MrLee.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB/FMDB.h>
#import "LLModel.h"

@interface LLdb : NSObject

+ (LLdb *)shareManager;

//包含这条数据的话 我们显示取消收藏 没有这条数据的话 我们应该收藏
- (BOOL)isExistsDataWithModel:(LLModel *)model;

//插入一条数据
- (BOOL)insertDataWithModel:(LLModel *)model;

//删除一条数据
- (BOOL)deleteDataWithModel:(LLModel *)model;

//返回所有数据
- (NSArray *)allData;

@end
