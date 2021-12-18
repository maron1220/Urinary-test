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
    
    private func addUrineColor(urinecolor:String){
        let urinecolorRect = CGRect(x:20,y:50,width:pageReact.width - 40,height: 40)
        
        let urinecolorattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.red
        ]
        
        urinecolor.draw(in:urinecolorRect,withAttributes:urinecolorattributes)
    }//addUrineColor
    
    private func addUroValue(urovalue:String){
        let urovalueRect = CGRect(x:20,y:90,width:pageReact.width - 40,height: 40)
        
        let urovalueattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.red
        ]
        
        urovalue.draw(in:urovalueRect,withAttributes:urovalueattributes)
    }//addUrovalue
    
    private func addObValue(obvalue:String){
        let obvalueRect = CGRect(x:20,y:130,width:pageReact.width - 40,height: 40)
        
        let obvalueattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.red
        ]
        
        obvalue.draw(in:obvalueRect,withAttributes:obvalueattributes)
    }//addObvalue
    
    private func addBilValue(bilvalue:String){
        let bilvalueRect = CGRect(x:20,y:170,width:pageReact.width - 40,height: 40)
        
        let bilvalueattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.red
        ]
        
        bilvalue.draw(in:bilvalueRect,withAttributes:bilvalueattributes)
    }//addBilvalueColor
    
    private func addKetonValue(ketonvalue:String){
        let ketonvalueRect = CGRect(x:20,y:210,width:pageReact.width - 40,height: 40)
        
        let ketonvalueattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.red
        ]
        
        ketonvalue.draw(in:ketonvalueRect,withAttributes:ketonvalueattributes)
    }//addKetonvalueColor
    
    private func addGluValue(gluvalue:String){
        let gluvalueRect = CGRect(x:20,y:250,width:pageReact.width - 40,height: 40)
        
        let gluvalueattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.red
        ]
        
        gluvalue.draw(in:gluvalueRect,withAttributes:gluvalueattributes)
    }//addGluvalueColor
    
    private func addTpValue(tpvalue:String){
        let tpvalueRect = CGRect(x:20,y:290,width:pageReact.width - 40,height: 40)
        
        let tpvalueattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.red
        ]
        
        tpvalue.draw(in:tpvalueRect,withAttributes:tpvalueattributes)
    }//addUrovalueColor
    
    private func addPhValue(phvalue:String){
        let phvalueRect = CGRect(x:20,y:330,width:pageReact.width - 40,height: 40)
        
        let phvalueattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.red
        ]
        
        phvalue.draw(in:phvalueRect,withAttributes:phvalueattributes)
    }//addUrovalueColor
    
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
    func pdfData(title:String,body:String,usgvalue:String,urinecolor:String,urovalue:String,obvalue:String,bilvalue:String,ketonvalue:String,gluvalue:String,tpvalue:String,phvalue:String) -> Data?{
        if let renderer = self.renderer{
            let data = renderer.pdfData{ ctx in
                ctx.beginPage()
                addUsgValue(usgvalue: usgvalue)
                addUrineColor(urinecolor: urinecolor)
                addUroValue(urovalue: urovalue)
                addObValue(obvalue: obvalue)
                addBilValue(bilvalue: bilvalue)
                addKetonValue(ketonvalue: ketonvalue)
                addGluValue(gluvalue: gluvalue)
                addTpValue(tpvalue: tpvalue)
                addPhValue(phvalue: phvalue)
                addTitle(title: title)
                addBody(body: body)
            }
            return data
        }//if let renderer
        return nil
    }//func pdfData
}//extension PDFCreator
