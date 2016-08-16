//
//  MultilevelMenuModel.h
//  多级菜单
//
//  Created by LiliEhuu on 16/8/15.
//  Copyright © 2016年 LiliEhuu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Action.h"

@interface Action (MultiMenu)

@property (strong , nonatomic) NSMutableArray <Action *>*actions;

+ (instancetype)actionWithTitle:(NSString *)title detail:(NSString *)detail nextActions:(NSMutableArray <Action *> *)actions;

@end

@interface MultilevelMenuModel : NSObject


- (NSArray <Action *> *)getMenuList;



@end


