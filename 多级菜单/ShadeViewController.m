//
//  ShadeViewController.m
//  NeighborHealth
//
//  Created by 圈圈科技 on 15/10/28.
//  Copyright (c) 2015年 QuanQuanEr. All rights reserved.
//

#import "ShadeViewController.h"

@interface ShadeViewController ()

@end

@implementation ShadeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (instancetype)init
{
    if(self = [super init])
    {
        [self setModalStyle];
    }
    
    return self;
}


+ (instancetype)alertContrllerWithTitle:(NSString *)title detail:(NSString *)detail
{
    return [[[self class] alloc] initWithTitle:title detail:detail];
}

- (instancetype)initWithTitle:(NSString *)title detail:(NSString *)detail
{
    if(self = [super init])
    {
        self.alertTitle = title;
        self.detail = detail;
        
        [self setModalStyle];
    }
    
    return self;
}

/**
 *  设置模态视图呈现风格
 */
- (void)setModalStyle
{
    //模态视图出现风格
    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    //半透明
    self.modalPresentationStyle = UIModalPresentationOverFullScreen;
}

//触摸消失
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //得到任意的触摸对象
    UITouch *touch = [touches anyObject];
    //得到触摸点
    CGPoint location = [touch locationInView:self.view];
    //对AlertView进行坐标转换
    CGRect rect = [self.view convertRect:self.alertView.frame toView:self.view];
    //判断点是否在AlertView外
    if(!CGRectContainsPoint(rect, location))
    {
        //点击在AlertView外就消失
        [self beforeDismissViewController];
    }
}

//派生类可重写
- (void)beforeDismissViewController
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}


- (void)addAction:(Action *)object
{
    //派生类重写
}

- (void)addActions:(NSArray<Action *> *)actions
{
    //派生类重写
}

#pragma mark - 内存管理

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (void)dealloc
{
    NSLog(@"遮罩视图控制器释放");
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}


@end
