//
//  Theme.swift
//  Memorize
//
//  Created by Ibrahim Abdul Aziz on 06/12/2021.
//

import SwiftUI

struct Theme {
    var themeName: String
    var cardColor: String
    var emojis: [String]
    var numberOfPairsOfCards: Int
    
    init(themeName: String, cardColor: String, emojis: [String], numberOfPairsOfCards: Int) {
        self.themeName = themeName
        self.cardColor = cardColor
        self.emojis = emojis
        self.numberOfPairsOfCards = numberOfPairsOfCards > emojis.count ? emojis.count : numberOfPairsOfCards
    }
}




let sportTheme = Theme(themeName: "SPORTS", cardColor: "green", emojis: ["🏓", "🎱", "🏀", "⚽️", "🏈", "🏐", "🎾", "🥎", "🥏", "🏑", "🏏", "🥅", "🥊", "🏂", "🏊‍♂️", "🧗‍♂️", "🚴‍♀️", "🎮"], numberOfPairsOfCards: 8)

let hallowenTheme = Theme(themeName: "HALLOWEN", cardColor: "red", emojis: ["💀", "👻", "👽", "🧙", "🧛", "🧟", "🦇", "🕷", "🕸", "🛸", "🎃", "🎭","🗡", "⚰"], numberOfPairsOfCards: 10)

let flagTheme = Theme(themeName: "FLAGS", cardColor: "black", emojis: ["🇦🇺", "🇦🇷", "🇩🇿", "🏳️", "🏴", "🇪🇬", "🎌", "🇯🇵", "🇱🇧", "🇧🇩", "🇧🇪", "🏴‍☠️", "🇨🇿", "🇳🇫"], numberOfPairsOfCards: 8)

let vehicleTheme = Theme(themeName: "VEHICLES", cardColor: "blue", emojis: ["🚗", "🚕", "🚛", "🚒", "🚜", "🚔", "🚍", "🚅", "🚝", "✈️", "🚂", "🚀", "🛳", "⛴", "🚢"], numberOfPairsOfCards: 8)

let emojiTheme = Theme(themeName: "EMjOJIS", cardColor: "yellow", emojis: ["😀", "😁", "😂", "🤣", "😃", "😄", "😅","😍", "😘", "😗", "😙", "😚", "🙂", "🤗", "🤩", "🤔", "🤨", "😐"], numberOfPairsOfCards: 8)




enum themes {
    case sport, hallowen, flag, vehicle, emoji
    
    var theme: Theme {
        switch self {
            case .sport:
                return sportTheme
            case .flag:
                return flagTheme
            case .hallowen:
                return hallowenTheme
            case .vehicle:
                return vehicleTheme
            case .emoji:
                return emojiTheme
        }
    }
}


