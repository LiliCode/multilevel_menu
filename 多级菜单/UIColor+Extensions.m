//
//  UIColor_Extensions.m
//  NeighborHealth
//
//  Created by 成都圈圈儿科技 on 15/3/10.
//  Copyright (c) 2015年 QuanQuanEr. All rights reserved.
//

#import "UIColor+Extensions.h"

@implementation UIColor (UIColor_Extensions)



+(UIColor *)colorWithHexValue:(NSString *)hexValue alpha:(CGFloat)alpha{
    // Convert hex string to an integer
    unsigned int hexint = [self intFromHexString:hexValue];
    
    // Create color object, specifying alpha as well
    UIColor *color =
    [UIColor colorWithRed:((CGFloat) ((hexint & 0xFF0000) >> 16))/255
                    green:((CGFloat) ((hexint & 0xFF00) >> 8))/255
                     blue:((CGFloat) (hexint & 0xFF))/255
                    alpha:alpha];
    
    
    
    return color;
}

+ (unsigned int)intFromHexString:(NSString *)hexStr
{
    if([hexStr isEqual:[NSNull null]])
    {
        hexStr = @"#000000";
    }
    unsigned int hexInt = 0;
    
    // Create scanner
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];
    
    // Tell scanner to skip the # character
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    
    // Scan hex value
    [scanner scanHexInt:&hexInt];
    
    return hexInt;
}


+ (UIColor *)colorWithR:(CGFloat)R G:(CGFloat)G B:(CGFloat)B alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1];
}



@end







