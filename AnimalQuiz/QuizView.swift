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
    @State var currentQuestionIndex: Int = 0
    @State var score = 0
    
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
                Text("問題番号: \(currentQuestionIndex + 1)/5")
                    .font(.headline)
                    .padding(10)
                    .background(.originalGreen)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text(quizItems[currentQuestionIndex].question)
                    .font(.title)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.originalLightGreen)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(.originalGreen, lineWidth: 5))
                    .frame(maxHeight: .infinity)
                
                
                ForEach(quizItems[currentQuestionIndex].choices, id: \.self){ choice in
                    Button{
                        if choice == quizItems[currentQuestionIndex].correctAnswer {
                            isAnswerCorrect = true
                            score += 1
                        }else{
                            isAnswerCorrect = false
                        }
                        isShowResultSymbol = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                            self.isShowResultSymbol = false
                            
                            if self.currentQuestionIndex + 1 == self.quizItems.count {
                                self.isShowingScoreView = true
                                return
                            }
                            
                            self.currentQuestionIndex += 1
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
                        ScoreView(scoreText: "\(quizItems.count)問中\(score)問正解です。")
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
