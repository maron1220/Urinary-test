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
    
    @State private var selection = 0
    let selections = [
        "'Colorless' or 'Light yellow'",
        "'Dark yellow' or 'Yellow-orange'",
        "'Yellow-green' or 'Yellow-brown'",
        "'Brown' to 'Black'",
        "'Red' to 'Red-brown'",
        "'Pink' to 'Brown'",
        "Orange-red",
        "Blue-green",
        "Milky white"
    ]
    
    var body: some View {
        NavigationView{
            VStack{
                usgform()
                colorspicker()
                Spacer()
//                buttons()
//                form()
            }//VStack
            .navigationTitle(Text("Urinary Test"))
        }//NavigationView
        .environmentObject(contentViewModel)
    }//var body
}//strunc ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView{
    private func usgform() -> some View{
            Section{
                TextField("USG",text: $contentViewModel.usgvalue)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                    .keyboardType(.decimalPad)
            }header: {
                Text("Input:「Urinary Specific Gravity」")
                    .foregroundColor(.gray)
            }
    }//private func usgform
}//extension ContentView

extension ContentView{
    private func form() -> some View{
        Form{
            TextField("Title",text: $contentViewModel.title)
            Text("Body").font(.headline)
            
            TextEditor(text: $contentViewModel.body)
                .frame(height:100)
            
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
            NavigationLink(destination: PdfPreviewView()){
                Text("Create")
                    .padding(10)
                    .frame(width:100)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }//NavigationLink
            .environmentObject(contentViewModel)
        }//HStack
    }//private func buttons
}//extension ContentView

extension ContentView{
    private func colorspicker() -> some View{
        VStack{
        Section{
                Picker(selection: $selection,label: Text("Urine Color")){
                ForEach(0..<selections.count){index in
                    Text(self.selections[index])
            }//ForEach
            }//Picker
        }header: {
            Text("Choose:「Urine Color」")
                .foregroundColor(.gray)
        }
        Text("Urine color : \(selections[selection])")
        }//VStack
    }//private func colors
}//extension ContentView
