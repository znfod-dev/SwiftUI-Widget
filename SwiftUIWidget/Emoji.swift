//
//  Emoji.swift
//  SwiftUIWidget
//
//  Created by ParkJonghyun on 2021/03/25.
//

import Foundation


struct Emoji: Identifiable, Codable {
    let icon: String
    let name: String
    let description: String
    
    var id: String { icon }
    
}

