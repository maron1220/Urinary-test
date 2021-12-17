//
//  PDFCreator.swift
//  Urinary-test
//
//  Created by 細川聖矢 on 2021/12/09.
//

import UIKit
import PDFKit
import SwiftUI

class PDFCreator: NSObject {
    @EnvironmentObject private var contentViewModel:ContentViewModel
   
    private var pageReact:CGRect
    private var renderer:UIGraphicsPDFRenderer?
    
    init(pageRect:CGRect = CGRect(x:0,y:0,width:(8.5*72.0),height:(11*72.0))) {
        //width:(8.5*72.0),height:(11*72.0)はA4ペーパーサイズ
         
        let format = UIGraphicsPDFRendererFormat()
        let metData = [kCGPDFContextTitle:"It's a PDF!",kCGPDFContextAuthor:"Tapimari"]
        
        format.documentInfo = metData as [String:Any]
        self.pageReact = pageRect
        self.renderer = UIGraphicsPDFRenderer(bounds:self.pageReact,format: format)
        
        super.init()
    }
    
}



extension PDFCreator{
    
    private func addUsgValue(usgvalue : String){
        
        var usgcolor = UIColor.black
        
        var doubleusg:Double
        if let convertusg = Double(usgvalue){
            doubleusg = Double(usgvalue)!
        }else{
            doubleusg = 0.0
        }
        
        switch doubleusg {
        case 0..<1.007 :
            usgcolor = UIColor.blue
        case 1.007...1.012 :
            usgcolor = UIColor.cyan
        case let d where d>1.012 && d<=1.030 :
            usgcolor = UIColor.gray
        default:
            usgcolor = UIColor.black
        }

        let usgRect = CGRect(x: 20, y: 0, width: pageReact.width - 40, height: 40)
        var usgattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:usgcolor
        ]
        usgvalue.draw(in:usgRect,withAttributes:usgattributes)
    }//private func addUsgData
    
    private func addTitle(title : String){
        let textRect = CGRect(x:20,y:50,width: pageReact.width - 40 ,height: 40)
        
        let attributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.red
        ]
        
        title.draw(in:textRect,withAttributes:attributes)
    }//addTitle
    
    private func addBody(body:String){
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .justified
        
        let attributes = [
            NSAttributedString.Key.font:UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.paragraphStyle:paragraphStyle,
            NSAttributedString.Key.foregroundColor:UIColor.gray
        ]//attributes
        
        let bodyRect = CGRect(x: 20, y: 100, width: pageReact.width - 40, height: pageReact.height - 80)
        body.draw(in:bodyRect,withAttributes:attributes)
    }//addBody
}//extension PDFCreator

extension PDFCreator{
    func pdfData(title:String,body:String,usgvalue:String) -> Data?{
        if let renderer = self.renderer{
            let data = renderer.pdfData{ ctx in
                ctx.beginPage()
                addUsgValue(usgvalue: usgvalue)
                addTitle(title: title)
                addBody(body: body)
            }
            return data
        }//if let renderer
        return nil
    }//func pdfData
}//extension PDFCreator
