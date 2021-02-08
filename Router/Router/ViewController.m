//
//  ViewController.m
//  Router
//
//  Created by 杨俊艺 on 2020/11/16.
//

#import "ViewController.h"
#import "Router.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    UIViewController *vc = [[Router sharedInstance] openURL:@"http://Index/home:"];
    //Index为组件索引
    //home为actionName
    //冒号表示带参数
//    [self presentViewController:vc animated:true completion:^{
//        NSLog(@"JUMP");
//    }];
}


@end

//纵向分层
//横向根据业务组件化
//App路由能解决哪些问题：
//1->点击推送消息要求跳转到App内部一个很深层次的一个界面。比如微信的3D-Touch可以直接跳转到“我的二维码”。或者再极端一点要求跳转到App内部第十层的界面怎么处理？
//2->如何解除App组件之间和App页面之间的耦合性？
//3->如何能统一iOS和Android两端的页面跳转逻辑？甚至如何能统一三端的请求资源的方式？
//4->如果App出现bug了如何不用JSPatch就能做到简单的热修复功能？
//5->如何在每个组件间调用和页面跳转时都进行埋点统计？每个跳转的地方都手写代码埋点？利用Runtime AOP？
//6->如何在App任何界面都可以调用同一个界面或者同一个组件？只能在AppDelegate里面注册单例来实现？
//7->比如App出现问题了用户可能在任何界面，如何随时随地的让用户强制登出？或者强制都跳转到同一个本地的error界面？或者跳转到相应的H5，ReactNative，Weex界面？如何让用户在任何界面随时随地的弹出一个View？
//APP跳转实现
//1->URL Scheme方式
//在iPhone的Safari浏览器上面输入如下的命令会自动打开一些App
//2->Universal Links 方式
//iOS 9.0新增加了一项功能是Universal Links可以使我们的App通过HTTP链接来启动App
//App需要开启Associated Domains服务并设置Domains，注意必须要applinks：开头
//域名必须要支持HTTPS。上传内容是Json格式的文件，名为apple-app-site-association到自己域名的根目录下，或者.well-known目录下。iOS自动会去读取这个文件。
//如果App支持了Universal Links方式那么可以在其他App里面直接跳转到我们自己的App里面。如下图点击链接，由于该链接会Matcher到我们设置的链接，所以菜单里面会显示用我们的App打开
//
//App内组件路由设计主要为了解决
//①各个页面和组件之间的跳转问题
//②各个组件之间相互调用
//Route实现
//主工程与首页模块、分类、登录模块不直接建立关联，而是先通过router(路由)与你要调用的模块建立关系 ，从而实现各个模块的解耦和复用、
//
//
//
//
//
//
//
