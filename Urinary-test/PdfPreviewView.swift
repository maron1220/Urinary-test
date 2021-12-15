//
//  PdfPreviewView.swift
//  Urinary-test
//
//  Created by 細川聖矢 on 2021/12/15.
//

import Foundation
import SwiftUI
import PDFKit

struct PdfPreviewView:View{
    @EnvironmentObject private var contentViewModel:ContentViewModel
    
    @State private var showShareSheet:Bool = false
    
    var body:some View{
        VStack{
            PdfViewUI(data:contentViewModel.pdfData())
            shareButton()
            Spacer()
        }//VStack
        .navigationTitle(Text("Your PDF"))
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showShareSheet,content: {
            if let data = contentViewModel.pdfData(){
                //contentViewModelからデータをもらう
                ShareView(activityItems: [data])
            }
        })
    }//var body
    
}//PdfPreviewView

extension PdfPreviewView{
    private func shareButton() -> some View{
        Button(action:{
            self.showShareSheet.toggle()
        },label: {
            Text("Share")
                .padding(10)
                .frame(width:100)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
        }//label
        )//Button
    }//private func shareButton
}//extension PdfPreviewView