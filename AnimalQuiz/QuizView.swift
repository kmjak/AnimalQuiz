//
//  QuizView.swift
//  AnimalQuiz
//
//  Created by kmjak on 2025/06/05.
//

import SwiftUI

struct QuizItem {
    let question: String
    var choices: [String]
    let correctAnswer: String
}

struct QuizView: View {
    @State var isShowingScoreView: Bool = false
    @State var isShowResultSymbol: Bool = false
    @State var isAnswerCorrect: Bool = false
    
    let quizItems = [
        QuizItem(
            question: "次のうち、世界で最も速く走る動物はどれですか？",
            choices: ["チーター", "ライオン", "ウサイン・ボルト", "馬"],
            correctAnswer: "チーター"
        ),
        QuizItem(
            question: "次のうち、飛ぶことができない鳥はどれですか？",
            choices: ["ペンギン", "フクロウ", "ハト", "スズメ"],
            correctAnswer: "ペンギン"
        ),
        QuizItem(
            question: "次のうち、哺乳類でない動物はどれですか？",
            choices: ["イルカ", "カメ", "コウモリ", "ヒト"],
            correctAnswer: "カメ"
        ),
        QuizItem(
            question: "次のうち、夜行性でない動物はどれですか？",
            choices: ["ライオン", "コアラ", "ゾウ", "フクロウ"],
            correctAnswer: "ゾウ"
        ),
        QuizItem(
            question: "次のうち、最も長い首を持つ動物はどれですか？",
            choices: ["キリン", "アルパカ", "象", "馬"],
            correctAnswer: "キリン"
        )
    ]

    var body: some View {
        ZStack{
            VStack {
                Text("問題番号: 1/5")
                    .font(.headline)
                    .padding(10)
                    .background(.originalGreen)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text(quizItems[0].question)
                    .font(.title)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.originalLightGreen)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(.originalGreen, lineWidth: 5))
                    .frame(maxHeight: .infinity)
                
                
                ForEach(quizItems[0].choices, id: \.self){ choice in
                    Button{
                        isAnswerCorrect = (choice == quizItems[0].correctAnswer)
                        isShowResultSymbol = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                            self.isShowResultSymbol = false
                        }
                    } label: {
                        Text(choice)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .font(.title.bold())
                            .background(.originalSkin)
                            .foregroundStyle(.originalBrown)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .fullScreenCover(isPresented: $isShowingScoreView) {
                        ScoreView()
                    }
                }
            }
            .padding()
            
            if isShowResultSymbol {
                GeometryReader { geometry in
                    Text(isAnswerCorrect ? "○" : "X")
                        .font(.system(size: min(geometry.size.width, geometry.size.height) * 0.8))
                        .foregroundStyle(isAnswerCorrect ? .green : .red)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.black.opacity(0.5))
                    
                }
            }
        }
        .backgroundImage()
    }
}

#Preview {
    QuizView()
}
