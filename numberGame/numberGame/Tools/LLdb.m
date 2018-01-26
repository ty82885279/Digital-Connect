//
//  LLdb.m
//  lottery
//
//  Created by MrLee on 2017/6/27.
//  Copyright © 2017年 MrLee.com. All rights reserved.
//

#import "LLdb.h"
#import "LLTools.h"

@implementation LLdb

{

    FMDatabase *_fmdb;

}

+ (LLdb *)shareManager{
    static LLdb *_dB = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_dB == nil) {
            _dB = [[LLdb alloc] init];
        }
    });
    return _dB;
}

- (id)init{
    self = [super init];
    if (self) {
        
        
        NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        
        // 文件路径
        
        NSString *filePath = [documentsPath stringByAppendingPathComponent:@"collect.sqlite"];
        
        // 实例化FMDataBase对象
        
        _fmdb = [[FMDatabase alloc] initWithPath:filePath];
        if ([_fmdb open]) {
            NSLog(@"打开数据库成功");
            //我们打开数据库之后 需要创建表格
           
            NSString *sql = @"create table if not exists app(score int(128),time var char(128))";
            BOOL isSuccess = [_fmdb executeUpdate:sql];
            if (isSuccess) {
                NSLog(@"create Tabel Success");
            }else{
                NSLog(@"create Tabel Fail:%@",_fmdb.lastErrorMessage);
            }
            
        }else{
            NSLog(@"open Sqlite File");
        }
        
    }
    return self;
}

#pragma mark - 数据库操作
//这个表格里面是否包含这个数据
//查询
- (BOOL)isExistsDataWithModel:(LLModel *)model{
    /*
     select applicationid from app where applicationid = ?
     */
    NSString *sql = @"select id from app where score = ?";
    //_fmdb
    //这个方法是查询
    
  
    FMResultSet *set = [_fmdb executeQuery:sql,model.score];
    
    //[set next] 如果你查询到了 这个方法会返回一个真值
    
    return [set next];
}

//插入
- (BOOL)insertDataWithModel:(LLModel *)model{
    /*
     insert into app (applicationId,name,iconUrl) values (?,?,?)
     */
    
    NSString *sql = @"insert into app (score,time) values (?,?)";
    BOOL isSuccess = [_fmdb executeUpdate:sql,model.score,model.time];
    if (isSuccess) {
        NSLog(@"插入成功");
    }else{
        NSLog(@"插入失败:%@",_fmdb.lastErrorMessage);
    }
    return isSuccess;
}

- (BOOL)deleteDataWithModel:(LLModel *)model{
    NSString *sql = @"delete from app where id = ?";
    BOOL isSuccess = [_fmdb executeUpdate:sql,model.score];
    if (isSuccess) {
        NSLog(@"删除成功");
    }else{
        NSLog(@"删除失败%@",_fmdb.lastErrorMessage);
    }
    return isSuccess;
}

- (NSArray *)allData{
    //select * from app order by score desc
    NSString *sql = @"select * from app";
    FMResultSet *set = [_fmdb executeQuery:sql];

    //装数据模型
    NSMutableArray *array = [NSMutableArray array];
    NSInteger i = 1;
    while ([set next]) {
        LLModel *model = [[LLModel alloc] init];
//        model.score = [NSString stringWithFormat:@"%d",[set intForColumn:@"score"]] ;
        
        model.score = [set stringForColumn:@"score"];
//        model.realScore = [set stringForColumn:@"realScore"];
        model.index = [NSString stringWithFormat:@"%ld",(long)i];
        model.time = [set stringForColumn:@"time"];
        [array addObject:model];
        i++;
        
        NSLog(@"查询的所有结果 ：%@",model.score);
    }
    
    return array;
}

@end
