//
//  Item.swift
//  SamleFacId
//
//  Created by Tsubasa on 2024/10/06.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
