//
//  ATSelectAttachmentView.swift
//  ChatTeam
//
//  Created by yakang wang on 2017/12/7.
//  Copyright © 2017年 yakang wang. All rights reserved.
//

import UIKit

protocol ATSelectAttachmentViewDelegate: class {
    
    /// 点击了某一个按钮后调用
    func didTaped(attchmentView: ATSelectAttachmentView, button: ATAttachmentButton)
}


class ATSelectAttachmentView: UIView {

    weak var delegate: ATSelectAttachmentViewDelegate?
    
    fileprivate let kAttmentBtnW: CGFloat = 60
    fileprivate let kAttmentBtnH: CGFloat = 60
    fileprivate let kCols: Int = 4 // 列
    fileprivate let kRows: Int = 2 // 行
    
    fileprivate let separatLineView: UIView
    fileprivate let continerScrView: ATScrollView
    fileprivate let pageIndexControl: UIPageControl
    
    fileprivate var attachmentBtns: [ATAttachmentButton] = []
    
    var attachmentItem: [String] = [] {
        didSet {
            createAttButtons(attachmentItem)
            let pageCount = attachmentItem.count / (kCols * kRows) + min(attachmentItem.count % (kCols * kRows), 1)
            pageIndexControl.numberOfPages = pageCount
            pageIndexControl.currentPage = 0
            continerScrView.contentSize = CGSize(width: frame.width * CGFloat(pageCount), height: frame.height)
        }
    }
    
    override init(frame: CGRect) {
        self.separatLineView = UIView()
        self.continerScrView = ATScrollView()
        self.pageIndexControl = UIPageControl()
        super.init(frame: frame)
        
        self.addSubview(separatLineView)
        self.addSubview(continerScrView)
        self.addSubview(pageIndexControl)
        continerScrView.delegate = self
        continerScrView.isPagingEnabled = true
        continerScrView.showsVerticalScrollIndicator = false
        continerScrView.showsHorizontalScrollIndicator = false
        
        self.separatLineView.backgroundColor = .red
    }
    
    fileprivate func createAttButtons(_ dataArray: [String]) {
        subviews.filter{ $0.tag >= 18000 }.forEach { $0.removeFromSuperview() }
        
        for (index, item) in dataArray.enumerated() {
            let attBtn = ATAttachmentButton()
            attBtn.tag = 18000 + index
            attBtn.addTarget(self, action: #selector(didTapedAttchment(button:)), for: .touchUpInside)
            attBtn.setTitle(item, for: .normal)
            attBtn.backgroundColor = UIColor.brown
            attachmentBtns.append(attBtn)
            continerScrView.addSubview(attBtn)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    @objc func didTapedAttchment(button: ATAttachmentButton) {
        print("didTapedAttchment \(button.tag)")
        delegate?.didTaped(attchmentView: self, button: button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        separatLineView.frame = CGRect(x: 0, y: 0, width: kScreenW, height: kPixelOne)
        continerScrView.frame = bounds
        pageIndexControl.sizeToFit()
        pageIndexControl.center.x = center.x
        pageIndexControl.frame.origin.y = bounds.height - 20
        
        let WGAP: CGFloat = (kScreenW - CGFloat(kCols) * kAttmentBtnW) / CGFloat(kCols + 1)
        let HGAP: CGFloat = (frame.size.height - CGFloat(kRows) * kAttmentBtnH) / CGFloat(kRows + 1)
        for (index, btn) in attachmentBtns.enumerated() {
            
            let X: CGFloat = WGAP + CGFloat(index % kCols) * (kAttmentBtnW + WGAP) + (kScreenW * CGFloat(index / (kCols * kRows)))
            let Y: CGFloat = HGAP + CGFloat(index % (kCols * kRows) / kCols) * (kAttmentBtnH + HGAP)
            
            btn.frame = CGRect(x: X, y: Y, width: kAttmentBtnW, height: kAttmentBtnH)
        }
    }
}

extension ATSelectAttachmentView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        let page = offsetX / kScreenW
        let scrollerOffsetX = Int(offsetX) % Int(kScreenW)
        if scrollerOffsetX > Int(kScreenW / 2) {
            pageIndexControl.currentPage = Int(page) + 1
        } else {
            pageIndexControl.currentPage = Int(page)
        }
    }
}
