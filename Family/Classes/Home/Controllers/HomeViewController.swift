//
//  HomeViewController.swift
//  Family
//
//  Created by mosaike_v on 16/1/19.
//  Copyright © 2016年 Mosaic. All rights reserved.
//

import UIKit

class HomeViewController: MyViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.orange
        
        self.navigationItem.title = "Home"
        
        self.navigationItem.leftBarButtonItem = self.addCustomBarButtonItemByTitle("返回", target: self, action: #selector(HomeViewController.dismissViewController))
    }

    func dismissViewController(){
        self.view.endEditing(true)
        self.navigationController?.dismiss(animated: true, completion: { () -> Void in
            
        })
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
