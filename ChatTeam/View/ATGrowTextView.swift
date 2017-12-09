//
//  ATGrowTextView.swift
//  ChatTeam
//
//  Created by yakang wang on 2017/11/19.
//  Copyright © 2017年 yakang wang. All rights reserved.
//

import UIKit

class ATGrowTextView: UIView {
    
    let inputTextView: UITextView
    
    override init(frame: CGRect) {
        self.inputTextView = UITextView()
        super.init(frame: frame)
        
        addSubview(inputTextView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        inputTextView.frame = bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        return super.hitTest(point, with: event)
    }
    
}
