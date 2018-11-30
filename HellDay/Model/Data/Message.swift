//
//  Message.swift
//  HellDay
//
//  Created by Ivan Tkachenko on 11/30/18.
//  Copyright © 2018 Ivan Tkachenko. All rights reserved.
//

import Foundation

struct Message: Decodable, Hashable {
    let title: String
    let text: String
}

