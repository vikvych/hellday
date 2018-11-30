//
//  MainViewController.swift
//  HellDay
//
//  Created by Ivan Tkachenko on 11/30/18.
//  Copyright © 2018 Ivan Tkachenko. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func becomeFirstResponder() -> Bool {
        return true
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if case .motionShake = motion {
            performSegue(withIdentifier: messageSegueName, sender: nil)
        }
    }
    
}
