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
