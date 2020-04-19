//
//  State.swift
//  State-UIKit
//
//  Created by Mikiya Abe on 2020/04/19.
//  Copyright © 2020 Mikiya Abe. All rights reserved.
//

import Foundation

/// 金庫の状態
protocol State {
    /// 時刻設定
    func doClock(context: Context, hour: Int)
    /// 金庫使用
    func doUse(contenxt: Context)
    /// 非常ベル
    func doAlarm(context: Context)
    /// 通常通話
    func doPhone(context: Context)
}
