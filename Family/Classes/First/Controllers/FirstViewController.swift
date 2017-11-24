//
//  FirstViewController.swift
//  Family
//
//  Created by mosaike_v on 16/1/19.
//  Copyright © 2016年 Mosaic. All rights reserved.
//

import UIKit

class FirstViewController: MyViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.leftBarButtonItem = addCustomBarButtonItemByTitle("私信", target: self, action:#selector(FirstViewController.message))

        self.navigationItem.title = "第一"
        
        
        self.view.addSubview(self.tableView())
    }
    
    func tableView() -> UITableView {
        let width = self.view.bounds.size.width;
        let height = self.view.bounds.size.height;

        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: width, height: height - 64), style: UITableViewStyle.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 44;
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        return tableView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell.textLabel!.text = "Cell text" + String.init(format: "%d-%d", indexPath.section,indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 375, height: 45))
        label.backgroundColor = UIColor.lightGray
        label.text = "  Header--" + String.init(format: "%d", section)
        return label
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = UIViewController.init()
        vc.view.backgroundColor = UIColor.white
        vc.navigationItem.title = "Cell text" + String.init(format: "%d-%d", indexPath.section,indexPath.row)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func message() {
        let vc = MessageViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    var tableView: {UITableView.init()} // default is UITableViewAutomaticDimension

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
