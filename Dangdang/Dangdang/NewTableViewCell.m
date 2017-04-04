//
//  NewTableViewCell.m
//  Dangdang
//
//  Created by 查传申 on 2017/4/4.
//  Copyright © 2017年 查传申. All rights reserved.
//

#import "NewTableViewCell.h"
#import "Masonry.h"
@implementation NewTableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.label_title = [[UILabel alloc]initWithFrame:CGRectZero];
        
        self.label_text = [[UILabel alloc]initWithFrame:CGRectZero];
        self.imageV = [[UIImageView alloc]initWithFrame:CGRectZero];
        
        _label_title.backgroundColor = [UIColor cyanColor];
        _label_text.backgroundColor = [UIColor orangeColor];
        _label_text.numberOfLines = 0;
        _imageV.backgroundColor = [UIColor yellowColor];
        
        [self.contentView addSubview: self.imageV];
        [self.contentView addSubview: self.label_text];
        [self.contentView addSubview: self.label_title];
    }
    return self;
    
}
-(void)setDic:(NSDictionary *)dic{
    _label_text.text = @"asdjlsakdjalskdlksajdlkasjdlkjlkfdjglkjfdglkjdflkgjfkljgkldf111111";
    _label_title.text = @"title";
    
    _height=[self.label_text.text boundingRectWithSize:CGSizeMake(self.contentView.frame.size.width, 0)options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}context:nil].size.height +10+10+30+20+5;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(30);
        
    }];
    [_label_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_imageV);
        make.right.equalTo(_imageV);
        make.top.equalTo(_imageV.mas_bottom).offset(10);
        make.height.mas_equalTo(20);
        
    }];
    
    [_label_text mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_label_title);
        make.right.equalTo(_label_title);
        make.top.equalTo(_label_title.mas_bottom).offset(10);
        
    }];


    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
