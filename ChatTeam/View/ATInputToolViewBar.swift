//
//  ATInputToolViewBar.swift
//  ChatTeam
//
//  Created by yakang wang on 2017/11/19.
//  Copyright © 2017年 yakang wang. All rights reserved.
//

import UIKit

class ATInputToolViewBar: UIView {

    let effectView: UIVisualEffectView
    let separatLineView: UIView
    let growTextView: ATGrowTextView
    let transparentBtn: ATTransparentButton
    let voiceBtn: UIButton
    let expressBtn: UIButton
    let attachmentBtn: UIButton
    
    let blur = UIBlurEffect(style: .light)
    
    fileprivate let BtnW: CGFloat = 35.0
    fileprivate let BtnH: CGFloat = 35.0
    fileprivate let BtnBottomMargin: CGFloat = 8.0
    fileprivate let BtnLeftMargin: CGFloat = 1.0
    fileprivate let ScreenW: CGFloat = UIScreen.main.bounds.size.width
    fileprivate let ScreenH: CGFloat = UIScreen.main.bounds.size.height
    
    override init(frame: CGRect) {
        self.effectView       = UIVisualEffectView(effect: blur)
        self.growTextView     = ATGrowTextView()
        self.separatLineView  = UIView()
        self.transparentBtn   = ATTransparentButton()
        self.voiceBtn         = UIButton(type: .custom)
        self.expressBtn       = UIButton(type: .custom)
        self.attachmentBtn    = UIButton(type: .custom)
        super.init(frame: frame)
        
        self.addSubview(effectView)
        self.addSubview(growTextView)
        self.addSubview(separatLineView)
        self.addSubview(transparentBtn)
        self.addSubview(voiceBtn)
        self.addSubview(expressBtn)
        self.addSubview(attachmentBtn)
        
        self.isUserInteractionEnabled = true
        
        transparentBtn.isHidden = true
        
        separatLineView.backgroundColor = .red
        transparentBtn.backgroundColor  = .red
        voiceBtn.backgroundColor        = UIColor.brown
        expressBtn.backgroundColor      = UIColor.brown
        attachmentBtn.backgroundColor   = UIColor.brown
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        effectView.frame = bounds
        separatLineView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: 1/UIScreen.main.scale)
        
        voiceBtn.frame = CGRect(x: BtnLeftMargin,
                                y: bounds.height - BtnH - BtnBottomMargin,
                            width: BtnW,
                           height: BtnH)
        attachmentBtn.frame = CGRect(x: ScreenW - BtnLeftMargin - BtnW,
                                     y: voiceBtn.frame.origin.y,
                                 width: BtnW,
                                height: BtnH)
        expressBtn.frame = CGRect(x: attachmentBtn.frame.origin.x - BtnW - 10,
                                  y: voiceBtn.frame.origin.y,
                              width: BtnW,
                             height: BtnH)
        growTextView.frame = CGRect(x: voiceBtn.frame.maxX + 10,
                                    y: voiceBtn.frame.origin.y,
                                width: expressBtn.frame.origin.x - voiceBtn.frame.maxX - 20,
                               height: BtnH)
        transparentBtn.frame = growTextView.frame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
