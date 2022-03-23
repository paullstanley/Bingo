//
//  ContentView.swift
//  Bingo
//
//  Created by Paull Stanley on 3/11/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: BingoCardContent
    
    var body: some View {
        ScrollView {
            HStack {
                Text("B").font(.largeTitle).padding(.horizontal, 45)
                
                Text("E").font(.largeTitle)
                Spacer(minLength: 45)
                Text("T").font(.largeTitle)
                
                Text("H").font(.largeTitle).padding(.horizontal, 45)
            }

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.bingoCards) { bingoCard in
                    BingoCardView(bingoCard: bingoCard).aspectRatio(1, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(bingoCard)
                        }
                }
            }
            .foregroundColor(.green)
            .padding(.horizontal)
            
            Button("New Game") {
                viewModel.resetGame()
            }
        }
    }
}


struct BingoCardView: View {
    let bingoCard: BingoGame<String>.BingoCard
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 5)
        ZStack {
            if bingoCard.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3).overlay(Text(bingoCard.content).foregroundColor(.black).minimumScaleFactor(0.1).padding(8))
            } else {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3).overlay(Text(bingoCard.content).foregroundColor(.black).minimumScaleFactor(0.1).padding(8))
                shape.strokeBorder(lineWidth: 3).overlay(Text("❌").font(.largeTitle).opacity(0.5))
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
