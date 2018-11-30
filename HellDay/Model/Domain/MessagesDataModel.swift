//
//  MessagesDataModel.swift
//  HellDay
//
//  Created by Ivan Tkachenko on 11/30/18.
//  Copyright © 2018 Ivan Tkachenko. All rights reserved.
//

import UIKit

protocol MessagesLocalDataSource {
    
    func messages() -> [Message]
    
}

struct MessagesDataModel {
    
    private var localDataSource: MessagesLocalDataSource
    
    private var currentMessage: Message?
    private let colorSets: [ColorSet]
    
    init(localDataSource: MessagesLocalDataSource) {
        self.localDataSource = localDataSource
        
        colorSets = [
            ColorSet(background: .black, tint: UIColor(withHex: "f05d23")!),
            ColorSet(background: UIColor(withHex: "0B032D")!, tint: UIColor(withHex: "843B62")!),
            ColorSet(background: UIColor(withHex: "A26EA1")!, tint: UIColor(withHex: "FFB480")!),
            ColorSet(background: UIColor(withHex: "003459")!, tint: UIColor(withHex: "00DBE7")!),
            ColorSet(background: UIColor(withHex: "0B032D")!, tint: UIColor(withHex: "843B62")!),
            ColorSet(background: UIColor(withHex: "A12559")!, tint: UIColor(withHex: "FCCDE2")!),
            ColorSet(background: UIColor(withHex: "27296D")!, tint: UIColor(withHex: "F5C7F7")!),
            ColorSet(background: UIColor(withHex: "20716a")!, tint: UIColor(withHex: "ffc0c2")!),
            ColorSet(background: UIColor(withHex: "EF255F")!, tint: UIColor(withHex: "FEFF89")!),
            ColorSet(background: UIColor(withHex: "843b62")!, tint: UIColor(withHex: "f67e7d")!),
            ColorSet(background: UIColor(withHex: "1f4287")!, tint: UIColor(withHex: "21e6c1")!),
            ColorSet(background: UIColor(withHex: "d22780")!, tint: UIColor(withHex: "f8b500")!)

        ]
    }
    
    func randomMessage() -> Message {
        var messages = localDataSource.messages()
        
        if let current = currentMessage, let index = messages.firstIndex(of: current) {
            messages.remove(at: index)
        }
        
        return messages[Int(arc4random_uniform(UInt32(messages.count)))]
    }
    
    func randomColorSet() -> ColorSet {
        return colorSets[Int(arc4random_uniform(UInt32(colorSets.count)))]
    }
    
}
