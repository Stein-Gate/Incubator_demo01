//
//  TreeNodeHelper.swift
//  Incubator_demo01
//
//  Created by liangneng on 2019/6/19.
//  Copyright © 2019 liangneng. All rights reserved.
//

import Foundation

class TreeNodeHelper{
    //单例模式
    
    class var sharedInstance:TreeNodeHelper{
        struct Static {
            static var instance : TreeNodeHelper? = TreeNodeHelper();
        }
        return Static.instance!
    }
    
    //传入普通节点，排序后转换成node
    func getSortedNodes(_ groups:NSMutableArray,defaultExpandLevel:Int) -> [TreeNode]{
        var result: [TreeNode] = []
        let nodes = convetData2Node(groups)
        let rootNodes = getRootNodes(nodes)
        for item in rootNodes{
            addNode(&result, node: item, defaultExpandLevel: defaultExpandLevel, currentLevel: 1)
        }
        return result
    }
    
    //过滤出所有可见节点
    func filterVisible(_ nodes:[TreeNode]) -> [TreeNode] {
        var result: [TreeNode] = []
        for item in nodes {
            if item.isRoot() || item.isParentExpand() {
                setNodeIcon(item)
                result.append(item)
            }
        }
        return result
    }
    
    //将数据转化成节点
    func convetData2Node(_ groups : NSMutableArray) -> [TreeNode] {
        var nodes : [TreeNode] = []
        var node : TreeNode
        var desc : String?
        var id : String?
        var pid : String?
        var label : String?
        
        for element in groups{
            let item = element as? [String:Any]
            desc = item?["description"] as? String
            id = item?["id"] as? String
            pid = item?["pid"] as? String
            label = item?["name"] as? String
            
            node = TreeNode(desc: desc, id: id, pid: pid, name: label)
            nodes.append(node)
        }
        
        /*
         * 设置Node之间的父子关系；让每两个节点比较一次，就可以设置其中的关系
         */
        
        var m : TreeNode
        var n : TreeNode
        for i in 0..<nodes.count{
            n = nodes[i]
            
            for j in i+1..<nodes.count{
                m = nodes[j]
                if m.pid == n.id{
                    n.children.append(m)
                    m.parent = n
                }else if n.pid == m.id{
                    m.children.append(n)
                    n.parent = m
                }
            }
        }
        for item in nodes{
            setNodeIcon(item)
        }
        return nodes
    }
    
    //获取根节点的集合
    func getRootNodes(_ nodes:[TreeNode]) -> [TreeNode] {
        var root:[TreeNode] = []
        for item in nodes{
            if item.isRoot(){
                root.append(item)
            }
        }
        return root
    }
    
    //把一个节点所有的子节点都挂上去
    func addNode(_ nodes:inout [TreeNode],node:TreeNode,defaultExpandLevel: Int,currentLevel:Int){
        nodes.append(node)
        if defaultExpandLevel >= currentLevel{
            node.setExpand(isExpand: true)
        }
        if node.isLeaf(){
            return
        }
        for i in 0..<node.children.count{
            addNode(&nodes, node: node.children[i], defaultExpandLevel: defaultExpandLevel, currentLevel: currentLevel+1)
        }
    }
    
    
    //设置节点图标
    func setNodeIcon(_ node:TreeNode){
        if node.children.count > 0{
            node.type = TreeNode.NODE_TYPE_G
            if node.isExpand{
                //设置icon向下的箭头
                node.icon = "tree_ex.png"
            }else{
                //icon为向右的箭头
                node.icon = "tree_ec.png"
            }
        }else{
            node.type = TreeNode.NODE_TYPE_N
        }
    }
}
