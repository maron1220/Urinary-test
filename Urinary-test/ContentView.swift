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
    @State private var rbcselection = 0//segmentedpicker
    @State private var wbcselection = 0//segmentedpicker
    @State private var microselection = 0//segmentedpicker
    @State private var crystalselection = 0//segmentedpicker
    @State private var castselection = 0//segmentedpicker
    @State private var microdetailselection = 0
    @State private var crystaldetailselection = 0
    @State private var castdetailselection = 0
    
    
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
        "-",
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
    
    let wbcarray = [
        "-",
        "+"
    ]
    
    let rbcarray = [
        "-",
        "+"
    ]
    
    let microarray = [
        "-",
        "+"
    ]
    
    let crystalarray = [
        "-",
        "+"
    ]
    
    let castarray = [
        "-",
        "+"
        
    ]
    
    let microdetailarray = [
        "Nothing",
        "bacteria",
        "yeast",
        "fungi"
    ]
    
    let crystaldetailarray = [
        "Nothing",
        "Struvite crystals",
        "Calcium oxalate dihydride crystals",
        "Cystine crystals",
        "Ammonium biurate or uric acid crystals"
    ]
    
    let castdetailarray = [
        "Nothing",
        "Hyaline casts",
        "Epithelial cellular casts",
        "Granular casts",
        "Waxy casts",
        "RBC casts",
        "WBC casts",
        "Fatty casts"
    ]
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    usgform()
                    colorspicker()
                    
                    Group{
                        segmentedpicker(headertext: "Urobilinogen", pickertext: "Uro", pickerarray: uroarray, segmentedselection: $uroselection)
                        
                        segmentedpicker(headertext: "OB", pickertext: "OB", pickerarray: obarray, segmentedselection: $obselection)
                        
                        segmentedpicker(headertext: "Bilirubin", pickertext: "Bil", pickerarray: bilarray, segmentedselection: $bilselection)
                        
                        segmentedpicker(headertext: "Keton", pickertext: "Keton", pickerarray: ketonarray, segmentedselection: $ketonselection)
                        
                        segmentedpicker(headertext: "Glucose", pickertext: "Glu", pickerarray: gluarray, segmentedselection: $gluselection)
                        
                        segmentedpicker(headertext: "TP", pickertext: "TP", pickerarray: tparray, segmentedselection: $tpselection)
                        
                        segmentedpicker(headertext: "pH", pickertext: "pH", pickerarray: pharray, segmentedselection: $phselection)
                    }//Group
                    
                    
                    HStack{
                        segmentedpicker(headertext: "RBC", pickertext: "RBC", pickerarray: rbcarray, segmentedselection: $rbcselection)
                        
                        segmentedpicker(headertext: "WBC", pickertext: "WBC", pickerarray: wbcarray, segmentedselection: $wbcselection)
                    }//HStack
                    
                    Group{
                        //                    segmentedpicker(headertext: "MicroOrganism", pickertext: "Micro", pickerarray: microarray, segmentedselection: $microselection)
                        secondform(headertext: "MicroOrganism", pickertext: "Micro", pickerarray: microarray, pickerselection: $microselection,secondpickertext:"Detail",secondpickerarray:microdetailarray,secondpickerselection:$microdetailselection,secondtexteditor: $contentViewModel.microcomment)
                        
                        //                    segmentedpicker(headertext: "UrineCrystals", pickertext: "Crystal", pickerarray: crystalarray, segmentedselection: $crystalselection)
                        secondform(headertext: "UrineCrystals", pickertext: "Crystal", pickerarray: crystalarray, pickerselection: $crystalselection,secondpickertext:"Detail",secondpickerarray:crystaldetailarray,secondpickerselection:$crystaldetailselection,secondtexteditor: $contentViewModel.crystalcomment)
                        
                        
                        //                    segmentedpicker(headertext: "UrineCasts", pickertext: "Cast", pickerarray: castarray, segmentedselection: $castselection)
                        secondform(headertext: "UrineCasts", pickertext: "Cast", pickerarray: castarray, pickerselection: $castselection,secondpickertext:"Detail",secondpickerarray:castdetailarray,secondpickerselection:$castdetailselection,secondtexteditor: $contentViewModel.castcomment)
                        
                    }//Group
                    
                    
                }//Form
                pickerbutton()
                buttons()
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
            Text("Urinary Specific Gravity")
            //                .foregroundColor(.gray)
        }
    }//private func usgform
}//extension ContentView

extension ContentView{
    private func secondform(headertext:String,pickertext:String,pickerarray:[String],pickerselection:Binding<Int>,secondpickertext:String,secondpickerarray:[String],secondpickerselection:Binding<Int>,secondtexteditor:Binding<String>) -> some View{
        
        Section{
//            Picker(selection:pickerselection , label: Text(pickertext)){
//                ForEach(0..<pickerarray.count){index in
//                    Text(pickerarray[index])
//                }
//            }//Picker
//            .pickerStyle(SegmentedPickerStyle())
            
            Picker(selection:secondpickerselection , label: Text(secondpickertext)){
                ForEach(0..<secondpickerarray.count){num in
                    Text(secondpickerarray[num])
            }
            //TextFieldとTextEditerの内容をBinding($)でViewModelに渡す。
            }//Picker
            TextEditor(text: secondtexteditor)
                .frame(height:100)
        }//Section
    header:{
        Text(headertext)
    }footer: {
        Text("comment")
    }
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
            Picker(selection: $selection,label: Text("Detail")){
                ForEach(0..<selections.count){index in
                    Text(self.selections[index])
                }//ForEach
            }//Picker
            .labelsHidden()
        }header: {
            Text("Urine Color")
        }
    }//private func colors
}//extension ContentView

extension ContentView{
    private func pickerbutton() -> some View{
        Button(action:{
            contentViewModel.urinecolor = selections[selection]
            contentViewModel.urovalue = uroarray[uroselection]
            contentViewModel.obvalue = obarray[obselection]
            contentViewModel.bilvalue = bilarray[bilselection]
            contentViewModel.ketonvalue = ketonarray[ketonselection]
            contentViewModel.gluvalue = gluarray[gluselection]
            contentViewModel.tpvalue = tparray[tpselection]
            contentViewModel.phvalue = pharray[phselection]
            contentViewModel.rbcvalue = rbcarray[rbcselection]
            contentViewModel.wbcvalue = wbcarray[wbcselection]
            contentViewModel.microvalue = microarray[microselection]
            contentViewModel.crystalvalue = crystalarray[crystalselection]
            contentViewModel.castvalue = castarray[castselection]
            contentViewModel.microdetail = microdetailarray[microdetailselection]
            contentViewModel.crystaldetail = crystaldetailarray[crystaldetailselection]
            contentViewModel.castdetail = castdetailarray[castdetailselection]
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
