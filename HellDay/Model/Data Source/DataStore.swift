//
//  DataStore.swift
//  HellDay
//
//  Created by Ivan Tkachenko on 11/30/18.
//  Copyright © 2018 Ivan Tkachenko. All rights reserved.
//

import Foundation

class DataStore {
    
    private var localMessages: [Message]
    
    init() {
        let decoder = JSONDecoder()
        let messages: [Message]
        
        do {
            let data = try Data(contentsOf: Bundle.main.url(forResource: "phrases", withExtension: "json")!)
            messages = try decoder.decode([Message].self, from: data)
        } catch {
            fatalError("Cannot launch without messages")
        }
        
        localMessages = messages
    }
    
}

extension DataStore: MessagesLocalDataSource {
    
    func messages() -> [Message] {
        return localMessages
    }
    
}
