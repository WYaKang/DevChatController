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
    fileprivate let kEmoticonTopOffset: CGFloat = 160.0
    
    fileprivate let separatLineView: UIView
    fileprivate let emoticonBottomTabBar: ATEmoticonBottomTabBar
    fileprivate let emoticonContinerView: UIView
    
    override init(frame: CGRect) {
        self.separatLineView = UIView()
        self.emoticonBottomTabBar = ATEmoticonBottomTabBar()
        self.emoticonContinerView = UIView()
        
        super.init(frame: frame)
        
        addSubview(separatLineView)
        addSubview(emoticonBottomTabBar)
        addSubview(emoticonContinerView)
        emoticonContinerView.backgroundColor = UIColor(white: 0.555, alpha: 0.5555)
        
        separatLineView.backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        separatLineView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: kPixelOne)
        
        emoticonBottomTabBar.frame = CGRect(x: 0, y: bounds.height - kEmoticonTabBarHeight, width: bounds.width, height: kEmoticonTabBarHeight)
        emoticonContinerView.frame = CGRect(x: 0, y: -kEmoticonTopOffset, width: kScreenW, height: bounds.height - kEmoticonTabBarHeight + kEmoticonTopOffset)
    }
    

}
