//
//  NightState.swift
//  State-UIKit
//
//  Created by Mikiya Abe on 2020/04/19.
//  Copyright © 2020 Mikiya Abe. All rights reserved.
//

import Foundation

/// 「夜間」という状態を表すクラス
final class NightState: State {
    private static var shared = NightState()

    private init() {}

    static func getInstance() -> NightState {
        shared
    }
    /// 時刻設定
    func doClock(context: Context, hour: Int) {
        if 9..<17 ~= hour {
            context.changeSate(state: DayState.getInstance())
        }
    }
    /// 金庫使用
    func doUse(contenxt: Context) {
        contenxt.callSecurityCenter("非常：夜間の金庫使用！")
    }
    /// 非常ベル
    func doAlarm(context: Context) {
        context.callSecurityCenter("非常ベル(夜間)")
    }
    /// 通常通話
    func doPhone(context: Context) {
        context.recordLog("夜間の通話録音")
    }
}

extension NightState: CustomStringConvertible {
    var description: String {
        "[夜間]"
    }
}
