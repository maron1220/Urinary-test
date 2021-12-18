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
    @State private var selection = 0 //urinecolor's picker
    @State private var uroselection = 0//segmentedpicker
    @State private var obselection = 0//segmentedpicker
    @State private var bilselection = 0//segmentedpicker
    @State private var ketonselection = 0//segmentedpicker
    @State private var gluselection = 0//segmentedpicker
    @State private var tpselection = 0//segmentedpicker
    @State private var phselection = 0//segmentedpicker
    
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
    
    let uroarray = [
        "Normal",
        "+",
        "++",
        "+++"
    ]
    
    let obarray = [
        "-",
        "+",
        "++",
        "+++"
    ]
    
    let bilarray = [
        "-",
        "+",
        "++",
        "+++"
    ]
    
    let ketonarray = [
        "-",
        "+",
        "++",
        "+++"
    ]
    
    let gluarray = [
        "-",
        "+",
        "++",
        "+++"
    ]
    
    let tparray = [
        "-",
        "+",
        "++",
        "+++"
    ]
    
    let pharray = [
        "5.0",
        "6.0",
        "6.5",
        "7.0",
        "7.5",
        "8.0",
        "8.5"
    ]
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    usgform()
                    colorspicker()
                    
                    segmentedpicker(headertext: "Choose:「Uro Value」", pickertext: "Uro", pickerarray: uroarray, segmentedselection: $uroselection)
                    
                    segmentedpicker(headertext: "Choose:「OB Value」", pickertext: "OB", pickerarray: obarray, segmentedselection: $obselection)
                    
                    segmentedpicker(headertext: "Choose:「Bilirubin Value」", pickertext: "Bil", pickerarray: bilarray, segmentedselection: $bilselection)
                    
                    segmentedpicker(headertext: "Choose:「Keton Value」", pickertext: "Keton", pickerarray: ketonarray, segmentedselection: $ketonselection)
                    
                    segmentedpicker(headertext: "Choose:「Glucose Value」", pickertext: "Glu", pickerarray: gluarray, segmentedselection: $gluselection)
                    
                    segmentedpicker(headertext: "Choose:「TP Value」", pickertext: "TP", pickerarray: tparray, segmentedselection: $tpselection)
                    
                    segmentedpicker(headertext: "Choose:「pH Value」", pickertext: "pH", pickerarray: pharray, segmentedselection: $phselection)
                }//Form
                pickerbutton()
                buttons()
                //                form()
            }//VStack
            .navigationTitle(Text("Urinary Test"))
        }//NavigationView
    .environmentObject(contentViewModel)
}//var body
}//strunc ContentView



extension ContentView{
    private func usgform() -> some View{
        Section{
            TextField("USG",text: $contentViewModel.usgvalue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
                .keyboardType(.decimalPad)
                .frame(width: 300, height: 50)
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
        Section{
            Picker(selection: $selection,label: Text("")){
                ForEach(0..<selections.count){index in
                    Text(self.selections[index])
                }//ForEach
            }//Picker
            .labelsHidden()
        }header: {
            Text("Choose:「Urine Color」")
        }
    }//private func colors
}//extension ContentView

extension ContentView{
    private func pickerbutton() -> some View{
        Button(action:{
            contentViewModel.urinecolor = selections[selection]
            contentViewModel.urovalue = uroarray[uroselection]
        }){
            Text("Picker Register")
                .padding(10)
                .frame(width:100)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
        }//Button
    }//func pickerbutton
}//extension ContentView

extension ContentView{
    private func segmentedpicker(headertext:String,pickertext:String, pickerarray:[String],segmentedselection:Binding<Int>) -> some View{
        Section{
            Picker(selection:segmentedselection , label: Text(pickertext)){
                ForEach(0..<pickerarray.count){index in
                    Text(pickerarray[index])
                }
            }//Picker
            .pickerStyle(SegmentedPickerStyle())
        }header: {
            Text(headertext)
        }
    }//func segmentedpicker
}//extension ContentView


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
