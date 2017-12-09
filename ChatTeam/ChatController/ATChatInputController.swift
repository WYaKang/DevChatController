//
//  ATChatInputController.swift
//  ChatTeam
//
//  Created by yakang wang on 2017/11/18.
//  Copyright © 2017年 yakang wang. All rights reserved.
//

import UIKit

class ATChatInputController: UIViewController {
    
    lazy var quickEmoticonView: ATQuickSendEmoticonView = {
        let emoticonView = ATQuickSendEmoticonView() // WH:105,110
        emoticonView.isHidden = true
        return emoticonView
    }()
    
    lazy var boardBgView: ATUIView = {
        let bgView = ATUIView()
        let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        bgView.frame = bgView.bounds
        bgView.addSubview(effectView)
        return bgView
    }()
    
    lazy var attachmentView: ATSelectAttachmentView = {
        let selectAttView = ATSelectAttachmentView()
        selectAttView.frame = CGRect(x: 0, y: kScreenH - kChatInputBoardHeight, width: kScreenW, height: kChatInputBoardHeight)
        selectAttView.backgroundColor = UIColor.orange
        return selectAttView
    }()
    
    
    let inputToolViewBar: ATInputToolViewBar
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.inputToolViewBar = ATInputToolViewBar(frame: CGRect(x: 0, y: kScreenH - kChatInputToolBarHeight - kChatInputBoardHeight, width: kScreenW, height: kChatInputToolBarHeight))
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func loadView() {
        self.view = ATInputToolView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        view.addSubview(inputToolViewBar)
        view.addSubview(boardBgView)
        view.addSubview(attachmentView)
        
        attachmentView.attachmentItem = ["11111","22222","33333","44444",
                                         "55555","66666","77777","88888",
                                         "99999","00000","99999","00000",
                                         "99999","00000","99999","00000",
                                         "99999","00000","99999","00000",]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
