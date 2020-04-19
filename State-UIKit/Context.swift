//
//  Context.swift
//  DesignPatternsInSwift
//  State-UIKit
//
//  Created by Mikiya Abe on 2020/04/19.
//  Copyright © 2020 Mikiya Abe. All rights reserved.
//

import Foundation

/// 状態を管理したり、警備センターの呼び出し
protocol Context {
    /// 時刻の設定
    func setClock(hour: Int)
    /// 状態変化
    func changeSate(state: State)
    /// 警備センター呼び出し
    func callSecurityCenter(_ message: String)
    /// 警備センター記録
    func recordLog(_ message: String)
}
