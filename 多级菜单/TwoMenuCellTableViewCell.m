//
//  TwoMenuCellTableViewCell.m
//  多级菜单
//
//  Created by LiliEhuu on 16/8/15.
//  Copyright © 2016年 LiliEhuu. All rights reserved.
//

#import "TwoMenuCellTableViewCell.h"
#import "UIColor+Extensions.h"

@interface TwoMenuCellTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation TwoMenuCellTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabel.text = title;
}

- (void)setDetail:(NSString *)detail
{
    _detail = detail;
    self.detailLabel.text = detail;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    //Cell 选中
    self.titleLabel.textColor = selected? [UIColor colorWithHexValue:@"#669900" alpha:1] : [UIColor colorWithHexValue:@"#666666" alpha:1];
}

@end



