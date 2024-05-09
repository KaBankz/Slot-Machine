//
//  Slotify.swift
//  Slot Machine
//
//  Created by KaBanks on 4/15/23.
//

import Foundation
import SwiftUI

struct Slotify: ViewModifier {
    private let emoji: SlotEmoji
    private let geometry: GeometryProxy

    init(_ emoji: SlotEmoji, _ geometry: GeometryProxy) {
        self.emoji = emoji
        self.geometry = geometry
    }

    func body(content: Content) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 5)
                .frame(width: geometry.size.width, height: 100)

            Text(emoji.getEmojiContent())
                .font(.system(size: geometry.size.width / 2))
                .foregroundColor(emoji.getColor())
                .opacity((emoji.shade == SlotEmoji.Shades.shaded) ? 0.5 : 1)

        }
//        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY)
    }
}

extension View {
    func slotify(_ emoji: SlotEmoji, _ geometry: GeometryProxy) -> some View {
        return self.modifier(Slotify(emoji, geometry))
    }
}
