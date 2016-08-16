//
//  MultilevelMenuAlertController.h
//  多级菜单
//
//  Created by LiliEhuu on 16/8/15.
//  Copyright © 2016年 LiliEhuu. All rights reserved.
//

#import "ShadeViewController.h"
#import "MultilevelMenuModel.h"

@interface MultilevelMenuAlertController : ShadeViewController

/**
 *  创建一个多级菜单
 *
 *  @param model 传入多级菜单数据结构模型
 *
 *  @return 返回多级菜单控制器
 */
+ (instancetype)multilevelMenuWithMenuModel:(MultilevelMenuModel *)model selectInfo:(void (^)(id info))selectUsingBlock;


@end
