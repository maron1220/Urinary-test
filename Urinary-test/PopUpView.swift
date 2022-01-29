//
//  PopUpView.swift
//  Urinary-test
//
//  Created by 細川聖矢 on 2022/01/26.
//

import SwiftUI

struct PopUpView: View {
    @EnvironmentObject private var contentViewModel:ContentViewModel
    @Binding var isPresent:Bool
    @State private var show:Bool = false
    let screenwidth = UIScreen.main.bounds.width
    let screenheight = UIScreen.main.bounds.height
    
    var body: some View {
        VStack{
            Spacer()
            Group{
            Text("USG:\(contentViewModel.usgvalue)")
            Text("色：\(contentViewModel.urinecolor)")
            Text("ウロビリノーゲン：\(contentViewModel.urovalue)")
            Text("溶血：\(contentViewModel.obvalue)")
            Text("ビリルビン：\(contentViewModel.bilvalue)")
            Text("ケトン：\(contentViewModel.ketonvalue)")
            Text("グルコース：\(contentViewModel.gluvalue)")
            Text("タンパク：\(contentViewModel.tpvalue)")
            Text("pH：\(contentViewModel.phvalue)")
            Text("赤血球：\(contentViewModel.rbcvalue)")
            }//Group
            Group{
            Text("白血球：\(contentViewModel.wbcvalue)")
            Text("細菌：\(contentViewModel.microvalue)")
            Text("コメント：\(contentViewModel.microcomment)")
            Text("結晶：\(contentViewModel.crystalvalue)")
            Text("コメント：\(contentViewModel.crystalcomment)")
            Text("尿道円柱：\(contentViewModel.castvalue)")
            Text("コメント：\(contentViewModel.castcomment)")
            }//Group
            Spacer()
           Text("これでよろしいですか？")
            Spacer()
            HStack{
                Spacer()
                Button(action: {
                withAnimation{
                    isPresent = false
                    
                    }
                }, label: {
                    Text("閉じる")
                })//Button
                
                Spacer()

                Button(action: {
                    self.show = true
                }, label: {
                    Text("次のページへ")
                        .font(.title3)
                        .padding(15)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })//Button
                    .sheet(isPresented: self.$show){
                        PdfPreviewView()
                    }
                Spacer()
            }//HStack
            Spacer()
        }//VStack
        .frame(width: screenwidth*0.7 , height:screenheight*0.9,alignment: .center)
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }
}

struct PopUpView_Previews: PreviewProvider {
    
    @State static var isPresent = true
    
    static var previews: some View {
        PopUpView(isPresent: $isPresent)
    }
}
