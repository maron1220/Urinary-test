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
    
    private var rectwidth:Double
    
    private var a4width = 8.5*72.0
    private var a4height = 11*72.0
    
   
    
    init(pageRect:CGRect = CGRect(x:0,y:0,width:(8.5*72.0),height:(11*72.0))) {
        //width:(8.5*72.0),height:(11*72.0)はA4ペーパーサイズ
         
        let format = UIGraphicsPDFRendererFormat()
        let metData = [kCGPDFContextTitle:"It's a PDF!",kCGPDFContextAuthor:"Tapimari"]
        
        format.documentInfo = metData as [String:Any]
        self.pageReact = pageRect
        self.renderer = UIGraphicsPDFRenderer(bounds:self.pageReact,format: format)
        
        self.rectwidth = a4width/4
        
        super.init()
    }
    
    
}



extension PDFCreator{
    
    private func addTitleText(title:String){
        let titlecolorRect = CGRect(x:a4width/2*0.8,y:5,width:pageReact.width - 40,height:a4height/21*2)
        
        let titlecolorattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 50),
            NSAttributedString.Key.foregroundColor:UIColor.black
        ]
        
        title.draw(in:titlecolorRect,withAttributes:titlecolorattributes)
    }//addTitleText
    
    
    private func addUsgValue(usgvalue : String){
        
        var usgcolor = UIColor.black
        var usgTitle = "尿比重"
        
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

        let usgtitleRect = CGRect(x:a4width/32, y: a4height/21*2, width:rectwidth, height:a4height/21)
        let usgTitleattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.black
        ]
        
        let usgRect = CGRect(x:a4width/2*1.1 , y: a4height/21*2, width: pageReact.width - 40, height:a4height/21)
        var usgattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:usgcolor
        ]
        
        usgTitle.draw(in:usgtitleRect,withAttributes:usgTitleattributes)
        usgvalue.draw(in:usgRect,withAttributes:usgattributes)
    }//private func addUsgData
    
   
    private func addUrineColor(urinecolor:String){
        
        let urineColorTitle = "色"
        
        var urineColorFont:UIColor = UIColor.black
        
        if urinecolor != "無色"{
            urineColorFont = UIColor.red
        }
        
        let urinecolorTitleRect = CGRect(x:a4width/32,y:a4height/21*3,width:rectwidth,height:a4height/21)
        
        let urinecoloTitlerattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.black
        ]
        
        let urinecolorRect = CGRect(x:a4width/2*1.05,y:a4height/21*3,width:pageReact.width - 40,height:a4height/21)
        
        let urinecolorattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:urineColorFont
        ]
        
        urineColorTitle.draw(in:urinecolorTitleRect,withAttributes:urinecoloTitlerattributes)
        urinecolor.draw(in:urinecolorRect,withAttributes:urinecolorattributes)
    }//addUrineColor
    
    private func addUroValue(urovalue:String){
        
        let uroTitle = "ウロビリノーゲン"
        
        var uroColor:UIColor = UIColor.black
        
        if urovalue != "-"{
            uroColor = UIColor.red
        }
        
        let uroTitleRect = CGRect(x:a4width/64,y:a4height/21*4+3,width:a4width/3,height:a4height/21)
        
        let uroTitlerattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 25),
            NSAttributedString.Key.foregroundColor:UIColor.black
        ]
        
        let urovalueRect = CGRect(x:a4width/2*1.1,y:a4height/21*4,width:pageReact.width - 40,height:a4height/21)
        
        let urovalueattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:uroColor
        ]
        
        uroTitle.draw(in:uroTitleRect,withAttributes:uroTitlerattributes)
        urovalue.draw(in:urovalueRect,withAttributes:urovalueattributes)
    }//addUrovalue
    
    private func addObValue(obvalue:String){
        
        let obTitle = "潜血"
        
        var obColor:UIColor = UIColor.black
        
        if obvalue != "-"{
            obColor = UIColor.red
        }
        
        let obTitleRect = CGRect(x:a4width/32,y:a4height/21*5,width:rectwidth,height:a4height/21)
        
        let obTitlerattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.black
        ]
        
        let obvalueRect = CGRect(x:a4width/2*1.1,y:a4height/21*5,width:pageReact.width - 40,height:a4height/21)
        
        let obvalueattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:obColor
        ]
        
        obTitle.draw(in:obTitleRect,withAttributes:obTitlerattributes)
        obvalue.draw(in:obvalueRect,withAttributes:obvalueattributes)
    }//addObvalue
    
    private func addBilValue(bilvalue:String){
        
        let bilTitle = "ビリルビン"
        
        var bilColor:UIColor = UIColor.black
        
        if bilvalue != "-"{
            bilColor = UIColor.red
        }
        
        let bilTitleRect = CGRect(x:a4width/32,y:a4height/21*6,width:a4width/3,height:a4height/21)
        
        let bilTitlerattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.black
        ]
        
        let bilvalueRect = CGRect(x:a4width/2*1.1,y:a4height/21*6,width:pageReact.width - 40,height:a4height/21)
        
        let bilvalueattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:bilColor
        ]
        
        bilTitle.draw(in:bilTitleRect,withAttributes:bilTitlerattributes)
        bilvalue.draw(in:bilvalueRect,withAttributes:bilvalueattributes)
    }//addBilvalue
    
    private func addKetonValue(ketonvalue:String){
        
        let ketonTitle = "ケトン"
        
        var ketonColor:UIColor = UIColor.black
       
        if ketonvalue != "-"{
            ketonColor = UIColor.red
        }
        
        let ketonTitleRect = CGRect(x:a4width/32,y:a4height/21*7,width:rectwidth,height:a4height/21)
        
        let ketonTitlerattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.black
        ]
        
        let ketonvalueRect = CGRect(x:a4width/2*1.1,y:a4height/21*7,width:pageReact.width - 40,height:a4height/21)
        
        let ketonvalueattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:ketonColor
        ]
        
        ketonTitle.draw(in:ketonTitleRect,withAttributes:ketonTitlerattributes)
        ketonvalue.draw(in:ketonvalueRect,withAttributes:ketonvalueattributes)
    }//addKetonvalue
    
    private func addGluValue(gluvalue:String){
        
        let gluTitle = "グルコース"
        
        var gluColor:UIColor = UIColor.black
        
        if gluvalue != "-"{
            gluColor = UIColor.red
        }
        
        let gluTitleRect = CGRect(x:a4width/32,y:a4height/21*8,width:a4width/3,height:a4height/21)
        
        let gluTitlerattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.black
        ]
        
        let gluvalueRect = CGRect(x:a4width/2*1.1,y:a4height/21*8,width:pageReact.width - 40,height:a4height/21)
        
        let gluvalueattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:gluColor
        ]
        
        gluTitle.draw(in:gluTitleRect,withAttributes:gluTitlerattributes)
        gluvalue.draw(in:gluvalueRect,withAttributes:gluvalueattributes)
    }//addGluvalue
    
    private func addTpValue(tpvalue:String){
        
        let tpTitle = "タンパク"
        
        var tpColor = UIColor.black
        
        if tpvalue != "-"{
            tpColor = UIColor.red
        }
        
        let tpTitleRect = CGRect(x:a4width/32,y:a4height/21*9,width:rectwidth,height:a4height/21)
        
        let tpTitlerattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.black
        ]
        
        let tpvalueRect = CGRect(x:a4width/2*1.1,y:a4height/21*9,width:pageReact.width - 40,height:a4height/21)
        
        let tpvalueattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:tpColor
        ]
        
        tpTitle.draw(in:tpTitleRect,withAttributes:tpTitlerattributes)
        tpvalue.draw(in:tpvalueRect,withAttributes:tpvalueattributes)
    }//addTpvalue
    
    private func addPhValue(phvalue:String){
        
        let phTitle = "pH"
        
        var phDouble:Double = Double(phvalue) ?? 0
        
        var phColor:UIColor = UIColor.black
        
        if phDouble < 6.0{
            phColor = UIColor.blue
        }else if phDouble > 7.5{
            phColor = UIColor.red
        }else{
            phColor = UIColor.black
        }
        
        let phTitleRect = CGRect(x:a4width/32,y:a4height/21*10,width:rectwidth,height:a4height/21)
        
        let phTitlerattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.black
        ]
        
        let phvalueRect = CGRect(x:a4width/2*1.05,y:a4height/21*10,width:pageReact.width - 40,height:a4height/21)
        
        let phvalueattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:phColor
        ]
        
        phTitle.draw(in:phTitleRect,withAttributes:phTitlerattributes)
        phvalue.draw(in:phvalueRect,withAttributes:phvalueattributes)
    }//addPhvalue
    
    private func addRbcValue(rbcvalue:String){
        
        let rbcTitle = "赤血球"
        
        var rbcColor:UIColor = UIColor.black
        
        if rbcvalue != "-"{
            rbcColor = UIColor.red
        }
        
        let rbcTitleRect = CGRect(x:a4width/32,y:a4height/21*11,width:rectwidth,height:a4height/21)
        
        let rbcTitlerattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.black
        ]
        
        let rbcvalueRect = CGRect(x:a4width/2*1.1,y:a4height/21*11,width:pageReact.width - 40,height: a4height/21)
        
        let rbcvalueattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:rbcColor
        ]
        
        rbcTitle.draw(in:rbcTitleRect,withAttributes:rbcTitlerattributes)
        rbcvalue.draw(in:rbcvalueRect,withAttributes:rbcvalueattributes)
    }//addRbcvalue
    
    private func addWbcValue(wbcvalue:String){
        
        let wbcTitle = "白血球"
        
        var wbcColor:UIColor = UIColor.black
        
        if wbcvalue != "-"{
            wbcColor = UIColor.red
        }
        
        let wbcTitleRect = CGRect(x:a4width/32,y:a4height/21*12,width:rectwidth,height:a4height/21)
        
        let wbcTitlerattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.black
        ]
        
        let wbcvalueRect = CGRect(x:a4width/2*1.1,y:a4height/21*12,width:pageReact.width - 40,height: a4height/21)
        
        let wbcvalueattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:wbcColor
        ]
        
        wbcTitle.draw(in:wbcTitleRect,withAttributes:wbcTitlerattributes)
        wbcvalue.draw(in:wbcvalueRect,withAttributes:wbcvalueattributes)
    }//addWbcvalue
    
//    private func addMicroValue(microvalue:String){
//        let microvalueRect = CGRect(x:20,y:a4height/21*11,width:pageReact.width - 40,height: 40)
//
//        let microvalueattributes = [
//            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
//            NSAttributedString.Key.foregroundColor:UIColor.red
//        ]
//
//        microvalue.draw(in:microvalueRect,withAttributes:microvalueattributes)
//    }//addMicrovalue
    
    private func addMicroDetail(microdetail:String){
        
        let microTitle = "細菌"
        
        var microColor:UIColor = UIColor.black
        
        if microdetail != "なし"{
            microColor = UIColor.red
        }
        
        let microTitleRect = CGRect(x:a4width/32,y:a4height/21*13,width:rectwidth,height:a4height/21)
        
        let microTitlerattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.black
        ]
        
        let microdetailRect = CGRect(x:a4width/2*1.05,y:a4height/21*13,width:pageReact.width - 40,height: a4height/21)
        
        let microdetailattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:microColor
        ]
        
        microTitle.draw(in:microTitleRect,withAttributes:microTitlerattributes)
        microdetail.draw(in:microdetailRect,withAttributes:microdetailattributes)
    }//addMicrodetail
    
    private func addMicroComment(microcomment:String){
        
        let commentTitle = "コメント"
        
        let commentTitleRect = CGRect(x:a4width/32,y:a4height/21*14,width:a4width/3,height:a4height/21)
        
        let commentTitleattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 25),
            NSAttributedString.Key.foregroundColor:UIColor.black
        ]
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .justified
        
        let attributes = [
            NSAttributedString.Key.font:UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.paragraphStyle:paragraphStyle,
            NSAttributedString.Key.foregroundColor:UIColor.gray
        ]//attributes
        
        let microcommentRect = CGRect(x:a4width/3*1.1, y: a4height/21*14, width: a4width/3*1.8, height:a4height/21*1.5)
        
        commentTitle.draw(in:commentTitleRect,withAttributes:commentTitleattributes)
        microcomment.draw(in:microcommentRect,withAttributes:attributes)
    }//addMicroComment
    
//    private func addCrystalValue(crystalvalue:String){
//        let crystalvalueRect = CGRect(x:20,y:a4height/21*15,width:pageReact.width - 40,height: 40)
//
//        let crystalvalueattributes = [
//            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
//            NSAttributedString.Key.foregroundColor:UIColor.red
//        ]
//
//        crystalvalue.draw(in:crystalvalueRect,withAttributes:crystalvalueattributes)
//    }//addCrystalvalue
    
    private func addCrystalDetail(crystaldetail:String){
        
        let crystalTitle = "結晶"
        
        var crystalColor:UIColor = UIColor.black
        
        if crystaldetail != "なし"{
            crystalColor = UIColor.red
        }
        
        let crystalTitleRect = CGRect(x:a4width/32,y:a4height/21*15.5,width:rectwidth,height:a4height/21)
        
        let crystalTitlerattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.black
        ]
        
        let crystaldetailRect = CGRect(x:a4width/2*1.05,y:a4height/21*15.5,width:pageReact.width - 40,height:a4height/21)
        
        let crystaldetailattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:crystalColor
        ]
        
        crystalTitle.draw(in:crystalTitleRect,withAttributes:crystalTitlerattributes)
        crystaldetail.draw(in:crystaldetailRect,withAttributes:crystaldetailattributes)
    }//addCrystalDetail
    
    private func addCrystalComment(crystalcomment:String){
        
        let commentTitle = "コメント"
        
        let commentTitleRect = CGRect(x:a4width/32,y:a4height/21*16.5,width:rectwidth,height:a4height/21)
        
        let commentTitleattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 25),
            NSAttributedString.Key.foregroundColor:UIColor.black
        ]
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .justified
        
        let attributes = [
            NSAttributedString.Key.font:UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.paragraphStyle:paragraphStyle,
            NSAttributedString.Key.foregroundColor:UIColor.gray
        ]//attributes
        
        let crystalcommentRect = CGRect(x:a4width/3*1.1, y: a4height/21*16.5, width: pageReact.width - 40, height:a4height/21*1.5)
        
        commentTitle.draw(in:commentTitleRect,withAttributes:commentTitleattributes)
        crystalcomment.draw(in:crystalcommentRect,withAttributes:attributes)
    }//addCrystalComment
    
//    private func addCastValue(castvalue:String){
//        let castvalueRect = CGRect(x:20,y:a4height/21*19,width:pageReact.width - 40,height: 40)
//
//        let castvalueattributes = [
//            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
//            NSAttributedString.Key.foregroundColor:UIColor.red
//        ]
//
//        castvalue.draw(in:castvalueRect,withAttributes:castvalueattributes)
//    }//addCastValue
    
    private func addCastDetail(castdetail:String){
        
        let castTitle = "尿道円柱"
        
        var castColor:UIColor = UIColor.black
        
        if castdetail != "なし"{
            castColor = UIColor.red
        }
        
        let castTitleRect = CGRect(x:a4width/32,y:a4height/21*18,width:rectwidth,height:a4height/21)
        
        let castTitlerattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:UIColor.black
        ]
        
        let castdetailRect = CGRect(x:a4width/2*1.05,y:a4height/21*18,width:pageReact.width - 40,height: a4height/21)
        
        let castdetailattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor:castColor
        ]
        
        castTitle.draw(in:castTitleRect,withAttributes:castTitlerattributes)
        castdetail.draw(in:castdetailRect,withAttributes:castdetailattributes)
    }//addCastDetail
    
    private func addCastComment(castcomment:String){
        
        let commentTitle = "コメント"
        
        let commentTitleRect = CGRect(x:a4width/32,y:a4height/21*19,width:rectwidth,height:a4height/21)
        
        let commentTitleattributes = [
            NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 25),
            NSAttributedString.Key.foregroundColor:UIColor.black
        ]
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .justified
        
        let attributes = [
            NSAttributedString.Key.font:UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.paragraphStyle:paragraphStyle,
            NSAttributedString.Key.foregroundColor:UIColor.gray
        ]//attributes
        
        let castcommentRect = CGRect(x:a4width/3*1.1, y: a4height/21*19, width: pageReact.width - 40, height:a4height/21*1.5)
        
        commentTitle.draw(in:commentTitleRect,withAttributes:commentTitleattributes)
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
    
    private func draw(_ rect:CGRect){
        let path = UIBezierPath()
        path.move(to:CGPoint(x:0,y:0))
        path.addLine(to: CGPoint(x:8.5*72.0,y:0))
        path.addLine(to: CGPoint(x:8.5*72.0,y:11*72.0))
        path.addLine(to: CGPoint(x:0,y:11*72.0))
        path.addLine(to: CGPoint(x:0,y:0))
        path.lineWidth = 10
        UIColor.black.setStroke()
        path.stroke()
    }
    
    private func partitionLine(_ rect:CGRect){
        let partitionpath = UIBezierPath()
        for i in 2 ... 13{
            partitionpath.move(to: CGPoint(x:0, y:a4height/21*Double(i)))
            partitionpath.addLine(to: CGPoint(x:8.5*72.0,y:a4height/21*Double(i)))
            partitionpath.lineWidth = 2
            UIColor.black.setStroke()
            partitionpath.stroke()
        }
    }//prtitionLine
    
    private func secondpartitionLine(_ rect:CGRect){
        let partitionpath = UIBezierPath()
        for i in 0 ... 1{
            partitionpath.move(to: CGPoint(x:0, y:a4height/21*(15.5+2.5*Double(i))))
            partitionpath.addLine(to: CGPoint(x:8.5*72.0,y:a4height/21*(15.5+2.5*Double(i))))
            partitionpath.lineWidth = 2
            UIColor.black.setStroke()
            partitionpath.stroke()
        }
    }//secondprtitionLine
    
    private func thirdpartitionLine(_ rect:CGRect){
        let partitionpath = UIBezierPath()
        for i in 0 ... 2{
            partitionpath.move(to: CGPoint(x:0, y:a4height/21*(14+2.5*Double(i))))
            partitionpath.addLine(to: CGPoint(x:8.5*72.0,y:a4height/21*(14+2.5*Double(i))))
            partitionpath.lineWidth = 2
            UIColor.lightGray.setStroke()
            partitionpath.stroke()
        }
    }//thirdprtitionLine
    
    private func verticalLine(_ rect:CGRect){
        let path = UIBezierPath()
        path.move(to:CGPoint(x:a4width/3,y:a4height/21*2))
        path.addLine(to: CGPoint(x:a4width/3,y:a4height))
        path.lineWidth = 2
        UIColor.black.setStroke()
        path.stroke()
    }//verticalLine
    
    private func secondVerticalLine(_ rect:CGRect){
        let path = UIBezierPath()
        path.move(to:CGPoint(x:a4width*4/5,y:a4height/21*2))
        path.addLine(to: CGPoint(x:a4width*4/5,y:a4height/21*14))
        path.lineWidth = 2
        UIColor.black.setStroke()
        path.stroke()
    }//verticalLine
    
    private func thirdVerticalLine(_ rect:CGRect){
        let path = UIBezierPath()
        for i in 1 ... 2{
        path.move(to:CGPoint(x:a4width*4/5,y:a4height/21*(14+2.5*Double(i))-a4height/21))
        path.addLine(to: CGPoint(x:a4width*4/5,y:a4height/21*(14+2.5*Double(i))))
        path.lineWidth = 2
        UIColor.black.setStroke()
        path.stroke()
        }//for
    }//verticalLine
    
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
                
                addTitleText(title: "尿検査")
                
                partitionLine(CGRect(x:0, y:0, width:0, height:0))
                secondpartitionLine(CGRect(x:0, y:0, width: 0, height: 0))
                thirdpartitionLine(CGRect(x:0, y:0, width:0, height:0))
                verticalLine(CGRect(x:0, y:0, width:0, height:0))
                secondVerticalLine(CGRect(x:0, y:0, width:0, height:0))
                thirdVerticalLine(CGRect(x:0, y:0, width:0, height:0))
                draw(CGRect(x:0, y:0, width: 0, height:0))
            }
            return data
        }//if let renderer
        return nil
    }//func pdfData
}//extension PDFCreator
