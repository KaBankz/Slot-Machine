//
//  SlotEmoji.swift
//  Slot Machine
//
//  Created by KaBanks on 4/13/23.
//

import Foundation
import SwiftUI

struct SlotEmoji: Identifiable {
    var id: Int

    var orientation: Orientation
    var shade: Shades
    var color: Colors

    enum Orientation {
        case top
        case down
        case right
        case left

        static var all: [Orientation] = [.top, .down, .right, .left]
    }

    enum Colors {
        case red
        case green
        case blue
        case purple

        static var all: [Colors] = [.red, .green, .blue, .purple]
    }

    enum Shades {
        case filled
        case outlined
        case shaded

        static var all: [Shades] = [.filled, .outlined, .shaded]
    }

    func getEmojiContent() -> String {
        if self.shade != .outlined {
            switch self.orientation {
                case .top:
                    return "▲"
                case .down:
                    return "▼"
                case .right:
                    return "▶"
                case .left:
                    return "◀"
            }
        } else {
            switch self.orientation {
                case .top:
                    return "△"
                case .down:
                    return "▽"
                case .right:
                    return "▷"
                case .left:
                    return "◁"
            }
        }
    }

    func getColor() -> Color {
        switch self.color {
            case .red:
                return Color.red
            case .green:
                return Color.green
            case .blue:
                return Color.blue
            case .purple:
                return Color.purple
        }
    }
}
