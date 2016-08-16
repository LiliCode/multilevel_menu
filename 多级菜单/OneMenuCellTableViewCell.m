//
//  OneMenuCellTableViewCell.m
//  多级菜单
//
//  Created by LiliEhuu on 16/8/15.
//  Copyright © 2016年 LiliEhuu. All rights reserved.
//

#import "OneMenuCellTableViewCell.h"
#import "UIColor+Extensions.h"

@interface OneMenuCellTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;


@end

@implementation OneMenuCellTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    //高亮色
    self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.bounds];
    self.selectedBackgroundView.backgroundColor = [UIColor colorWithHexValue:@"#F2F2F2" alpha:1];
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




