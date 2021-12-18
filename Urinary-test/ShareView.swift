//
//  ShareView.swift
//  Urinary-test
//
//  Created by 細川聖矢 on 2021/12/15.
//

import Foundation
import UIKit
import SwiftUI
//シェアしたいPDFファイルを表示する

//let sharer = UIActivityViewController(activityItems: ["Hello world"], applicationActivities: nil)
//text,images,strings,UPLsなどをシェアするのにUIActivityViewControllerが必要。
//activityItemsはArrayで返す。
//present(sharer,animated:true)

struct ShareView:UIViewControllerRepresentable{
    let activityItems:[Any]
    let applicationActivities:[UIActivity]? = nil
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ShareView>) -> UIActivityViewController{
        return UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
    }//func UIViewController
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ShareView>) {
        //empty
    }//func updateUIViewController
}//UIViewControllerRepresentable
