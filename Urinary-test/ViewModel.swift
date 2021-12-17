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
}//class ContentViewModel

extension ContentViewModel{
    func pdfData() -> Data?{
        return PDFCreator().pdfData(title: self.title, body: self.body,usgvalue:"USG:\(self.usgvalue)")
    }//func pdfData
    
    func clear(){
        self.title = ""
        self.body = ""
        self.usgvalue = ""
    }//func clear
    //Userがtitleもしくはbodyを空にしたい時に空を返すために作成。
    
}//extension ContentViewModel
