//
//  ATConstant.swift
//  ChatTeam
//
//  Created by yakang wang on 2017/11/19.
//  Copyright © 2017年 yakang wang. All rights reserved.
//

import UIKit

public let kScreenSize: CGSize = UIScreen.main.bounds.size
public let kScreenW: CGFloat = kScreenSize.width
public let kScreenH: CGFloat = kScreenSize.height

public let kScreenScale: CGFloat = UIScreen.main.scale
public let kPixelOne: CGFloat = 1 / kScreenScale






/// 内部使用
public let kChatInputToolBarHeight: CGFloat = 50.0
public let kChatInputBoardHeight: CGFloat = 230.0




extension UIColor {
    //返回随机颜色
    open class var randomColor: UIColor{
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}


