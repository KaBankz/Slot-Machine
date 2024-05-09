//
//  SlotMachineGame.swift
//  Slot Machine
//
//  Created by KaBanks on 4/13/23.
//

import Foundation

struct SlotMachineGame {
    private var wallet = 100

    var balance: Int {
        get {
            wallet
        }
        set {
            wallet = newValue
        }
    }

    var currentEmojis: [SlotEmoji]
    private var emojiSet: [SlotEmoji]

    mutating func newGame() {
        self = SlotMachineGame()
    }

    mutating func spin() {
        self.balance -= 5

        self.currentEmojis = Array(emojiSet[0..<3])
        self.emojiSet = self.emojiSet.shuffled()

        jackpot()
    }

    mutating private func jackpot() {

        // After a spin, a player's balance is increased as follows after the emojis are randomly chosen:
        //     Add $25 if all three attributes are the same or all different. (i.e. All the colors are the same or all are different and all the shapes are all the same or all are different and all the shades are the same or all are different). This is similar to a set in the Set game you did for Homework 3.
        //     Add $5 if only two attributes of the emojis are all the same or all different. (i.e. All are the same color or all are different colors and all are the same shape or all are different shapes).
        //     Add $1 if only one attribute of the emojis are all the same or all different. (i.e. All are the same color or all are different colors, or all are the same shape or all are different shapes, or all the same shade or all are different shades).
        //     Important note: For the purpose if matching shapes, please note that ▲ and △ are considered the same shape. The same applies for the other shapes.

        let card1 = currentEmojis[0]
        let card2 = currentEmojis[1]
        let card3 = currentEmojis[2]

        var sameOrDifferentAttributes = 0

        if (((card1.orientation == card2.orientation) && (card2.orientation == card3.orientation) ||
                (card1.orientation != card2.orientation) && (card1.orientation != card3.orientation) && (card2.orientation != card3.orientation))) {
            sameOrDifferentAttributes += 1
        }

        if (((card1.shade == card2.shade) && (card2.shade == card3.shade) ||
                (card1.shade != card2.shade) && (card1.shade != card3.shade) && (card2.shade != card3.shade))) {
            sameOrDifferentAttributes += 1
        }

        if (((card1.color == card2.color) && (card2.color == card3.color) ||
                (card1.color != card2.color) && (card1.color != card3.color) && (card2.color != card3.color))) {
            sameOrDifferentAttributes += 1
        }

        // Case 1: All the same
        if sameOrDifferentAttributes == 3 {
            self.balance += 25
            return
        }

        // Case 2: Two of the same
        if sameOrDifferentAttributes == 2 {
            self.balance += 5
            return
        }

        // Case 3: One of the same
        if sameOrDifferentAttributes == 1 {
            self.balance += 1
            return
        }

        return
    }

    init() {
        self.currentEmojis = []
        self.emojiSet = []

        var id = 1

        for color in SlotEmoji.Colors.all {
            for orientation in SlotEmoji.Orientation.all {
                for shade in SlotEmoji.Shades.all {
                    self.emojiSet += [SlotEmoji(
                                        id: id,
                                        orientation: orientation,
                                        shade: shade,
                                        color: color)]
                    id += 1
                }
            }
        }

        // Shuffle the set after creating it
        self.emojiSet = self.emojiSet.shuffled()

        // Choose the first 3 emojis from the shuffled set
        self.currentEmojis = Array(emojiSet[0..<3])
        // Reshuffle the deck
        self.emojiSet = self.emojiSet.shuffled()

    }
}
