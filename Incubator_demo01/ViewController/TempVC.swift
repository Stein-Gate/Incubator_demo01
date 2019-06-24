//
//  TempVC.swift
//  Incubator_demo01
//
//  Created by liangneng on 2019/6/21.
//  Copyright © 2019 liangneng. All rights reserved.
//

import UIKit

class TempVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //获取资源
        let plistpath = Bundle.main.path(forResource: "DataInof", ofType: "plist")!
        let data = NSMutableArray(contentsOfFile: plistpath)
        
        //将里面的数据循环出来
        for itemp in data!{
            print("列表中的数据：\(itemp)")
        }
        
        // 初始化TreeNode数组
        let nodes = TreeNodeHelper.sharedInstance.getSortedNodes(data!, defaultExpandLevel: 0)
        
        // 初始化自定义的tableView
        let tableview: TreeTableView = TreeTableView(frame: CGRect(x: 0, y: 108, width: self.view.frame.width, height: self.view.frame.height-20), withData: nodes)
        self.view.addSubview(tableview)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
