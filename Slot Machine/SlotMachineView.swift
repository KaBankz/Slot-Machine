//
//  SlotMachineView.swift
//  Slot Machine
//
//  Created by KaBanks on 4/12/23.
//

import SwiftUI

struct SlotMachineView: View {

    @State var game = SlotMachineGame()

    var body: some View {
        VStack {
            Text("Balance: $\(game.balance)").font(.system(size: 60)).bold()
            Spacer()

            slots(emojis: game.currentEmojis)

            Spacer()
            HStack {
                Button(action: {
                    game.newGame()
                }) {
                    VStack {
                        Image(systemName:"play.circle")
                            .font(.system(size: 50))
                        Text("New Game")
                            .font(.callout)
                    }
                }
                Spacer()
                Button(action: {
                    game.spin()
                }) {
                    VStack {
                        Image(systemName:"arrow.triangle.2.circlepath")
                            .font(.system(size: 50))
                        Text("Spin")
                            .font(.callout)
                    }
                }.disabled(game.balance < 5)
            }
        }.padding()
    }

    @ViewBuilder
    private func slots(emojis: [SlotEmoji]) -> some View {

        HStack(spacing: 20) {
                ForEach(emojis) { emoji in
                    GeometryReader { geometry in
                        Text(emoji.getEmojiContent()).slotify(emoji, geometry)
                    }
                }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SlotMachineView()
    }
}
