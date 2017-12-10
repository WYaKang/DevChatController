//
//  ATEmoticonBoardPageQQEmojiCell.swift
//  ChatTeam
//
//  Created by yakang wang on 2017/12/10.
//  Copyright © 2017年 yakang wang. All rights reserved.
//

import UIKit

class ATEmoticonBoardPageQQEmojiCell: UICollectionViewCell {
    
    let bgView: UIView = UIView()
    let emojiGridView: UIView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        addSubview(emojiGridView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.frame = bounds
        emojiGridView.frame = bounds
    }
    
}
