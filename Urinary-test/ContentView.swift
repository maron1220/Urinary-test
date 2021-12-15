//
//  ContentView.swift
//  Urinary-test
//
//  Created by 細川聖矢 on 2021/12/08.
//
//titleとbodyを入力する画面

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var contentViewModel:ContentViewModel
    //EnvironmentObject=複数のViewでObservableObjectを使う。
    
    var body: some View {
        NavigationView{
            VStack{
                form()
                buttons()
                Spacer()
            }//VStack
            .navigationTitle(Text("PDF Composer"))
        }//NavigationView
    }//var body
}//strunc ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView{
    private func form() -> some View{
        Form{
            TextField("Title",text: $contentViewModel.title)
            Text("Body").font(.headline)
            
            TextEditor(text: $contentViewModel.body)
                .frame( height:100)
            
            //TextFieldとTextEditerの内容をBinding($)でViewModelに渡す。
        }//Form
        .frame(height:270)
        .padding(4)
    }//private func form
}//extension ContentView
//入力されたデータの一時保存場所。

extension ContentView{
    private func buttons() -> some View{
        HStack(spacing:50){
            NavigationLink(){
                
            }//NavigationLink
        }//HStack
    }//private func buttons
}//extension ContentView
