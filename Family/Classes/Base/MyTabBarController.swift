//
//  MyTabBarController.swift
//  Family
//
//  Created by mosaike_v on 16/1/19.
//  Copyright © 2016年 Mosaic. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {
    
    var tabBarView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        tabBarView = UIView.init(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 49))
        tabBarView.backgroundColor = backGroundColor
        let array = Array.init(arrayLiteral: "第一页","第二页","第三页","第四页","第五页")
        
        let arrayImageNor = Array.init(arrayLiteral: "home_shouye","home_shouye","home_kangfuriji","home_shouye","home_shouye")

        let arrayImageHei = Array.init(arrayLiteral:"home_shouye_selected","home_shouye_selected","home_kangfuriji_selected","home_shouye_selected","home_shouye_selected")

        
        let indexs = 0...4
    
        
        for var index in indexs {
            
            if index == 2 {
                
                createCenterBtn()
                
                index += 1
            }
            let width = screenWidth * 0.2 * CGFloat.init(index)
            
            let btn = UIButton.init(frame: CGRect(x: width, y: 0, width: screenWidth * 0.2, height: 49))
            btn.tag = index
            btn.addTarget(self, action: #selector(MyTabBarController.btnClick(_:)), for: UIControlEvents.touchUpInside)
            btn.setTitle(array[index], for: UIControlState())
            btn.setTitleColor(navgationBarColor, for: UIControlState.selected)
            btn.setTitleColor(navgationBarColor, for: UIControlState.highlighted)
            btn.setTitleColor(UIColor.black, for: UIControlState())
            btn.setImage(UIImage.init(named: arrayImageNor[index]), for: UIControlState())
            btn.setImage(UIImage.init(named: arrayImageHei[index]), for: UIControlState.selected)
            btn.setImage(UIImage.init(named: arrayImageHei[index]), for: UIControlState.highlighted)
            
            let margin = (screenWidth * 0.2 - 30) * 0.5
            btn.imageEdgeInsets = UIEdgeInsets.init(top: 5, left: margin, bottom: 15, right: margin)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 9)
            btn.titleEdgeInsets = UIEdgeInsets.init(top: 35, left: -20, bottom: 0, right: 10)
            
            btn.isSelected = (index == 0)
            
            tabBarView.addSubview(btn)
        }
        
        
        
        let navFirst = MyNavigationController(rootViewController:FirstViewController())
        
        let navSecond = MyNavigationController(rootViewController:SecondViewController())
        
        let navThird = MyNavigationController(rootViewController:ThirdViewController())
        
        let navFour = MyNavigationController(rootViewController:FourViewController())
        
        
        
        self.viewControllers = [navFirst,navSecond,navThird,navFour]
        
        self.tabBar.addSubview(tabBarView)
        
    }

    func createCenterBtn(){
        let centerBtn = UIButton()
        centerBtn.center = CGPoint.init(x: screenWidth * 0.5, y: 19)
        centerBtn.bounds = CGRect.init(x: 0, y: 0, width: 60, height: 60)
        centerBtn.setImage(UIImage.init(named: "home_kangfuriji"), for: UIControlState())
        centerBtn.setImage(UIImage.init(named: "home_kangfuriji_selected"), for: UIControlState.selected)
        centerBtn.tag = 2
        centerBtn.clipsToBounds = true
        centerBtn.layer.borderColor = backGroundColor.cgColor
        centerBtn.layer.borderWidth = 5
        centerBtn.layer.cornerRadius = 30
        centerBtn.addTarget(self, action: #selector(MyTabBarController.btnClick(_:)), for: UIControlEvents.touchUpInside)
        tabBarView.addSubview(centerBtn)
    }
    
    
    @objc func btnClick(_ sender: UIButton) {
        
        if sender.tag == 2 {
            
            let navCenter = MyNavigationController(rootViewController:HomeViewController())
            self.present(navCenter, animated: true, completion: { () -> Void in
                
            })
        }
        else{
            for btn in tabBarView.subviews as! [UIButton] {
                btn.isSelected = (sender.tag == btn.tag)
                
            }
            
            if sender.tag <= 1 {
                self.selectedIndex = sender.tag
            }
            else if sender.tag > 2 {
                self.selectedIndex = sender.tag - 1
            }
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        for child in self.tabBar.subviews {
            if child.isKind(of: NSClassFromString("UIImageView")!) {
                child.removeFromSuperview()
            }
        }
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
