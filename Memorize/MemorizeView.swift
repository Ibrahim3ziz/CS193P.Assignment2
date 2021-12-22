//
//  MemorizeView.swift
//  Memorize
//
//  Created by Ibrahim Abdul Aziz on 02/12/2021.
//



import SwiftUI

struct MemorizeView: View {
    // Passing it in the @main everywhere we create MemorizeView 
    @ObservedObject var gameViewModel: EmojiMemoryGameVM
    @State private var selection = 0
    
    @State private(set) var theme = emojiTheme
    
    private var choosenTheme: Theme {
        if selection == 0 {
            EmojiMemoryGameVM.theme = emojiTheme
        }
        else if selection == 1 {
            EmojiMemoryGameVM.theme = vehicleTheme
            }
        else if selection == 2 {
            EmojiMemoryGameVM.theme = sportTheme
        }
        else if selection == 3 {
            EmojiMemoryGameVM.theme = flagTheme
        }
        else if selection == 4 {
            EmojiMemoryGameVM.theme = hallowenTheme
        }
        return theme
    }
 


    

    
    var body: some View {

        TabView(selection: $selection) {
            NavigationView {
                VStack {
                    EmojiScrollView(gameVM: gameViewModel, theme: choosenTheme)
                    HStack {
                        newGameButton
                        scoreLabel
                        }
                        .padding()
                    }
                    .navigationTitle(emojiTheme.themeName)
                    .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                    Image(systemName: "face.smiling")
                    Text(emojiTheme.themeName)
            }
            .onAppear() { gameViewModel.newGame() }
            .tag(0)
            


            NavigationView {
                VStack {
                    EmojiScrollView(gameVM: gameViewModel, theme: vehicleTheme)
                    VStack() {
                        newGameButton
                        scoreLabel
                        }
                    }
                    .navigationTitle(vehicleTheme.themeName)
                    .navigationBarTitleDisplayMode(.inline)
                }
                .tabItem {
                    Image(systemName: "car")
                    Text(vehicleTheme.themeName)
                }
                .onAppear() { gameViewModel.newGame() }
                .tag(1)
            
            
            NavigationView {
                VStack {
                    EmojiScrollView(gameVM: gameViewModel, theme: choosenTheme)
                    VStack {
                        newGameButton
                        scoreLabel
                        }
                    }
                    .navigationTitle(sportTheme.themeName)
                    .navigationBarTitleDisplayMode(.inline)
                }
                .tabItem {
                    Image(systemName: "sportscourt")
                    Text(sportTheme.themeName)
                }
                .onAppear() { gameViewModel.newGame() }
                .tag(2)

            
            NavigationView {
                VStack {
                    EmojiScrollView(gameVM: gameViewModel, theme: choosenTheme)
                    VStack {
                        newGameButton
                        scoreLabel
                        }
                    }
                    .navigationTitle(flagTheme.themeName)
                    .navigationBarTitleDisplayMode(.inline)
                }
                .tabItem {
                        Image(systemName: "flag")
                        Text(flagTheme.themeName)
                    }
                    .onAppear() { gameViewModel.newGame() }
                    .tag(3)
            
            
            NavigationView {
                VStack {
                    EmojiScrollView(gameVM: gameViewModel, theme: choosenTheme)
                    VStack {
                        newGameButton
                        scoreLabel
                        }
                    }
                    .navigationTitle(hallowenTheme.themeName)
                    .navigationBarTitleDisplayMode(.inline)
                }
                .tabItem {
                        Image(systemName: "ladybug")
                        Text(hallowenTheme.themeName)
                    }
                    .onAppear() { gameViewModel.newGame() }
                    .tag(4)

        }
        .accentColor(.red)
        

    }
    
    
    
 

    
    var newGameButton: some View {
            Button(action: {
                gameViewModel.newGame()
            }, label: {
                Text("NEW GAME")
            })
            .frame(width: 150, height: 20, alignment: .center)
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(10)
    }
    
    
    var scoreLabel: some View {
            Text("SCORE: \(gameViewModel.gameModel.score)")
                .allowsTightening(true)
                .font(.system(size: 25)).scaledToFill()
                .foregroundColor(.white)
                .frame(width: 150, height: 20, alignment: .center)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
    }
}




struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)

                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Pie(startAngle: Angle(degrees: 0-90), endAndle: Angle(degrees: 120-90))
                        .padding(4).opacity(0.5)
                    Text(card.cardContent).font(font(in: geometry.size))
                
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
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.7
    }
}






struct EmojiScrollView: View {
    @ObservedObject var gameVM: EmojiMemoryGameVM
     var theme = EmojiMemoryGameVM.theme
    
    var body: some View {
        AspectVGrid(items: gameVM.cards, aspectRatio: 2/3) { card in
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            } else {
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        gameVM.chooseCard(card: card)
                    }
                }
            }
            .foregroundColor(gameVM.cardColor)
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGameVM()
        game.chooseCard(card: game.cards.first!)
        return MemorizeView(gameViewModel: game, theme: sportTheme)
                .preferredColorScheme(.light)
        
//        MemorizeView(gameViewModel: game, theme: vehicleTheme)
//            .preferredColorScheme(.dark)
    }
}
