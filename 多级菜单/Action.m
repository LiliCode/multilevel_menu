//
//  Action.m
//  NeighborHealth
//
//  Created by 圈圈科技 on 15/10/28.
//  Copyright (c) 2015年 QuanQuanEr. All rights reserved.
//

#import "Action.h"

@implementation Action


+ (instancetype)actionWithTitle:(NSString *)title handler:(void (^)())action
{
    return [[[self class] alloc] initWithTitle:title handler:action];
}


- (instancetype)initWithTitle:(NSString *)title handler:(void (^)())action
{
    if(self = [super init])
    {
        _title = title;
        
        _action = ^{
            action();
        };
    }
    
    return self;
}


+ (instancetype)actionWithTitle:(NSString *)title detail:(NSString *)detail style:(AlertActionStyle)style handler:(void (^)())action
{
    return [[[self class] alloc] initWithTitle:title detail:detail style:style handler:action];
}


- (instancetype)initWithTitle:(NSString *)title detail:(NSString *)detail style:(AlertActionStyle)style handler:(void (^)())action
{
    if(self = [super init])
    {
        _title = title;
        _detail = detail;
        _style = style;
        
        _action = ^{
            action();
        };
    }
    
    return self;
}


+ (instancetype)actionWithTitle:(NSString *)title image:(NSString *)image handler:(void (^)())action
{
    return [[[self class] alloc] initWithTitle:title image:image handler:action];
}


- (instancetype)initWithTitle:(NSString *)title image:(NSString *)image handler:(void (^)())action
{
    if(self = [super init])
    {
        _title = title;
        _image = image;
        _action = ^{
            action();
        };
    }
    
    return self;
}


- (void)dealloc
{
    NSLog(@"Action release");
}


@end




