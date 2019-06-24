//
//  TreeNode.swift
//  Incubator_demo01
//
//  Created by liangneng on 2019/6/19.
//  Copyright © 2019 liangneng. All rights reserved.
//

class TreeNode{
    //表示该节点不是叶子节点
    static let NODE_TYPE_G : Int = 0;
    //表示该节点是叶子节点
    static let NODE_TYPE_N : Int = 1;
    var type:Int?
    
    //对于多种类型内容，需要确定其类型
    var desc:String?
    
    var id:String?
    
    var pid:String?
    
    var name:String?
    
    var level:Int?
    
    var isExpand:Bool = false
    
    var icon:String?
    
    var children:[TreeNode] = []
    
    var parent:TreeNode?
    
    //初始化函数
    init(desc:String?,id:String?,pid:String?,name:String?) {
        self.desc = desc
        self.id = id
        self.pid = pid
        self.name = name
    }
    
    //是否为根节点
    func isRoot() -> Bool{
        return parent == nil;
    }
    
    //判断父节点是否打开
    func isParentExpand() -> Bool{
        if parent == nil {
            return false
        }
        return (parent?.isExpand)!
    }
    
    //是否是叶子节点
    func isLeaf() -> Bool{
        return children.count == 0
    }
    
    //获取level，用于设置节点内容的左偏移
    func getLevel() -> Int{
        if parent == nil {
            return 0
        }else{
            //如果不为0的话就继续迭代
            return (parent?.getLevel())! + 1
        }
    }
    
    //设置展开
    func setExpand(isExpand:Bool){
        self.isExpand = isExpand
        if !isExpand {
            for i in children{
                i.setExpand(isExpand: isExpand)
            }
        }
    }
}
