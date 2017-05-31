//
//  PDFView.swift
//  PDFReader
//
//  Created by TMS on 2017/05/31.
//  Copyright © 2017年 TMS. All rights reserved.
//

import UIKit
import CoreGraphics

class PDFView: UIView {
    var page: CGPDFPage?
    
    override func draw(_ rect: CGRect) {
        guard let page = page else { return }
        
        let context = UIGraphicsGetCurrentContext()
        
        context!.translateBy(x: 0, y: rect.size.height)
        context!.scaleBy(x: 1.0, y: -1.0)
        
        let box = page.getBoxRect(.artBox)
        
        let xScale = rect.size.width / box.size.width
        let yScale = rect.size.height / box.size.height
        let scale = min(xScale, yScale)
        
        let tx = (rect.size.width - box.size.width * scale) / 2
        let ty = (rect.size.height - box.size.height * scale) / 2
        print("\(tx) \(ty) \(scale)")
        context!.translateBy(x: 0, y: ty)
        
        context!.scaleBy(x: scale, y: scale)
        
        context!.drawPDFPage(page)
    }
}


//XCPlaygroundPage.currentPage.liveView = view
