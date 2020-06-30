//
//  ViewController.swift
//  BundleCreate
//
//  Created by 杨俊艺 on 2020/6/28.
//  Copyright © 2020 杨俊艺. All rights reserved.
//

import UIKit

let bannerNib = UINib.init(nibName: "BannerView", bundle: Bundle.init(path: Bundle.main.path(forResource: "AssistBundle", ofType: "bundle")!))

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //使用Bundle加载
        //let bannerBundle = Bundle.init(path: Bundle.main.path(forResource: "AssistBundle", ofType: "bundle")!)
        //let bannerView = bannerBundle?.loadNibNamed("BannerView", owner: nil, options: nil)?[0] as! UIView
        //view.addSubview(bannerView)
        
        
        let bannerView = bannerNib.instantiate(withOwner: nil, options: nil)[0] as! UIView
        view.addSubview(bannerView)
        
    }


}

//Bundle就是一个有着固定结构的目录,所以可以新建一个文件夹加上.bundle后缀
//可以使用字符串拼接的方式获取一个文件的路径
let bundlePath = Bundle.main.path(forResource: "xxx", ofType: "bundle")
let imagePath = bundlePath! + "/1.png"
let image = UIImage.init(contentsOfFile: imagePath)

//用修改文件夹后缀名的方式创建的Bundle可以不能存放IB文件,因为这个修改的Bundle是静态的,不参与项目的编译
//所以必须创建一个Bundle的Target才能把其中的xib和sb序列化为二进制文件
//File->New->Target macOS->Framework&Library->Bundle Product Name填写Bundle的名字
//因为iOS不支持以Target的形式创建Bundle,还需要将新创建的Target的Build Setting里的Supported Platform改成iOS
//然后向这个Target中添加xib文件就可以在scheme中选择这个Target进行编译了
//编译完成Product在Finder中打开并复制到要使用的工程中就可以使用其中的IB文件了
//基于组件化开发的项目一般在辅工程中创建IB文件让主工程使用,但是如果主工程使用辅工程的方式基于CocoaPods就需要使用main Bundle
//只有当开发SDK或者将一个需求写在单独的工程中且要用Bundle存放资源时该Bundle是存在于main Bundle中的,此时使用IB文件要传入这个Bundle

//当编译后的IB文件不在主Bundle中时需要传入文件所在的Bundle对象,加载非main Bundle中的资源时,如加载xxx.bundle中的1@2x.png
let xxxBundle = Bundle.init(path: Bundle.main.path(forResource: "xxx", ofType: "bundle")!)
let images = UIImage.init(contentsOfFile: (xxxBundle?.path(forResource: "1@2x", ofType: "png"))!)

//并且使用forResource方法加载时使用全名,而init(named:)不用使用全名且带缓存机制
//在开发SDK或者将一个功能封装成独立的工程时并将SDK或工程中的文件组织称Bundle时要注意,当通过IB设置图片时可以在IB中显示出来
//但是如果被其他工程使用则需要使用代码来完成显示
//如一个主工程Chat,一个SDK叫Share,SDK中有个名为share的Bundle存放各种logo图片,而shareView负责显示这些图片,在SDK开发过程中可以在IB中显示
//但是将SDK导入Chat后logo就不显示了,正确的做法是在SDK中使用代码显示logo
//因为IB加载图片默认从主Bundle中找,但是SDk的IB和图片通常打包在一个单独的Bundle中

extension Bundle {
    func imagePath(_ forResource: String?, ofType: String?) -> String? {
        guard forResource != nil else {
            return nil
        }
        guard ofType != nil else {
            return nil
        }
        
        var scaleStr: String? = "@2x"
        if UIScreen.main.scale == 3.0 {
            scaleStr = "@3x"
        } else if UIScreen.main.scale == 1.0 {
            scaleStr = "@1x"
        }
        var path = self.path(forResource: forResource! + scaleStr!, ofType: ofType)
        if path == nil {
            path = self.path(forResource: forResource, ofType: ofType)
        }
        return path
    }
}

let shareBundle = Bundle.init(path: Bundle.main.path(forResource: "share", ofType: "bundle")!)
let weChatLogoPath = shareBundle?.imagePath("weChat", ofType: "png")
let weChatLogoImage = UIImage.init(contentsOfFile: weChatLogoPath!)
//使用weChatLogoImage



//要运行该项目先构建编译AssistBundle这个目标生成Bundle再运行不然没有AssistBundle这个Bundle文件
//要运行该项目先构建编译AssistBundle这个目标生成Bundle再运行不然没有AssistBundle这个Bundle文件
//要运行该项目先构建编译AssistBundle这个目标生成Bundle再运行不然没有AssistBundle这个Bundle文件
