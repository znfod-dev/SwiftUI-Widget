//
//  ContentView.swift
//  SwiftUIWidget
//
//  Created by ParkJonghyun on 2021/03/25.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    
    @AppStorage("emoji", store: UserDefaults(suiteName: "group.com.jhpark.SwiftUIWidget"))
    var emojiData: Data = Data()
    
    @State private var selectedEmoji:Emoji = Emoji(icon: "😃", name: "N/A", description: "N/A")
    
    let emojis = [
        Emoji(icon: "😃", name: "Happy", description: "This means the user is about that life!"),
        Emoji(icon: "😐", name: "Stare", description: "That just happend; right here in front of me..."),
        Emoji(icon: "🤬", name: "Heated", description: "Completely done with your ish Karen!")
    ]
    
    var body: some View {
        VStack(spacing: 30) {
            ForEach(emojis) { emoji in
                EmojiView(emoji: emoji)
                    .onTapGesture {
                        save(emoji)
                    }
            }
            
            EmojiView(emoji: self.selectedEmoji)
        }
    }
    
    func save(_ emoji: Emoji) {
        print("save \(emoji)")
        guard let emojiData = try? JSONEncoder().encode(emoji) else { return }
        self.emojiData = emojiData
        self.selectedEmoji = emoji
        WidgetCenter.shared.reloadAllTimelines()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
