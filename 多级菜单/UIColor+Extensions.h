//
//  UIColor_Extensions.h
//  NeighborHealth
//
//  Created by 成都圈圈儿科技 on 15/3/10.
//  Copyright (c) 2015年 QuanQuanEr. All rights reserved.
//

#import <UIKit/UIKit.h>



#define C_999999                @"#999999"

@interface UIColor (UIColor_Extensions)

+ (UIColor*)colorWithHexValue:(NSString*)hexValue alpha:(CGFloat)alpha;

/**
 *  三基色
 */
+ (UIColor *)colorWithR:(CGFloat)R G:(CGFloat)G B:(CGFloat)B alpha:(CGFloat)alpha;

@end
