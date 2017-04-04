//
//  NewTableViewCell.h
//  Dangdang
//
//  Created by 查传申 on 2017/4/4.
//  Copyright © 2017年 查传申. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewTableViewCell : UITableViewCell
@property(strong,nonatomic)UILabel *label_title;
@property(strong,nonatomic)UILabel *label_text;
@property(strong,nonatomic)UIImageView *imageV;
@property(assign,nonatomic)CGFloat height;
-(void)setDic:(NSDictionary *)dic;

@end
