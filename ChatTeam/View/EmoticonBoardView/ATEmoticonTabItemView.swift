//
//  ATEmoticonTabItemView.swift
//  ChatTeam
//
//  Created by yakang wang on 2017/12/9.
//  Copyright © 2017年 yakang wang. All rights reserved.
//

import UIKit

class ATEmoticonTabItemView: UIView {

    let separatVerticalView: UIView
    let imageView: UIImageView
    
    override init(frame: CGRect) {
        separatVerticalView = UIView()
        imageView = UIImageView()
        super.init(frame: frame)
        
        addSubview(imageView)
        addSubview(separatVerticalView)
        
        separatVerticalView.backgroundColor = UIColor(red: 236/255.0, green: 236/255.0, blue: 236/255.0, alpha: 1)
//        imageView.backgroundColor = UIColor.blue
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = CGRect(x: 10, y: 6, width: 25, height: 25)
        separatVerticalView.frame = CGRect(x: bounds.width - kPixelOne,
                                           y: 6,
                                           width: kPixelOne,
                                           height: 32)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
