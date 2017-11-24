//
//  Config.swift
//  Family
//
//  Created by mosaike_v on 16/1/19.
//  Copyright © 2016年 Mosaic. All rights reserved.
//

import Foundation
import UIKit

/**
 *  背景颜色
 */
let backGroundColor = UIColor.init(red: 0.92, green: 0.92, blue: 0.92, alpha: 1.0)
/**
*  导航栏颜色
*/
let navgationBarColor = UIColor.init(red: 0.48, green: 0.79, blue: 0.47, alpha: 1.0)
/**
 *  设备宽高
 */
let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height
/**
 *  网络请求接口
 */
func netWorkingNum(_ num: Int) ->String {
    let numStr = NSString(format: "%02d", num)
    print("\(numStr)")
    return "http://192.168.1.101:8080/mosaic-service-family/family?c=c\(numStr)"
}
