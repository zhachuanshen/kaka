//
//  ViewController.m
//  Dangdang
//
//  Created by 查传申 on 2017/3/13.
//  Copyright © 2017年 查传申. All rights reserved.
//

#import "ViewController.h"
#import "NewTableViewCell.h"
#import "Masonry.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UILabel *label_title;
@property(nonatomic,strong)UILabel *label_text;
@property(nonatomic,strong)UILabel *label_sub;
@property(nonatomic,strong)UILabel *label_sing;
@property(nonatomic,strong)UIImageView *imagV;
@property(nonatomic,strong)UIView *View_header;
@property(nonatomic,strong)UIView *headView;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"试一下" style:1 target:self action:@selector(news)];
    self.title = @"title";
    [self.view addSubview:self.tableView];
    _label_title = [[UILabel alloc]init];
    _label_text = [[UILabel alloc]init];
    
    _label_sub = [[UILabel alloc]init];
    _label_sing = [[UILabel alloc]init];
    _imagV = [[UIImageView alloc]init];
    
    [self.View_header addSubview:_label_title];
    
    [self.View_header addSubview:_label_sing];
    [self.View_header addSubview:_label_sub];
    [self.View_header addSubview:_label_text];
    [self.View_header addSubview:_imagV];
    _headView  = [[UIView alloc]initWithFrame:CGRectMake(10, 0, self.view.frame.size.width-20, 0)];
    [_headView addSubview:self.View_header];
    self.tableView.tableHeaderView = _headView;
    
    _headView.backgroundColor =[UIColor redColor];
    _View_header.backgroundColor = [UIColor brownColor];
    _label_title.backgroundColor = [UIColor blueColor];
    _label_text.backgroundColor = [UIColor lightGrayColor];
    _label_text.text = @"lsafijsalfj";
    //asdasdasdasdsad
    _label_text.numberOfLines = 0;
    
}
-(UIView *)View_header{
    if(_View_header == nil){
        _View_header = [[UIView alloc]init];
    }
    return _View_header;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor greenColor];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[NewTableViewCell class] forCellReuseIdentifier:@"reuse"];
    }
    return _tableView;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse"];
    [cell setDic:@{@"id":@"sdasasd"}];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  NewTableViewCell *cell = (NewTableViewCell *)[self tableView:_tableView cellForRowAtIndexPath:indexPath];
    
    return cell.height;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(void)news{
    self.label_text.text = @"aslkdjsalkdjslakdjlksajdkjsaldkjaslkdjalkdjlaksjdlkasjdlkjsadjlsad";
//    asdasdsad
//    test
    [self.View_header mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headView);
        make.right.equalTo(self.headView);
        make.width.mas_equalTo(self.headView.frame.size.width);
        make.bottom.equalTo(self.label_text);
        
    }];
    [self.View_header.superview layoutIfNeeded];
    CGFloat height = self.View_header.frame.size.height;

//    CGFloat height = [self.View_header systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    _headView.frame = CGRectMake(_headView.frame.origin.x, 0, _headView.frame.size.width, height+10);
    
    self.tableView.tableHeaderView = _headView;
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
    [self.View_header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headView);
        make.right.equalTo(self.headView);
        make.width.mas_equalTo(self.headView.frame.size.width);
        make.height.mas_equalTo(30);
        
    }];
    [self.label_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(40, 40));
        
    }];
    [self.label_text mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.equalTo(_label_title.mas_bottom).offset(10);
        
    }];
    [self.View_header mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headView);
        make.right.equalTo(self.headView);
        make.width.mas_equalTo(self.headView.frame.size.width);
        make.bottom.equalTo(self.label_text);

    }];
      [self.View_header.superview layoutIfNeeded];
    CGFloat height = self.View_header.frame.size.height;
//    CGFloat height = [self.View_header systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    _headView.frame = CGRectMake(0, 0, self.view.frame.size.width-20, height+10);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
