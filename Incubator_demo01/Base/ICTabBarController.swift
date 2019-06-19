//
//  ICTabBarController.swift
//  Incubator_demo01
//
//  Created by liangneng on 2019/6/19.
//  Copyright © 2019 liangneng. All rights reserved.
//

import UIKit

class ICTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //添加子控制器
        
        
    }
    
    //添加子控制器：private 方法
    private func addChildViewController(_ childController:ViewController,title : String,imageName : String){
        //设置子控制器的tabBarIte的标题图片
        childController.title = title;
        childController.tabBarItem.image = UIImage(named: imageName);
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        
        //2.添加子控制器
        let childNav = UINavigationController(rootViewController: childController);
        self.addChild(childNav)
    }
    
    
}
