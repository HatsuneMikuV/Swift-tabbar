//
//  SecondViewController.swift
//  Family
//
//  Created by mosaike_v on 16/1/19.
//  Copyright © 2016年 Mosaic. All rights reserved.
//

import UIKit

class SecondViewController: MyViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.blue
        
        
        self.navigationItem.title = "第二"
        
        //字符串加密
        
        let content: String = "1"
        let hash: String = "FuGN-hy33QS-7c8sv-k30LBYAh1H"
        let hashAlgo: String = "a"
        
        let hashDecoded: Data = safeBase64Decode(encoded: hash)
        let messageBytes: [UInt8] = Array(content.utf8)
            + hashDecoded.withUnsafeBytes{[UInt8](UnsafeBufferPointer(start: $0, count: hashDecoded.count))}
            + Array(hashAlgo.utf8)
        
        let message: Data = Data(bytes: messageBytes)
        let hashServer: String = message.base64EncodedString()
        print("要上传服务器的加密字符串：" + hashServer)
    }
    
    func safeBase64Decode(encoded: String) -> Data! {
        let base64Encoded = encoded
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")
        if let data = Data(base64Encoded: base64Encoded) {
            return data
        }
        return nil
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
