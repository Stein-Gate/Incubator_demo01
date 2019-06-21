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
    var mAllNodes:[TreeNode]?
    //可见的节点
    var mNodes:[TreeNode]?
    
    let NODE_CELL_ID = "nodecell"
    //
    
    init(frame:CGRect,withData data:[TreeNode]) {
        super.init(frame: frame, style: UITableView.Style.plain)
        self.delegate = self
        self.dataSource = self
        mAllNodes = data
        mNodes = TreeNodeHelper.sharedInstance.filterVisible(mAllNodes!)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //通过nib自定义的TableViewCell
        let nib = UINib(nibName: "TreeNodeTableViewCell",bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: NODE_CELL_ID)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NODE_CELL_ID) as! TreeNodeTableViewCell
        
        let node:TreeNode = mNodes![indexPath.row]
        
        //cell缩进
        cell.background.bounds.origin.x =  -20*CGFloat(node.getLevel())
        
        //修改代码nodeIMG---UIImageView的显示模式
        if node.type == TreeNode.NODE_TYPE_G{
            
        }else{
            cell.nodeImage.image = nil
        }
        
        cell.nodeName.text = node.name
        cell.nodeDesc.text = node.desc
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (mNodes?.count)!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55.0
    }
    
    //列表某一行被点击
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let parentNode = mNodes![indexPath.row]
        
        let startPosition = indexPath.row + 1
        var endPosition = startPosition
        
        if parentNode.isLeaf(){
            //如果是叶子节点就什么都不做
            print("叶子节点被点击，无法展开")
        }else{
            expandOrCollapse(&endPosition, node: parentNode)
            mNodes = TreeNodeHelper.sharedInstance.filterVisible(mAllNodes!) //更新可见节点
            
            //修正indexPath
            var indexPathArray : [IndexPath] = []
            var tempIndexPath : IndexPath?
            for i in startPosition..<endPosition{
                tempIndexPath = IndexPath(row: i, section: 0)
                indexPathArray.append(tempIndexPath!)
            }
            
            //插入和删除节点的动画
            if parentNode.isExpand{
                self.insertRows(at: indexPathArray, with: UITableView.RowAnimation.none)
            }else{
                self.deleteRows(at: indexPathArray, with: UITableView.RowAnimation.none)
            }
            //更新被选组节点
            self.reloadRows(at: [indexPath], with: UITableView.RowAnimation.none)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //展开或者关闭某个节点
    func expandOrCollapse(_ count:inout Int ,node : TreeNode){
        if node.isExpand{
            closeChildNode(&count, node: node)
        }else{      //如果节点是关着的，打开当前节点即可
            count += node.children.count
            node.setExpand(isExpand: true)
        }
    }
    
    
    //关闭某个节点和它所包含的子节点
    func closeChildNode(_ count : inout Int,node:TreeNode){
        //如果节点是最后的叶子节点，直接返回
        if(node.isLeaf()){
            return
        }
        if node.isExpand{
            node.isExpand = false
            //关闭子节点
            for item in node.children{
                count += 1  //计算子节点数+1
                closeChildNode(&count, node: item)
            }
        }
    }
    
    
}
