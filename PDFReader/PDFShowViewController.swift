//
//  PDFShowViewController.swift
//  PDFReader
//
//  Created by TMS on 2017/05/31.
//  Copyright © 2017年 TMS. All rights reserved.
//

import UIKit

class PDFShowViewController: UIViewController {
    var pages = 1
    var nowPage = 1
    var pdfView = PDFView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let pdfName = ConstStruct.pdf_file_name

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = Bundle.main.bundleURL.appendingPathComponent(pdfName)
        let doc = CGPDFDocument(url as CFURL)
        
        pages = doc!.numberOfPages
        
        let page = doc!.page(at: nowPage)
        let myBoundSize: CGSize = UIScreen.main.bounds.size
        pdfView = PDFView(frame: CGRect(x: 0, y: 0, width: myBoundSize.width, height: myBoundSize.height))
        
        pdfView.backgroundColor = UIColor.white
        pdfView.page = page
        self.view.addSubview(pdfView)

    }
    //次ページへ
    @IBAction func downSwiped() {
        if nowPage < pages {
            nowPage = nowPage + 1
            let url = Bundle.main.bundleURL.appendingPathComponent(pdfName)
            let doc = CGPDFDocument(url as CFURL)
            let page = doc!.page(at: nowPage)
            pdfView.page = page
            for subview in self.view.subviews {
                subview.setNeedsDisplay()
            }
        }
    }
    //前ページへ
    @IBAction func upSwiped() {
        if nowPage > 1 {
            nowPage = nowPage - 1
            let url = Bundle.main.bundleURL.appendingPathComponent(pdfName)
            let doc = CGPDFDocument(url as CFURL)
            let page = doc!.page(at: nowPage)
            pdfView.page = page
            for subview in self.view.subviews {
                subview.setNeedsDisplay()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

