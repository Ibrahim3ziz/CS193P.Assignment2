//
//  MemorizeView.swift
//  Memorize
//
//  Created by Ibrahim Abdul Aziz on 02/12/2021.
//



import SwiftUI

struct MemorizeView: View {
    // Passing it in the @main everywhere we create MemorizeView 
    @ObservedObject var gameViewModel: EmojiMemoryGame
    @State private var selection = 0
    @State private var theme = EmojiMemoryGame.createMemoryGame(theme: hallowenTheme)
    
    

    
    var body: some View {

        TabView(selection: $selection) {
            NavigationView {
                VStack {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                            ForEach(gameViewModel.cards) { card in
                                CardView(card: card)
                                    .aspectRatio(2/3 ,contentMode: .fit)
                                    .onTapGesture {
                                        gameViewModel.chooseCard(card: card)
                                    }
                                }
                            }
                        }
                        .padding(.bottom)
                    .foregroundColor(gameViewModel.cardColor)
                            
                    VStack() {
                        newGameButton
                        scoreLabel
                        }
                    }
                    .padding(.all)
                    .navigationTitle(emojiTheme.themeName)
                    .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                    Image(systemName: "face.smiling")
                    Text(emojiTheme.themeName)
            }
            .tag(0)


            NavigationView {
                VStack {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                            ForEach(gameViewModel.cards) { card in
                                CardView(card: card)
                                    .aspectRatio(2/3 ,contentMode: .fit)
                                    .onTapGesture {
                                        gameViewModel.chooseCard(card: card)
                                    }
                                }
                            }
                        }
                        .padding(.bottom)
                        .foregroundColor(gameViewModel.cardColor)
                            
                    VStack() {
                        newGameButton
                        scoreLabel
                        }
                    }
                    .padding(.all)
                    .navigationTitle(vehicleTheme.themeName)
                    .navigationBarTitleDisplayMode(.inline)
                }
                .tabItem {
                    Image(systemName: "car")
                    Text(vehicleTheme.themeName)
                }
                .tag(1)
            
            
            NavigationView {
                VStack {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                            ForEach(gameViewModel.cards) { card in
                                CardView(card: card)
                                    .aspectRatio(2/3 ,contentMode: .fit)
                                    .onTapGesture {
                                        gameViewModel.chooseCard(card: card)
                                    }
                                }
                            }
                        }
                        .padding(.bottom)
                        .foregroundColor(gameViewModel.cardColor)
                            
                    VStack() {
                        newGameButton
                        scoreLabel
                        }
                    }
                    .padding(.all)
                    .navigationTitle(sportTheme.themeName)
                    .navigationBarTitleDisplayMode(.inline)
                }
                .tabItem {
                    Image(systemName: "sportscourt")
                    Text(sportTheme.themeName)
                }
                .tag(2)

            
            NavigationView {
                VStack {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                            ForEach(gameViewModel.cards) { card in
                                CardView(card: card)
                                    .aspectRatio(2/3 ,contentMode: .fit)
                                    .onTapGesture {
                                        gameViewModel.chooseCard(card: card)
                                    }
                                }
                            }
                        }
                        .padding(.bottom)
                        .foregroundColor(gameViewModel.cardColor)
                            
                    VStack() {
                        newGameButton
                        scoreLabel
                        }
                    }
                    .padding(.all)
                    .navigationTitle(flagTheme.themeName)
                    .navigationBarTitleDisplayMode(.inline)
                }
                .tabItem {
                        Image(systemName: "flag")
                        Text(flagTheme.themeName)
                    }
                    .tag(3)
            
            
            NavigationView {
                VStack {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                            ForEach(gameViewModel.cards) { card in
                                CardView(card: card)
                                    .aspectRatio(2/3 ,contentMode: .fit)
                                    .onTapGesture {
                                        gameViewModel.chooseCard(card: card)
                                    }
                                }
                            }
                        }
                        .padding(.bottom)
                        .foregroundColor(gameViewModel.cardColor)
                            
                    VStack() {
                        newGameButton
                        scoreLabel
                        }
                    }
                    .padding(.all)
                    .navigationTitle(hallowenTheme.themeName)
                    .navigationBarTitleDisplayMode(.inline)
                }
                .tabItem {
                        Image(systemName: "ladybug")
                        Text(hallowenTheme.themeName)
                    }
                    .tag(4)

        }
        .accentColor(.red)
        

    }
    
    
    
    struct CardView: View {
        let card: MemoryGame<String>.Card
        
        var body: some View {
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 10)

                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3)
                    Text(card.cardContent).font(.largeTitle)
                
                }
                else if card.isMatched {
                    shape.opacity(0)
                }
                else {
                    shape.fill()
                }
            }
            
        }
    }
    
    

    
    var newGameButton: some View {
        Button("NEW GAME") {
            gameViewModel.newGame()
            }
            .frame(width: 300, height: 25, alignment: .center)
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(20)
    }
    
    var scoreLabel: some View {
        Text("SCORE: \(gameViewModel.gameModel.score)")
            .allowsTightening(true)
            .font(.system(size: 25)).scaledToFill()
            .foregroundColor(.white)
            .frame(width: 200, height: 20, alignment: .center)
            .padding()
            .background(Color.blue)
            .cornerRadius(10)
    }
    
    
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        
        MemorizeView(gameViewModel: game)
            .preferredColorScheme(.light)
        
        MemorizeView(gameViewModel: game)
            .preferredColorScheme(.dark)
    }
}
