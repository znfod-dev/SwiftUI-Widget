//
//  EmojiView.swift
//  SwiftUIWidget
//
//  Created by ParkJonghyun on 2021/03/25.
//

import SwiftUI

struct EmojiView: View {
    let emoji: Emoji
    
    var body: some View {
        Text(emoji.icon)
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
            .clipShape(Circle())
    }
    
}

