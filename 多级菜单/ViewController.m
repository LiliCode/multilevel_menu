//
//  ViewController.m
//  多级菜单
//
//  Created by LiliEhuu on 16/8/15.
//  Copyright © 2016年 LiliEhuu. All rights reserved.
//

#import "ViewController.h"
#import "MultilevelMenuModel.h"
#import "MultilevelMenuAlertController.h"

@interface ViewController ()
@property (strong , nonatomic) MultilevelMenuModel *menuModel;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.menuModel = [[MultilevelMenuModel alloc] init];
    
}

- (IBAction)menu:(UIBarButtonItem *)sender
{
    MultilevelMenuAlertController *alert = [MultilevelMenuAlertController multilevelMenuWithMenuModel:self.menuModel selectInfo:^(id info) {
        NSLog(@"%@", info);
    }];
    
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end





