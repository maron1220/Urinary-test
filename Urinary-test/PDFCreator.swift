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
