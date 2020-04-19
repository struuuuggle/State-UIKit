//
//  SafeFrame.swift
//  State-UIKit
//
//  Created by Mikiya Abe on 2020/04/19.
//  Copyright © 2020 struuuuggle. All rights reserved.
//

import UIKit

final class SafeFrame: UIView {
    @IBOutlet private weak var textClock: UILabel!
    @IBOutlet private weak var scrollView: UIScrollView! {
        didSet {
            scrollView.layer.borderWidth = 1            
        }
    }
    @IBOutlet private weak var textScreen: UILabel!
    @IBOutlet private weak var useButton: UIButton! {
        didSet {
            useButton.addTarget(
                self,
                action: #selector(useSafeFrame),
                for: .touchUpInside
            )
        }
    }
    @IBOutlet private weak var alarmButton: UIButton! {
        didSet {
            alarmButton.addTarget(
                self,
                action: #selector(triggerAlarm),
                for: .touchUpInside
            )
        }
    }
    @IBOutlet private weak var phoneButton: UIButton! {
        didSet {
            phoneButton.addTarget(
                self,
                action: #selector(call),
                for: .touchUpInside
            )
        }
    }
    @IBOutlet private weak var exitButton: UIButton!

    private var state: State = DayState.getInstance()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
}

extension SafeFrame: Context {
    func setClock(hour: Int) {
        var clockString = "現在の時刻は"
        let zero = (hour < 10) ? "0" : ""
        clockString += "\(zero)\(hour):00"

        print(clockString)
        textClock.text = clockString
        state.doClock(context: self, hour: hour)
    }

    func changeSate(state: State) {
        print("\(self.state)から\(state)へ状態は変化しました。")
        self.state = state
    }

    func callSecurityCenter(_ message: String) {
        textScreen.text! += "call! \(message)\n"
    }

    func recordLog(_ message: String) {
        textScreen.text! += "record ... \(message)\n"
    }
}

private extension SafeFrame {
    func configure() {
        let nib = UINib(nibName: "SafeFrame", bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }

    @objc func useSafeFrame() {
        state.doUse(contenxt: self)
    }

    @objc func triggerAlarm() {
        state.doAlarm(context: self)
    }

    @objc func call() {
        state.doPhone(context: self)
    }

    @objc func exit() {}
}
