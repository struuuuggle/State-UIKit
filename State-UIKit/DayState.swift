//
//  DayState.swift
//  State-UIKit
//
//  Created by Mikiya Abe on 2020/04/19.
//  Copyright © 2020 Mikiya Abe. All rights reserved.
//

import Foundation

/// 昼間の状態をクラス
final class DayState: State {
    private static var shared = DayState()

    private init() {}

    static func getInstance() -> DayState {
        shared
    }
    /// 時刻設定
    func doClock(context: Context, hour: Int) {
        if hour < 9 || 17 <= hour {
            context.changeSate(state: NightState.getInstance())
        }
    }
    /// 金庫使用
    func doUse(contenxt: Context) {
        contenxt.recordLog("金庫使用(昼間)")
    }
    /// 非常ベル
    func doAlarm(context: Context) {
        context.callSecurityCenter("非常ベル(昼間)")
    }
    /// 通常通話
    func doPhone(context: Context) {
        context.callSecurityCenter("通常の通話(昼間)")
    }
}

extension DayState: CustomStringConvertible {
    var description: String {
        "[昼間]"
    }
}
