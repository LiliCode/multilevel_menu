//
//  MultilevelMenuAlertController.m
//  多级菜单
//
//  Created by LiliEhuu on 16/8/15.
//  Copyright © 2016年 LiliEhuu. All rights reserved.
//

#import "MultilevelMenuAlertController.h"
#import "OneMenuCellTableViewCell.h"
#import "TwoMenuCellTableViewCell.h"

#import "UITableView+EmptyData.h"
#import "UIColor+Extensions.h"

#define ONE_TABLEVIEW_TAG   (100)
#define TWO_TABLEVIEW_TAG   (101)

#define MenuH   (300)

@interface MultilevelMenuAlertController ()<UITableViewDataSource, UITableViewDelegate>
@property (strong , nonatomic) UITableView *oneTableView;
@property (strong , nonatomic) UITableView *twoTableView;
@property (strong , nonatomic) UIView *alert;
@property (strong , nonatomic) NSArray *menuList;
@property (assign , nonatomic) NSUInteger index;    //一级菜单的下标


@end

@implementation MultilevelMenuAlertController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:.3];
    
    self.alert = [[UIView alloc] initWithFrame:CGRectMake(0, 60, [UIScreen mainScreen].bounds.size.width, MenuH)];
    [self.alertView addSubview:self.oneTableView];
    [self.alertView addSubview:self.twoTableView];
    [self.view addSubview:self.alertView];
    
    [self.oneTableView reloadData];
    
    //一级菜单第0行设置成选中状态
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.oneTableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
}


+ (instancetype)multilevelMenuWithMenuModel:(MultilevelMenuModel *)model
{
    return [[self alloc] initMultilevelMenuWithMenuModel:model];
}

- (instancetype)initMultilevelMenuWithMenuModel:(MultilevelMenuModel *)model
{
    if (self = [super init])
    {
        self.menuList = [model getMenuList];
    }
    
    return self;
}


- (UITableView *)oneTableView
{
    if (!_oneTableView)
    {
        CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width/2.0f, MenuH);
        _oneTableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
        _oneTableView.showsVerticalScrollIndicator = NO;
        _oneTableView.showsHorizontalScrollIndicator = NO;
        _oneTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _oneTableView.delegate = self;
        _oneTableView.dataSource = self;
        _oneTableView.tag = ONE_TABLEVIEW_TAG;
        //注册Cell
        [_oneTableView registerNib:[UINib nibWithNibName:@"OneMenuCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"oneCell"];
        //设置选中哦颜色
    }
    
    return _oneTableView;
}

- (UITableView *)twoTableView
{
    if (!_twoTableView)
    {
        CGRect rect = CGRectMake([UIScreen mainScreen].bounds.size.width/2.0f, 0, [UIScreen mainScreen].bounds.size.width/2.0f, MenuH);
        _twoTableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
        _twoTableView.showsVerticalScrollIndicator = NO;
        _twoTableView.showsHorizontalScrollIndicator = NO;
        _twoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _twoTableView.delegate = self;
        _twoTableView.dataSource = self;
        _twoTableView.tag = TWO_TABLEVIEW_TAG;
        //注册Cell
        [_twoTableView registerNib:[UINib nibWithNibName:@"TwoMenuCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"twoCell"];
        //背景色
        _twoTableView.backgroundColor = [UIColor colorWithHexValue:@"#F2F2F2" alpha:1];
    }
    
    return _twoTableView;
}

#pragma mark - table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numberOfRows = self.menuList.count;
    
    if (TWO_TABLEVIEW_TAG == tableView.tag)
    {
        Action *action = self.menuList[self.index];    //拿到二级菜单
        numberOfRows = [tableView tableViewDisplayMessage:@"没有更多" ifNecessaryForRowCount:action.actions.count];
    }
    
    return numberOfRows;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self getTableViewCell:tableView indexPath:indexPath];
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (ONE_TABLEVIEW_TAG == tableView.tag) //点击一级菜单刷新二级菜单
    {
        self.index = indexPath.row;
        [self.twoTableView reloadData];
    }
    else
    {
        //点击二级菜单
        
    }
}


- (UITableViewCell *)getTableViewCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    switch (tableView.tag)
    {
        case ONE_TABLEVIEW_TAG:
        {
            OneMenuCellTableViewCell *oneCell = [tableView dequeueReusableCellWithIdentifier:@"oneCell" forIndexPath:indexPath];
            Action *action = self.menuList[indexPath.row];
            oneCell.title = action.title;
            oneCell.detail = [NSString stringWithFormat:@"%@", action.detail];
            
            cell = oneCell;
        }break;
            
        case TWO_TABLEVIEW_TAG:
        {
            TwoMenuCellTableViewCell *twoCell = [tableView dequeueReusableCellWithIdentifier:@"twoCell" forIndexPath:indexPath];
            twoCell.accessoryType = UITableViewCellAccessoryNone;
            Action *oneAction = self.menuList[self.index];
            Action *twoAction = oneAction.actions[indexPath.row];   //取二级菜单数据
            twoCell.title = twoAction.title;
            twoCell.detail = [NSString stringWithFormat:@"%@", twoAction.detail];
            //cell背景色为无色
            twoCell.backgroundColor = [UIColor clearColor];
            
            cell = twoCell;
        }break;
            
        default: break;
    }
    
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (UIView *)alertView
{
    return self.alert;
}

- (void)dealloc
{
    NSLog(@"多级菜单控制器释放");
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}

@end






