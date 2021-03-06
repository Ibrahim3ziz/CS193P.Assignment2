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




let sportTheme = Theme(themeName: "SPORTS", cardColor: "green", emojis: ["๐", "๐ฑ", "๐", "โฝ๏ธ", "๐", "๐", "๐พ", "๐ฅ", "๐ฅ", "๐", "๐", "๐ฅ", "๐ฅ", "๐", "๐โโ๏ธ", "๐งโโ๏ธ", "๐ดโโ๏ธ", "๐ฎ"], numberOfPairsOfCards: 6)

let hallowenTheme = Theme(themeName: "HALLOWEN", cardColor: "red", emojis: ["๐", "๐ป", "๐ฝ", "๐ง", "๐ง", "๐ง", "๐ฆ", "๐ท", "๐ธ", "๐ธ", "๐", "๐ญ","๐ก", "โฐ"], numberOfPairsOfCards: 8)

let flagTheme = Theme(themeName: "FLAGS", cardColor: "black", emojis: ["๐ฆ๐บ", "๐ฆ๐ท", "๐ฉ๐ฟ", "๐ณ๏ธ", "๐ด", "๐ช๐ฌ", "๐", "๐ฏ๐ต", "๐ฑ๐ง", "๐ง๐ฉ", "๐ง๐ช", "๐ดโโ ๏ธ", "๐จ๐ฟ", "๐ณ๐ซ"], numberOfPairsOfCards: 10)

let vehicleTheme = Theme(themeName: "VEHICLES", cardColor: "blue", emojis: ["๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "โ๏ธ", "๐", "๐", "๐ณ", "โด", "๐ข"], numberOfPairsOfCards: 12)

let emojiTheme = Theme(themeName: "EMjOJIS", cardColor: "yellow", emojis: ["๐", "๐", "๐", "๐คฃ", "๐", "๐", "๐","๐", "๐", "๐", "๐", "๐", "๐", "๐ค", "๐คฉ", "๐ค", "๐คจ", "๐"], numberOfPairsOfCards: 14)





