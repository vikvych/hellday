//
//  MessageViewController.swift
//  HellDay
//
//  Created by Ivan Tkachenko on 11/30/18.
//  Copyright © 2018 Ivan Tkachenko. All rights reserved.
//

import UIKit

let messageSegueName = "message"

class MessageViewController: UIViewController {

    @IBOutlet weak var titleLabel: LTMorphingLabel!
    @IBOutlet weak var textLabel: UILabelPadding!
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    var dataModel: MessagesDataModel!
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        dataModel = MessagesDataModel(localDataSource: DataStore())
        updateMessage(animated: false)
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if case .motionShake = motion {
            updateMessage(animated: true)
        }
    }
    
    private func updateMessage(animated: Bool) {
        let message = dataModel.randomMessage()
        let colorSet = dataModel.randomColorSet()
        
        if animated {
            UIView.animate(withDuration: 0.1, animations: {
                self.blurView.alpha = 1.0
            }) { _ in
                self.view.backgroundColor = colorSet.background
                self.textLabel.text = message.text
                self.textLabel.textColor = .white //colorSet.tint
                self.textLabel.layer.borderColor = colorSet.tint.cgColor
                self.titleLabel.text = message.title
                self.titleLabel.alpha = 0.0
                self.textLabel.alpha = 0.0
                self.titleLabel.transform = CGAffineTransform(scaleX: 1.2, y: 1.2).translatedBy(x: 0.0, y: -40)
                self.textLabel.transform = CGAffineTransform(scaleX: 0.8, y: 0.8).translatedBy(x: 0.0, y: 40)
                
                UIView.animateKeyframes(withDuration: 0.4, delay: 0.0, options: [.calculationModeCubicPaced], animations: {
                    UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                        self.blurView.alpha = 0.0
                    })
                    UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                        self.titleLabel.alpha = 1.0
                        self.textLabel.alpha = 1.0
                        self.titleLabel.transform = .identity
                        self.textLabel.transform = .identity
                    })
                }, completion: nil)
            }
        } else {
            view.backgroundColor = colorSet.background
            textLabel.text = message.text
            textLabel.textColor = .white //colorSet.tint
            textLabel.layer.borderColor = colorSet.tint.cgColor
            titleLabel.text = message.title
        }
        
//        titleLabel.morphingEffect = UILabelPadding.effects[Int(arc4random_uniform(UInt32(UILabelPadding.effects.count)))]
    }

}
