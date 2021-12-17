//
//  PDFCreator.swift
//  Urinary-test
//
//  Created by 細川聖矢 on 2021/12/09.
//

import UIKit
import PDFKit

class PDFCreator: NSObject {
    
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
        let usgRect = CGRect(x: 20, y: 0, width: pageReact.width - 40, height: 40)
        usgvalue.draw(in:usgRect,withAttributes:[NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30)])
    }//private func addUsgData
    
    private func addTitle(title : String){
        let textRect = CGRect(x:20,y:50,width: pageReact.width - 40 ,height: 40)
        title.draw(in:textRect,withAttributes:[NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30)])
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
