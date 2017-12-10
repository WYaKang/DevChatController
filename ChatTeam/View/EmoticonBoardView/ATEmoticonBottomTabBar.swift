//
//  ATEmoticonBottomTabBar.swift
//  ChatTeam
//
//  Created by yakang wang on 2017/12/9.
//  Copyright © 2017年 yakang wang. All rights reserved.
//


/// 右下角按钮的状态
///
/// - setting: 设置图案
/// - sendDisable: 发送不可用
/// - sendActive: 发送可用
enum ATEmoticonType {
    case setting
    case sendDisable
    case sendActive
}

import UIKit

class ATEmoticonBottomTabBar: UIView {

    fileprivate let kItemWidth: CGFloat = 45.0
    fileprivate let kItemHeight: CGFloat = 44.0
    fileprivate let kCellIdentifer = "ATEmoticonBottomCell_Identifier"
    
    let continerCollView: UICollectionView
    let flowLayout = UICollectionViewFlowLayout()
    fileprivate let emoticonAddItem: ATEmoticonTabItemView
    fileprivate let emoticonSentOrSetingItem: ATEmoticonTabItemView
    fileprivate let shadowImageView: UIImageView
    fileprivate let sendActiveView: UIView
    fileprivate let sendActiveButton: UIButton
    
//    fileprivate var currentEmoticonView: UIView = UIView()
    fileprivate var currentItemStatus: ATEmoticonType = .sendDisable
    
    let emoticonicons = [
        "wx_emoticon_QQ_btn",
        "wx_emoticon_love",
        "wx_emoticon_custom1",
        "wx_emoticon_custom2",
        "wx_emoticon_custom3",
        "wx_emoticon_custom4",
        "wx_emoticon_custom5",
        "wx_emoticon_custom5",
        "wx_emoticon_custom5",
        "wx_emoticon_custom5",
    ]
    
    override init(frame: CGRect) {
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.itemSize = CGSize(width: kItemWidth, height: kItemHeight)
        self.continerCollView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        self.emoticonAddItem = ATEmoticonTabItemView()
        self.emoticonSentOrSetingItem = ATEmoticonTabItemView()
        self.shadowImageView = UIImageView()
        self.sendActiveView = UIView()
        self.sendActiveButton = UIButton(type: .custom)
        super.init(frame: frame)

        addSubview(continerCollView)
        addSubview(emoticonAddItem)
        addSubview(emoticonSentOrSetingItem)
        emoticonSentOrSetingItem.insertSubview(shadowImageView, at: 0)
        addSubview(sendActiveView)
        sendActiveView.addSubview(sendActiveButton)
        sendActiveView.backgroundColor = UIColor.orange
        
//        currentEmoticonView = emoticonSentOrSetingItem
        
        do {
            continerCollView.backgroundColor = .white
            continerCollView.register(ATEmoticonBottomCell.self, forCellWithReuseIdentifier: kCellIdentifer)
            continerCollView.alwaysBounceHorizontal = true
            continerCollView.showsVerticalScrollIndicator = false
            continerCollView.showsHorizontalScrollIndicator = false
            continerCollView.delegate = self
            continerCollView.dataSource = self
            continerCollView.contentInset = UIEdgeInsets(top: 0, left: kItemWidth, bottom: 0, right: kItemWidth + 10 + kItemWidth)
        }
        
        do {
            emoticonAddItem.imageView.image = UIImage(named: "wx_emoticon_add_btn")
            emoticonAddItem.backgroundColor = .white
        }
        
        do {
            
            emoticonSentOrSetingItem.imageView.image = UIImage(named: "wx_emoticon_send_btn")
            emoticonSentOrSetingItem.backgroundColor = .white
            
//            shadowImageView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            shadowImageView.layer.shadowOpacity = 0.5
            shadowImageView.layer.shadowColor = UIColor.gray.cgColor
            shadowImageView.layer.shadowOffset = CGSize(width: -10, height: 0)
            shadowImageView.layer.shadowRadius = 5
            
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /// 切换按钮状态 发送还是设置
    func rightItemTo(status: ATEmoticonType) {
        switch status {
        case .setting:
            switch currentItemStatus {
            case .sendActive:
                UIView.animate(withDuration: 0.25, animations: {
                    self.sendActiveView.frame.origin.x = kScreenW
                }, completion: { (finish) in
                    UIView.animate(withDuration: 0.25, animations: {
                        self.emoticonSentOrSetingItem.imageView.image = UIImage(named: "wx_emoticon_custom6")
                        self.emoticonSentOrSetingItem.frame.origin.x = kScreenW - self.kItemWidth
                    }, completion: { (finish) in
                    })
                })
            case .sendDisable:
                UIView.animate(withDuration: 0.25, animations: {
                    self.emoticonSentOrSetingItem.frame.origin.x = kScreenW
                }, completion: { (finish) in
                    UIView.animate(withDuration: 0.25, animations: {
                        self.emoticonSentOrSetingItem.imageView.image = UIImage(named: "wx_emoticon_custom6")
                        self.emoticonSentOrSetingItem.frame.origin.x = kScreenW - self.kItemWidth
                    }, completion: { (finish) in
                    })
                })
            case .setting:
                return
            }
            currentItemStatus = .setting
        case .sendDisable:
            switch currentItemStatus {
            case .sendActive:
                UIView.animate(withDuration: 0.25, animations: {
                    self.sendActiveView.frame.origin.x = kScreenW
                }, completion: { (finish) in
                    UIView.animate(withDuration: 0.25, animations: {
                        self.emoticonSentOrSetingItem.imageView.image = UIImage(named: "wx_emoticon_send_btn")
                        self.emoticonSentOrSetingItem.frame.origin.x = kScreenW - self.kItemWidth
                    }, completion: { (finish) in
                    })
                })
            case .sendDisable:
                return
            case .setting:
                UIView.animate(withDuration: 0.25, animations: {
                    self.emoticonSentOrSetingItem.frame.origin.x = kScreenW
                }, completion: { (finish) in
                    UIView.animate(withDuration: 0.25, animations: {
                        self.emoticonSentOrSetingItem.imageView.image = UIImage(named: "wx_emoticon_send_btn")
                        self.emoticonSentOrSetingItem.frame.origin.x = kScreenW - self.kItemWidth
                    }, completion: { (finish) in
                    })
                })
            }
            currentItemStatus = .sendDisable
        case .sendActive:
            switch currentItemStatus {
            case .sendActive:
                return
            case .sendDisable:
                UIView.animate(withDuration: 0.25, animations: {
                    self.emoticonSentOrSetingItem.frame.origin.x = kScreenW
                }, completion: { (finish) in
                    UIView.animate(withDuration: 0.25, animations: {
                        self.sendActiveView.frame.origin.x = kScreenW - self.kItemWidth
                    }, completion: { (finish) in
                    })
                })
            case .setting:
                UIView.animate(withDuration: 0.25, animations: {
                    self.emoticonSentOrSetingItem.frame.origin.x = kScreenW
                }, completion: { (finish) in
                    UIView.animate(withDuration: 0.25, animations: {
                        self.sendActiveView.frame.origin.x = kScreenW - self.kItemWidth
                    }, completion: { (finish) in
                    })
                })
            }
            currentItemStatus = .sendActive
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        continerCollView.frame = bounds
        emoticonAddItem.frame = CGRect(x: 0, y: 0, width: kItemWidth, height: kItemHeight)
        
        emoticonSentOrSetingItem.frame = CGRect(x: bounds.width - kItemWidth, y: 0, width: kItemWidth, height: kItemHeight)
        
        shadowImageView.frame = CGRect(x: -10, y: 0, width: kItemWidth + 10, height: kItemHeight)
        sendActiveView.frame = CGRect(x: kScreenW, y: 0, width: 60, height: 44)
        sendActiveButton.frame = sendActiveView.bounds
    }
}

extension ATEmoticonBottomTabBar: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("collectionView \(collectionView) indexPath\(indexPath)")
        if indexPath.row == 0 {
            rightItemTo(status: .sendDisable)
        } else {
            rightItemTo(status: .setting)
        }
    }
}

extension ATEmoticonBottomTabBar: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emoticonicons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellIdentifer, for: indexPath) as! ATEmoticonBottomCell
        cell.emoticonItemView.imageView.image = UIImage(named: emoticonicons[indexPath.row])
        cell.backgroundColor = UIColor.white
        
        return cell
    }
    
}
