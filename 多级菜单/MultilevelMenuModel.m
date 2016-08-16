//
//  MultilevelMenuModel.m
//  多级菜单
//
//  Created by LiliEhuu on 16/8/15.
//  Copyright © 2016年 LiliEhuu. All rights reserved.
//

#import "MultilevelMenuModel.h"
#import <objc/runtime.h>


static char *actionsKey = "actionsKey";

@implementation Action (MultiMenu)

- (void)setActions:(NSMutableArray<Action *> *)actions
{
    objc_setAssociatedObject(self, &actionsKey, actions, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableArray<Action *> *)actions
{
    return objc_getAssociatedObject(self, &actionsKey);
}

+ (instancetype)actionWithTitle:(NSString *)title detail:(NSString *)detail nextActions:(NSMutableArray <Action *> *)actions
{
    return [[self alloc] initWithTitle:title detail:detail nextActions:actions];
}

- (instancetype)initWithTitle:(NSString *)title detail:(NSString *)detail nextActions:(NSMutableArray <Action *> *)actions
{
    if (self = [super init])
    {
        self.title = title;
        self.detail = detail;
        self.actions = actions;
    }
    
    return self;
}

@end


@interface MultilevelMenuModel ()

@end

@implementation MultilevelMenuModel


- (NSArray <Action *>*)getMenuList
{
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"menu.json" ofType:nil];
    NSDictionary *info = [self readJSONContentsOfFile:jsonPath];
    
    NSMutableArray *list = [NSMutableArray new];
    
    for (NSDictionary *oneItem in info[@"menuList"])
    {
        NSString *title1 = oneItem[@"title"];
        NSString *detail1 = oneItem[@"num"];
        NSArray *muMenu = oneItem[@"next"];
        NSMutableArray *multiMenu = [NSMutableArray new]; //二级菜单
        if (muMenu)
        {
            for (NSDictionary *twoItem in muMenu)
            {
                NSString *title2 = twoItem[@"title"];
                NSString *detail2 = twoItem[@"num"];
                NSArray *actions2 = twoItem[@"next"];
                //创建Action
                Action *action = [Action actionWithTitle:title2 detail:detail2 nextActions:[actions2 mutableCopy]];
                [multiMenu addObject:action];
            }
        }
        
        //创建Action
        Action *action = [Action actionWithTitle:title1 detail:detail1 nextActions:multiMenu];
        [list addObject:action];
    }
    
    return [list copy];
}


//解析json成字典
- (NSDictionary *)readJSONContentsOfFile:(NSString *)path
{
    NSData *json_data = [NSData dataWithContentsOfFile:path];
    NSError *error = nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:json_data options:0 error:&error];
    if(error)
    {
        NSLog(@"解析JSON错误详情:%@",error.description);
        return nil;
    }
    return dic;
}



@end



