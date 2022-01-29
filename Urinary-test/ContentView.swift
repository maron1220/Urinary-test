//
//  ContentView.swift
//  Urinary-test
//
//  Created by 細川聖矢 on 2021/12/08.
//
//titleとbodyを入力する画面

import SwiftUI
import Combine

struct ContentView: View {
    @EnvironmentObject private var contentViewModel:ContentViewModel
    
    @State var keybordopen:Bool = false
    
    let screenwidth = Int(UIScreen.main.bounds.width)
    let screenheight = Int(UIScreen.main.bounds.height)
    
    //@State var isPresent:Bool = false
    
    @State var showingPopUp = false
    
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
    
    private var a4height = 11*72.0
    private var a4width = 8.5*72.0
    
    let selections = [
        "無色",
        "黄色",
        "濃黄色",
        "黒色",
        "赤褐色",
        "白色"
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
        "なし",
        "球菌",
        "桿菌",
        "真菌"
    ]
    
    let crystaldetailarray = [
        "なし",
        "ストルバイト",
        "シュウ酸カルシウム",
        "シスチン",
        "尿酸アンモニウム"
    ]
    
    let castdetailarray = [
        "なし",
        "硝子様円柱",
        "上皮細胞円柱",
        "顆粒円柱",
        "蝋様円柱",
        "赤血球円柱",
        "白血球円柱",
        "脂肪円柱"
    ]
    
    var body: some View {
      NavigationView{
//          ZStack{
//            Color.white
//                  .onTapGesture {
//                      UIApplication.shared.closeKeyboard()
//                  }
            VStack{
                Form{
                    usgform()
                    colorspicker()
                    
                    Group{
                        segmentedpicker(headertext: "ウロビリノーゲン", pickertext: "Uro", pickerarray: uroarray, segmentedselection: $uroselection)
                        
                        segmentedpicker(headertext: "潜血", pickertext: "OB", pickerarray: obarray, segmentedselection: $obselection)
                        
                        segmentedpicker(headertext: "ビリルビン", pickertext: "Bil", pickerarray: bilarray, segmentedselection: $bilselection)
                        
                        segmentedpicker(headertext: "ケトン", pickertext: "Keton", pickerarray: ketonarray, segmentedselection: $ketonselection)
                        
                        segmentedpicker(headertext: "グルコース", pickertext: "Glu", pickerarray: gluarray, segmentedselection: $gluselection)
                        
                        segmentedpicker(headertext: "タンパク", pickertext: "TP", pickerarray: tparray, segmentedselection: $tpselection)
                        
                        segmentedpicker(headertext: "pH", pickertext: "pH", pickerarray: pharray, segmentedselection: $phselection)
                    }//Group
                    
                    
                    HStack{
                        segmentedpicker(headertext: "赤血球", pickertext: "RBC", pickerarray: rbcarray, segmentedselection: $rbcselection)
                        
                        segmentedpicker(headertext: "白血球", pickertext: "WBC", pickerarray: wbcarray, segmentedselection: $wbcselection)
                    }//HStack
                    
                    Group{
                        //                    segmentedpicker(headertext: "MicroOrganism", pickertext: "Micro", pickerarray: microarray, segmentedselection: $microselection)
                        secondform(headertext: "細菌", pickertext: "Micro", pickerarray: microarray, pickerselection: $microselection,secondpickertext:"詳細",secondpickerarray:microdetailarray,secondpickerselection:$microdetailselection,secondtexteditor: $contentViewModel.microcomment)
                        
                        //                    segmentedpicker(headertext: "UrineCrystals", pickertext: "Crystal", pickerarray: crystalarray, segmentedselection: $crystalselection)
                        secondform(headertext: "結晶", pickertext: "Crystal", pickerarray: crystalarray, pickerselection: $crystalselection,secondpickertext:"詳細",secondpickerarray:crystaldetailarray,secondpickerselection:$crystaldetailselection,secondtexteditor: $contentViewModel.crystalcomment)
                        
                        
                        //                    segmentedpicker(headertext: "UrineCasts", pickertext: "Cast", pickerarray: castarray, segmentedselection: $castselection)
                        secondform(headertext: "尿道円柱", pickertext: "Cast", pickerarray: castarray, pickerselection: $castselection,secondpickertext:"詳細",secondpickerarray:castdetailarray,secondpickerselection:$castdetailselection,secondtexteditor: $contentViewModel.castcomment)
                        
                    }//Group
                    
                    
                }//Form
                
                ZStack{
                    HStack{
                        if keybordopen == false{
                pickerbutton()
                        }
                        if keybordopen{
                            keyboardbutton()
                        }
//                buttons()
                    }//HStack
                    .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardDidShowNotification)){_ in
                        self.keybordopen = true
                    }.onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardDidHideNotification)){_ in
                        self.keybordopen = false
                    }
                
                if showingPopUp{
                    PopUpView(isPresent: $showingPopUp)
                }
                }//ZStack
            }//VStack
            .navigationTitle(Text("尿検査"))
//          }//ZStack
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
            Text("尿比重")
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
                .frame(height:a4height/21*1.5)
        }//Section
    header:{
        Text(headertext)
    }footer: {
        Text("コメント")
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
            Picker(selection: $selection,label: Text("詳細")){
                ForEach(0..<selections.count){index in
                    Text(self.selections[index])
                }//ForEach
            }//Picker
            .labelsHidden()
        }header: {
            Text("尿色")
        }
    }//private func colors
}//extension ContentView

extension ContentView{
    private func keyboardbutton() -> some View{
        Button(action: {
            UIApplication.shared.closeKeyboard()
        },
               label: {
            Text("キーボードを閉じる")
        })
    }
}

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
            UIApplication.shared.closeKeyboard()
            withAnimation{
                showingPopUp = true
            }
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

extension UIApplication{
    func closeKeyboard(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}//UIApplication


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
