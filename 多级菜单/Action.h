//
//  Action.h
//  NeighborHealth
//
//  Created by 圈圈科技 on 15/10/28.
//  Copyright (c) 2015年 QuanQuanEr. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  AlertAction的显示风格
 */
typedef NS_ENUM(NSUInteger, AlertActionStyle)
{
    /**
     *  默认风格
     */
    AlertActionStyleDefault = 0,
    /**
     *  取消风格
     */
    AlertActionStyleCancel,
    /**
     *  毁灭性风格
     */
     AlertActionStyleDestructive
};


@interface Action : NSObject

@property (copy , nonatomic) NSString *title;   //标题

@property (copy , nonatomic) NSString *image;   //图标

@property (copy , nonatomic) NSString *detail;  //详细

@property (assign , nonatomic) AlertActionStyle style;   //风格

@property (copy , nonatomic) void (^action)();  //行为 事件


/**
 *  创建只有标题并且可回调事件的alertController
 *
 *  @param title  标题
 *  @param action 回调block
 *
 *  @return 返回alert
 */
+ (instancetype)actionWithTitle:(NSString *)title handler:(void (^)())action;

/**
 *  创建有标题和图标并且可回调事件的alertController
 *
 *  @param title  标题
 *  @param image  图标
 *  @param action 回调事件block
 *
 *  @return 返回alert
 */
+ (instancetype)actionWithTitle:(NSString *)title image:(NSString *)image handler:(void (^)())action;

/**
 *  创建有标题和图标并且可回调事件的alertController
 *
 *  @param title  标题
 *  @param detail 详细
 *  @param style  风格
 *  @param action 回调事件
 *
 *  @return 返回alert
 */
+ (instancetype)actionWithTitle:(NSString *)title detail:(NSString *)detail style:(AlertActionStyle)style handler:(void (^)())action;

@end




