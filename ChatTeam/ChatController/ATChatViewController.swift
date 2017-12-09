//
//  ATChatViewController.swift
//  ChatTeam
//
//  Created by yakang wang on 2017/11/18.
//  Copyright © 2017年 yakang wang. All rights reserved.
//

import UIKit

class ATChatViewController: UIViewController {

    fileprivate let continerView: UIView
    fileprivate let chatTableController: ATChatTableController
    fileprivate let chatInputController: ATChatInputController
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.continerView = UIView(frame: UIScreen.main.bounds)
        self.chatTableController = ATChatTableController()
        self.chatInputController = ATChatInputController()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func loadView() {
        self.view = continerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewController(chatTableController)
        addChildViewController(chatInputController)
        view.addSubview(chatTableController.view)
        view.addSubview(chatInputController.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
