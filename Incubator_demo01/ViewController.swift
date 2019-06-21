//
//  ViewController.swift
//  Incubator_demo01
//
//  Created by liangneng on 2019/6/17.
//  Copyright © 2019 liangneng. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let WARN_CELL_ID = "warn_cell_id"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nib = UINib(nibName: "WarnTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: WARN_CELL_ID)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: WARN_CELL_ID) as! WarnTableViewCell
        
        if indexPath.row % 2 == 1 {
            cell.warnName.text = "History"
        }else{
            cell.warnName.text = "Tempture"
        }
        
        cell.warnFloat.text = indexPath.row as? String
        
        return cell
    }
    

    @IBOutlet weak var warnTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //
    }


}

