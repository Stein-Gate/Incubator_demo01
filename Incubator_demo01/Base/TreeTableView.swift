//
//  TreeTableView.swift
//  Incubator_demo01
//
//  Created by liangneng on 2019/6/20.
//  Copyright © 2019 liangneng. All rights reserved.
//

import UIKit

class TreeTableView: UITableView ,UITableViewDelegate,UITableViewDataSource{
    
    //所有的节点
    var mAllNodes:[TreeNode]
    //可见的节点
    var mNodes:[TreeNode]
    
    let NODE_CELL_ID = "nodecell"
    //
    
    init(frame:CGRect,withData data:[TreeNode]) {
        super.init(frame: frame, style: UITableView.Style.plain)
        self.delegate = self
        self.dataSource = self
        mAllNodes = data
        mNodes = TreeNodeHelper.sharedInstance.filterVisible(mAllNodes)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //通过nib自定义的TableViewCell
        let nib = UINib(nibName: "",bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    
    
    
    
    
}
