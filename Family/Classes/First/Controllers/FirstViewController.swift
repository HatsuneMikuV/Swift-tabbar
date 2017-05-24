//
//  FirstViewController.swift
//  Family
//
//  Created by mosaike_v on 16/1/19.
//  Copyright © 2016年 Mosaic. All rights reserved.
//

import UIKit

class FirstViewController: MyViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.red
        
        self.navigationItem.leftBarButtonItem = addCustomBarButtonItemByTitle("私信", target: self, action:#selector(FirstViewController.message))

        self.navigationItem.title = "第一"

    }
    
    func message() {
        let vc = MessageViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
