//
//  QuizView.swift
//  AnimalQuiz
//
//  Created by kmjak on 2025/06/05.
//

import SwiftUI

struct QuizView: View {
    @State var isShowingScoreView: Bool = false
    
    var body: some View {
        VStack {
            Text("問題番号: 1/5")
            Text("次のうち、世界で最も速く走る動物はどれですか？")
            
            Button("ライオン"){
                isShowingScoreView = true
            }
            .fullScreenCover(isPresented: $isShowingScoreView) {
                ScoreView()
            }
            Button("ウサイン・ボルト"){
                
            }
            Button("チーター"){
                
            }
            Button("馬"){
                
            }
        }
    }
}

#Preview {
    QuizView()
}
