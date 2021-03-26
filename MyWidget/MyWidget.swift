//
//  MyWidget.swift
//  MyWidget
//
//  Created by ParkJonghyun on 2021/03/25.
//

import WidgetKit
import SwiftUI

struct EmojiEntry: TimelineEntry {
    let date = Date()
    let emoji: Emoji
    
}

struct Provider: TimelineProvider {

    typealias Entry = EmojiEntry
    
    @AppStorage("emoji", store: UserDefaults(suiteName: "group.com.jhpark.SwiftUIWidget"))
    var emojiData: Data = Data()
    
    func placeholder(in context: Context) -> EmojiEntry {
        print("placeholder")
        guard let emoji = try? JSONDecoder().decode(Emoji.self, from: emojiData) else {
            let emoji = Emoji(icon: "😃", name: "N/A", description: "N/A")
            let entry = EmojiEntry(emoji: emoji)
            return entry
        }
        let entry = EmojiEntry(emoji: emoji)
        return entry
    }
    
    func getSnapshot(in context: Context, completion: @escaping (EmojiEntry) -> Void) {
        print("getSnapshot")
        guard let emoji = try? JSONDecoder().decode(Emoji.self, from: emojiData) else {
            print("getSnapshot emoji return")
            return
        }
        let entry = EmojiEntry(emoji: emoji)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<EmojiEntry>) -> Void) {
        print("getTimeline")
        guard let emoji = try? JSONDecoder().decode(Emoji.self, from: emojiData) else {
            print("getTimeline emoji return")
            return
        }
        let entry = EmojiEntry(emoji: emoji)
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }
    
}

struct WidgetEntryView: View {
    
    let entry: Provider.Entry
    var body: some View {
        EmojiView(emoji: entry.emoji)
    }
}

@main
struct MyWidget: Widget {
    private let kind = "MyWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: Provider()
        ) { entry in
            WidgetEntryView(entry: entry)
        }
    }
}
