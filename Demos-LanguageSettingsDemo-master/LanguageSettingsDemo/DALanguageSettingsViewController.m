//
//  DALanguageSettingsViewController.m
//  LanguageSettingsDemo
//
//  Created by DarkAngel on 2017/5/4.
//  Copyright © 2017年 暗の天使. All rights reserved.
//

#import "DALanguageSettingsViewController.h"
#import "DAConfig.h"
#import "NSBundle+DAUtils.h"

@interface DALanguageSettingsViewController ()

@end

@implementation DALanguageSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - TableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    //用户没有自己设置的语言userLanguage，则跟随手机系统选中第一个cell
    if (![DAConfig userLanguage].length) {
        cell.accessoryType = indexPath.row == 0 ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    } else {
        //如果用户有设置且是中文
        if ([NSBundle isChineseLanguage]) {
            if (indexPath.row == 1) {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            } else {
                cell.accessoryType = UITableViewCellAccessoryNone;
            }
        } else {//如果用户有设置且是英文
            if (indexPath.row == 2) {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            } else {
                cell.accessoryType = UITableViewCellAccessoryNone;
            }
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //获取当前点中的cell
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //如果cell已经是选中状态则直接返回
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        return;
    }
    //将选中的cell设置为选中状态
    for (UITableViewCell *acell in tableView.visibleCells) {
        acell.accessoryType = acell == cell ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    }
    //根据点击的cell切换语言
    if (indexPath.row == 0) {
        [DAConfig setUserLanguage:nil];
    } else if (indexPath.row == 1) {
        [DAConfig setUserLanguage:@"zh-Hans"];
    } else {
        [DAConfig setUserLanguage:@"en"];
    }
    //切换完语言更新当前storyboard
    //实例化UITabBarController并设置第三个活跃
    UITabBarController *tbc = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateInitialViewController];
    tbc.selectedIndex = 2;
    //实例化语言设置
    DALanguageSettingsViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([DALanguageSettingsViewController class])];
    UINavigationController *nvc = tbc.selectedViewController;
    
    NSMutableArray *vcs = nvc.viewControllers.mutableCopy;
    [vcs addObject:vc];
    //解决奇怪的动画bug。异步执行
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIApplication sharedApplication].keyWindow.rootViewController = tbc;
        nvc.viewControllers = vcs;
        NSLog(@"已切换到语言 %@", [NSBundle currentLanguage]);
    });
}


@end
