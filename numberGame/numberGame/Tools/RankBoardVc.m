//
//  RankBoardVc.m
//  TC168
//
//  Created by MrLee on 2017/8/2.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "RankBoardVc.h"
#import "LLnoCell.h"
#import "LLCell.h"
#import "LLdb.h"

#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface RankBoardVc ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSArray *dataArr;

@end

@implementation RankBoardVc

- (void)viewDidLoad {
    [super viewDidLoad];
  [_tableView registerNib:[UINib nibWithNibName:@"LLCell" bundle:nil] forCellReuseIdentifier:@"LLCell"];
  [_tableView registerNib:[UINib nibWithNibName:@"LLnoCell" bundle:nil] forCellReuseIdentifier:@"LLnoCell"];
  _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  _tableView.delegate = self;
  _tableView.dataSource = self;
  _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
  
  _dataArr = [[LLdb shareManager]allData]; //所有的排名数据
  if(_dataArr.count > 20){
    
    _dataArr = [_dataArr subarrayWithRange:NSMakeRange(0, 20)];

  }
    
    
    for (LLModel *model in _dataArr) {
        
        NSLog(@"---%@",model.score);
    } 
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  if(_dataArr.count != 0){
    
    return  _dataArr.count;
  }else{
    return 1;
  }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (_dataArr.count!=0) {
    
    return 34;
  }
  return 89;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
  
  UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
  
  UILabel *rankL = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/3, 30)];
  rankL.text = @"Indexes";
  rankL.textAlignment = 1;
  rankL.textColor = [UIColor whiteColor];
  
  UILabel *scoreL = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/3, 0, self.view.frame.size.width/3, 30)];
  scoreL.text = @"Score";
  scoreL.textAlignment = 1;
  scoreL.textColor = [UIColor whiteColor];
  

  UILabel *timeL = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/3*2, 0, self.view.frame.size.width/3, 30)];
  
  timeL.text = @"Time";
  timeL.textAlignment = 1;
  timeL.textColor = [UIColor whiteColor];
  
    rankL.backgroundColor = HEXCOLOR(0x10959E);
  timeL.backgroundColor = HEXCOLOR(0x10959E);
  scoreL.backgroundColor = HEXCOLOR(0x10959E);
  
  [bgView addSubview:rankL];
  [bgView addSubview:scoreL];

  [bgView addSubview:timeL];
  
  return bgView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  
  return 30;
  
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
  if (_dataArr.count == 0) {
    
    LLnoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LLnoCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
  }else{
    
    LLCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LLCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    LLModel *model = _dataArr[indexPath.row];
    cell.model = model;
    return cell;
  }
}
- (IBAction)back:(UIButton *)sender {
  
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
