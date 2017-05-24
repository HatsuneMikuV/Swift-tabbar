//
//  MyViewController.swift
//  Family
//
//  Created by mosaike_v on 16/1/19.
//  Copyright © 2016年 Mosaic. All rights reserved.
//

import UIKit


class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white,NSFontAttributeName:UIFont.systemFont(ofSize: 20)]
        
        self.view.backgroundColor = backGroundColor

        
        self.view.backgroundColor = UIColor.white
        
        NotificationCenter.default.addObserver(self, selector: #selector(MyViewController.keyboardDidChangeFrame(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
        
    }
    
    func addCustomBarButtonItemByImage(_ imageName: String,target: AnyObject?,action: Selector) ->UIBarButtonItem{
        
        return UIBarButtonItem.init(image: UIImage.init(named: imageName), landscapeImagePhone: nil, style: UIBarButtonItemStyle.plain, target: target, action: action)
    }
    
    func addCustomBarButtonItemByTitle(_ title:String,target: AnyObject?,action: Selector) ->UIBarButtonItem{
        
        let barBtn = UIBarButtonItem.init(title: title, style: UIBarButtonItemStyle.plain, target: target, action: action)
        
        barBtn.tintColor = UIColor.white
        return barBtn
    }
    
    func keyboardDidChangeFrame(_ noti: Notification){
        
        
        let frame = (noti.userInfo![UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue
        
        let keyY = frame!.origin.y
        
        let screenH = UIScreen.main.bounds.height
        
        let duration = (noti.userInfo![UIKeyboardAnimationDurationUserInfoKey]! as AnyObject).timeInterval
        
        UIView.animate(withDuration: duration!, animations: { () -> Void in
            self.view.transform = CGAffineTransform(translationX: 0, y: CGFloat.init(keyY - screenH))
        }) 
        
    }
    
    func backViewControllerWithHidenTabBar(_ viewController: UIViewController,isHiden: Bool){
        
        self.tabBarController?.hidesBottomBarWhenPushed = true
        
        self.navigationController?.pushViewController(viewController, animated: true)
        
        self.tabBarController?.hidesBottomBarWhenPushed = isHiden
    }
    
    func backViewController(){
        self.view.endEditing(true)
        self.navigationController?.popToRootViewController(animated: true)
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
