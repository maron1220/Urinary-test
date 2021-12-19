//
//  ViewModel.swift
//  Urinary-test
//
//  Created by 細川聖矢 on 2021/12/15.
//
//Viewの状態を反映する。Viewからのアクションを受け取りModelを更新する。SwiftUIのViewに使用される。

import Foundation

class ContentViewModel : ObservableObject{
    @Published private var content = Content()
    
    var title : String{
        get{content.title}
        set(newTitle){
            content.title = newTitle
        }//set newTitle
    }//var title
    
    var body : String{
        get{content.body}
        set(newbody){
            content.body = newbody
        }//set(newbody)
    }//var body
    
    var usgvalue :  String{
        get{content.usgvalue}
        set(newusgvalue){
            content.usgvalue = newusgvalue
        }//set(newusgvalue)
    }//var usgvalue
    
    var urinecolor : String{
        get{content.urinecolor}
        set(newurinecolor){
            content.urinecolor = newurinecolor
        }//set(newurinecolor)
    }//var urinecolor
    
    var urovalue : String{
        get{content.urovalue}
        set(newurovalue){
            content.urovalue = newurovalue
        }//set(newuro)
    }//var uro
    
    var obvalue : String{
        get{content.obvalue}
        set(newobvalue){
            content.obvalue = newobvalue
        }//set(newob)
    }//var uro
    
    var bilvalue : String{
        get{content.bilvalue}
        set(newbilvalue){
            content.bilvalue = newbilvalue
        }//set(newbil)
    }//var bil
    
    var ketonvalue : String{
        get{content.ketonvalue}
        set(newketonvalue){
            content.ketonvalue = newketonvalue
        }//set(newketon)
    }//var keton
    
    var gluvalue : String{
        get{content.gluvalue}
        set(newgluvalue){
            content.gluvalue = newgluvalue
        }//set(newglu)
    }//var glu
    
    var tpvalue : String{
        get{content.tpvalue}
        set(newtpvalue){
            content.tpvalue = newtpvalue
        }//set(newtp)
    }//var tp
    
    var phvalue : String{
        get{content.phvalue}
        set(newphvalue){
            content.phvalue = newphvalue
        }//set(newph)
    }//var ph
    
    var rbcvalue : String{
        get{content.rbcvalue}
        set(newrbcvalue){
            content.rbcvalue = newrbcvalue
        }//set(newrbc)
    }//var rbc
    
    var wbcvalue : String{
        get{content.wbcvalue}
        set(newwbcvalue){
            content.wbcvalue = newwbcvalue
        }//set(newwbc)
    }//var wbc
    
    var microvalue : String{
        get{content.microvalue}
        set(newmicrovalue){
            content.microvalue = newmicrovalue
        }//set(newmicro)
    }//var micro
    
    var crystalvalue : String{
        get{content.crystalvalue}
        set(newcrystalvalue){
            content.crystalvalue = newcrystalvalue
        }//set(newcrystal)
    }//var crystal
    
    var castvalue : String{
        get{content.castvalue}
        set(newcastvalue){
            content.castvalue = newcastvalue
        }//set(newcast)
    }//var cast
    
    var microdetail : String{
        get{content.microdetail}
        set(newmicrodetail){
            content.microdetail = newmicrodetail
        }//set(newmicro)
    }//var micro
    
    var crystaldetail : String{
        get{content.crystaldetail}
        set(newcrystaldetail){
            content.crystaldetail = newcrystaldetail
        }//set(newcrystal)
    }//var crystal
    
    var castdetail : String{
        get{content.castdetail}
        set(newcastdetail){
            content.castdetail = newcastdetail
        }//set(newcast)
    }//var cast
    
    var microcomment : String{
        get{content.microcomment}
        set(newmicrocomment){
            content.microcomment = newmicrocomment
        }//set(newmicrocomment)
    }//var microcomment
    
    var crystalcomment : String{
        get{content.crystalcomment}
        set(newcrystalcomment){
            content.crystalcomment = newcrystalcomment
        }//set(newcrystalcomment)
    }//var crystalcomment
    
    var castcomment : String{
        get{content.castcomment}
        set(newcastcomment){
            content.castcomment = newcastcomment
        }//set(newcastcomment)
    }//var castcomment
    
}//class ContentViewModel

extension ContentViewModel{
    func pdfData() -> Data?{
        return PDFCreator().pdfData(title: self.title, body: self.body,usgvalue:self.usgvalue,urinecolor:self.urinecolor,urovalue:self.urovalue,obvalue:self.obvalue,bilvalue:self.bilvalue,ketonvalue:self.ketonvalue,gluvalue:self.gluvalue,tpvalue:self.tpvalue,phvalue:self.phvalue,rbcvalue:self.rbcvalue,wbcvalue:self.wbcvalue,microvalue:self.microvalue,crystalvalue:self.crystalvalue,castvalue:self.castvalue,microdetail:self.microdetail,crystaldetail:self.crystaldetail,castdetail:self.castdetail,microcomment:self.microcomment,crystalcomment:self.crystalcomment,castcommit:self.castcomment)
    }//func pdfData
    
    func clear(){
        self.title = ""
        self.body = ""
        self.usgvalue = ""
        self.urinecolor = ""
        self.urovalue = ""
        self.obvalue = ""
        self.bilvalue = ""
        self.ketonvalue = ""
        self.gluvalue = ""
        self.tpvalue = ""
        self.phvalue = ""
        self.rbcvalue = ""
        self.wbcvalue = ""
        self.microvalue = ""
        self.crystalvalue = ""
        self.castvalue = ""
        self.microdetail = ""
        self.crystaldetail = ""
        self.castdetail = ""
        self.microcomment = ""
        self.crystalcomment = ""
        self.castcomment = ""
    }//func clear
    //Userがtitleもしくはbodyを空にしたい時に空を返すために作成。
    
}//extension ContentViewModel
