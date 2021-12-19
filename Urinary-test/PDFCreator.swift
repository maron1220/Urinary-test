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
        var usgtitle = "USG :"
        
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

        let usgtitleRect = CGRect(x: 20, y: 10, width: 100, height: 40)
        let usgRect = CGRect(x: 150, y: 10, width: pageReact.width - 40, height: 40)
        var usgattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:usgcolor
        ]
        usgtitle.draw(in:usgtitleRect,withAttributes:usgattributes)
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
    }//addBilvalue
    
    private func addKetonValue(ketonvalue:String){
        let ketonvalueRect = CGRect(x:20,y:210,width:pageReact.width - 40,height: 40)
        
        let ketonvalueattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.red
        ]
        
        ketonvalue.draw(in:ketonvalueRect,withAttributes:ketonvalueattributes)
    }//addKetonvalue
    
    private func addGluValue(gluvalue:String){
        let gluvalueRect = CGRect(x:20,y:250,width:pageReact.width - 40,height: 40)
        
        let gluvalueattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.red
        ]
        
        gluvalue.draw(in:gluvalueRect,withAttributes:gluvalueattributes)
    }//addGluvalue
    
    private func addTpValue(tpvalue:String){
        let tpvalueRect = CGRect(x:20,y:290,width:pageReact.width - 40,height: 40)
        
        let tpvalueattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.red
        ]
        
        tpvalue.draw(in:tpvalueRect,withAttributes:tpvalueattributes)
    }//addTpvalue
    
    private func addPhValue(phvalue:String){
        let phvalueRect = CGRect(x:20,y:330,width:pageReact.width - 40,height: 40)
        
        let phvalueattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.red
        ]
        
        phvalue.draw(in:phvalueRect,withAttributes:phvalueattributes)
    }//addPhvalue
    
    private func addRbcValue(rbcvalue:String){
        let rbcvalueRect = CGRect(x:20,y:370,width:pageReact.width - 40,height: 40)
        
        let rbcvalueattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.red
        ]
        
        rbcvalue.draw(in:rbcvalueRect,withAttributes:rbcvalueattributes)
    }//addRbcvalue
    
    private func addWbcValue(wbcvalue:String){
        let wbcvalueRect = CGRect(x:20,y:410,width:pageReact.width - 40,height: 40)
        
        let wbcvalueattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.red
        ]
        
        wbcvalue.draw(in:wbcvalueRect,withAttributes:wbcvalueattributes)
    }//addWbcvalue
    
    private func addMicroValue(microvalue:String){
        let microvalueRect = CGRect(x:20,y:450,width:pageReact.width - 40,height: 40)
        
        let microvalueattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.red
        ]
        
        microvalue.draw(in:microvalueRect,withAttributes:microvalueattributes)
    }//addMicrovalue
    
    private func addMicroDetail(microdetail:String){
        let microdetailRect = CGRect(x:20,y:490,width:pageReact.width - 40,height: 40)
        
        let microdetailattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.red
        ]
        
        microdetail.draw(in:microdetailRect,withAttributes:microdetailattributes)
    }//addMicrodetail
    
    private func addMicroComment(microcomment:String){
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .justified
        
        let attributes = [
            NSAttributedString.Key.font:UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.paragraphStyle:paragraphStyle,
            NSAttributedString.Key.foregroundColor:UIColor.gray
        ]//attributes
        
        let microcommentRect = CGRect(x: 20, y: 530, width: pageReact.width - 40, height: 60)
        microcomment.draw(in:microcommentRect,withAttributes:attributes)
    }//addMicroComment
    
    private func addCrystalValue(crystalvalue:String){
        let crystalvalueRect = CGRect(x:20,y:590,width:pageReact.width - 40,height: 40)
        
        let crystalvalueattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.red
        ]
        
        crystalvalue.draw(in:crystalvalueRect,withAttributes:crystalvalueattributes)
    }//addCrystalvalue
    
    private func addCrystalDetail(crystaldetail:String){
        let crystaldetailRect = CGRect(x:20,y:630,width:pageReact.width - 40,height: 40)
        
        let crystaldetailattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.red
        ]
        
        crystaldetail.draw(in:crystaldetailRect,withAttributes:crystaldetailattributes)
    }//addCrystalDetail
    
    private func addCrystalComment(crystalcomment:String){
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .justified
        
        let attributes = [
            NSAttributedString.Key.font:UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.paragraphStyle:paragraphStyle,
            NSAttributedString.Key.foregroundColor:UIColor.gray
        ]//attributes
        
        let crystalcommentRect = CGRect(x: 20, y: 670, width: pageReact.width - 40, height: 60)
        crystalcomment.draw(in:crystalcommentRect,withAttributes:attributes)
    }//addCrystalComment
    
    private func addCastValue(castvalue:String){
        let castvalueRect = CGRect(x:20,y:730,width:pageReact.width - 40,height: 40)
        
        let castvalueattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.red
        ]
        
        castvalue.draw(in:castvalueRect,withAttributes:castvalueattributes)
    }//addCastValue
    
    private func addCastDetail(castdetail:String){
        let castdetailRect = CGRect(x:20,y:770,width:pageReact.width - 40,height: 40)
        
        let castdetailattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.red
        ]
        
        castdetail.draw(in:castdetailRect,withAttributes:castdetailattributes)
    }//addCastDetail
    
    private func addCastComment(castcomment:String){
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .justified
        
        let attributes = [
            NSAttributedString.Key.font:UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.paragraphStyle:paragraphStyle,
            NSAttributedString.Key.foregroundColor:UIColor.gray
        ]//attributes
        
        let castcommentRect = CGRect(x: 20, y: 810, width: pageReact.width - 40, height: 60)
        castcomment.draw(in:castcommentRect,withAttributes:attributes)
    }//addMicroComment
    
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
    func pdfData(title:String,body:String,usgvalue:String,urinecolor:String,urovalue:String,obvalue:String,bilvalue:String,ketonvalue:String,gluvalue:String,tpvalue:String,phvalue:String,rbcvalue:String,wbcvalue:String,microvalue:String,crystalvalue:String,castvalue:String,microdetail:String,crystaldetail:String,castdetail:String,microcomment:String,crystalcomment:String,castcommit:String) -> Data?{
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
                addRbcValue(rbcvalue: rbcvalue)
                addWbcValue(wbcvalue: wbcvalue)
                //addMicroValue(microvalue: microvalue)
                //addCrystalValue(crystalvalue: crystalvalue)
                //addCastValue(castvalue: castvalue)
                addMicroDetail(microdetail: microdetail)
                addCrystalDetail(crystaldetail: crystaldetail)
                addCastDetail(castdetail: castdetail)
                addMicroComment(microcomment: microcomment)
                addCrystalComment(crystalcomment: crystalcomment)
                addCastComment(castcomment: castcommit)
                addTitle(title: title)
                addBody(body: body)
            }
            return data
        }//if let renderer
        return nil
    }//func pdfData
}//extension PDFCreator
