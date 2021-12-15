//
//  ShareView.swift
//  Urinary-test
//
//  Created by 細川聖矢 on 2021/12/15.
//

import Foundation
import UIKit
//シェアしたいPDFファイルを表示する

let sharer = UIActivityViewController(activityItems: ["Hello world"], applicationActivities: nil)
//text,images,strings,UPLsなどをシェアするのにUIActivityViewControllerが必要。
//activityItemsはArrayで返す。
present(sharer,animated:true)
