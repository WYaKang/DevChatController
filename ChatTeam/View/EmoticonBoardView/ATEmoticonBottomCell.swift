//
//  ATEmoticonBottomCell.swift
//  ChatTeam
//
//  Created by yakang wang on 2017/12/9.
//  Copyright © 2017年 yakang wang. All rights reserved.
//

import UIKit

class ATEmoticonBottomCell: UICollectionViewCell {
    let bgView: UIView
    let emoticonItemView: ATEmoticonTabItemView
    
    override init(frame: CGRect) {
        self.bgView = UIView()
        self.emoticonItemView = ATEmoticonTabItemView()
        super.init(frame: frame)
        
        addSubview(bgView)
        addSubview(emoticonItemView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        bgView.frame = bounds
        emoticonItemView.frame = bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
