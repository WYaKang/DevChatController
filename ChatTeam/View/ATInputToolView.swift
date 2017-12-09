//
//  ATInputToolView.swift
//  ChatTeam
//
//  Created by yakang wang on 2017/11/18.
//  Copyright © 2017年 yakang wang. All rights reserved.
//

import UIKit

class ATInputToolView: UIView {

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        if (kScreenH - kChatInputToolBarHeight - kChatInputBoardHeight) < point.y {
            return super.hitTest(point, with: event)
        } else {
            return nil
        }
    }

}
