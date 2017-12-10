//
//  ATEmoticonBoardView.swift
//  ChatTeam
//
//  Created by yakang wang on 2017/12/9.
//  Copyright © 2017年 yakang wang. All rights reserved.
//

import UIKit

class ATEmoticonBoardView: UIView {
    
    fileprivate let kEmoticonTabBarHeight: CGFloat = 44.0
    
    fileprivate let separatLineView: UIView
    fileprivate let emoticonBottomTabBar: ATEmoticonBottomTabBar
    
    
    override init(frame: CGRect) {
        self.separatLineView = UIView()
        self.emoticonBottomTabBar = ATEmoticonBottomTabBar()
        
        super.init(frame: frame)
        
        addSubview(separatLineView)
        addSubview(emoticonBottomTabBar)
        
        
        
        separatLineView.backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        separatLineView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: kPixelOne)
        
        emoticonBottomTabBar.frame = CGRect(x: 0, y: bounds.height - kEmoticonTabBarHeight, width: bounds.width, height: kEmoticonTabBarHeight)
    }
    

}
