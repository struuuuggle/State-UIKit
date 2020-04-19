//
//  ViewController.swift
//  State-UIKit
//
//  Created by Mikiya Abe on 2020/04/19.
//  Copyright © 2020 struuuuggle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var safeFrame: SafeFrame!
    private var hour: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(update),
            userInfo: nil,
            repeats: true
        )
    }
}

private extension ViewController {
    @objc func update() {
        safeFrame.setClock(hour: hour)
        hour += 1
        hour %= 24
    }
}
