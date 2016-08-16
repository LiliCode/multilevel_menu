//
//  ShadeViewController.h
//  NeighborHealth
//
//  Created by 圈圈科技 on 15/10/28.
//  Copyright (c) 2015年 QuanQuanEr. All rights reserved.
//

////////////////////////////////////////////////////////
//                     遮罩视图控制器                   //
////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>
#import "Action.h"

@interface ShadeViewController : UIViewController


@property (strong , nonatomic) UIView *alertView;   //alert视图

@property (copy , nonatomic) NSString *alertTitle;  //标题

@property (copy , nonatomic) NSString *detail;      //详情


/**
 *  初始化重写
 *
 *  @return 返回当前实例
 */
- (instancetype)init;

/**
 *  创建alertController
 *
 *  @param title  标题
 *  @param detail 详细描述
 *
 *  @return 返回alertController
 */
+ (instancetype)alertContrllerWithTitle:(NSString *)title detail:(NSString *)detail;
- (instancetype)initWithTitle:(NSString *)title detail:(NSString *)detail;

/**
 *  添加响应的行为
 *
 *  @param object 行为
 */
- (void)addAction:(Action *)object;

/**
 *  添加一组行为
 *
 *  @param actions 一组行为
 */
- (void)addActions:(NSArray <Action *>*)actions;

/**
 *  在视图控制器消失之前调用
 */
- (void)beforeDismissViewController;

@end



