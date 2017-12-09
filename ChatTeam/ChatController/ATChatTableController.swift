//
//  ATChatTableController.swift
//  ChatTeam
//
//  Created by yakang wang on 2017/11/18.
//  Copyright © 2017年 yakang wang. All rights reserved.
//

import UIKit

class ATChatTableController: UIViewController {

    let tableView: UITableView
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ATChatTableController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deleteRows(at: [indexPath], with: .automatic)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ATChatTableController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "com.chat.table.controller.cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "com.chat.table.controller.cell")
        }
        cell?.textLabel?.text = "\(indexPath.section)\(indexPath.row)"
        return cell!
    }
}
