//
//  PdfViewUI.swift
//  Urinary-test
//
//  Created by 細川聖矢 on 2021/12/15.
//

import SwiftUI
import PDFKit
//PDFViewやPDFDocumentを使うのにPDFKitが必要

//PdfPreviewViewの子View
//PDFを表示するView

struct PdfViewUI: UIViewRepresentable {
    private var data:Data?
    
    private let autoScales:Bool
    
    init(data:Data?,autoScales:Bool = true){
        self.data = data
        self.autoScales = autoScales
    }//init()
    
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        
        pdfView.autoScales = self.autoScales
        
        if let data = self.data{
            pdfView.document = PDFDocument(data:data)
        }//if let data
        
        return pdfView
    }//func makeUIView
    
    func updateUIView(_ uiView: PDFView, context: Context) {
        //Empty
    }//func updateUIView
    //PDFViewに影響を与える変化があったときに呼ばれる
    
    //UIRepresentableを使用するにはmakeUIViewとupdateUIViewが必要
}//PdfViewUI

