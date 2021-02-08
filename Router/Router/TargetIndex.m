//
//  TargetIndex.m
//  Router
//
//  Created by 杨俊艺 on 2020/11/16.
//

#import "TargetIndex.h"
#import "ViewController.h"

@implementation TargetIndex

- (id)action_home:(NSDictionary *)params
{
    ViewController *homeVC = [[ViewController alloc] init];
    homeVC.title = @"Home";
    return homeVC;
}

@end
