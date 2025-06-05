//
//  QuizView.swift
//  AnimalQuiz
//
//  Created by kmjak on 2025/06/05.
//

import SwiftUI

struct QuizView: View {
    @State var isShowingScoreView: Bool = false
    let choices = [
        "ライオン",
        "ウサインボルト",
        "チーター",
        "馬"
    ]

    var body: some View {
        VStack {
            Text("問題番号: 1/5")
                .font(.headline)
                .padding(10)
                .background(.originalGreen)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text("次のうち、世界で最も速く走る動物はどれですか？")
                .font(.title)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.originalLightGreen)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(.originalGreen, lineWidth: 5))
                .frame(maxHeight: .infinity)
            
            
            ForEach(choices, id: \.self){ choice in
                Button(choice){
                    isShowingScoreView = true
                }
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title.bold())
                .background(.originalSkin)
                .foregroundStyle(.originalBrown)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .fullScreenCover(isPresented: $isShowingScoreView) {
                    ScoreView()
                }
            }
        }
        .padding()
        .backgroundImage()
    }
}

#Preview {
    QuizView()
}
