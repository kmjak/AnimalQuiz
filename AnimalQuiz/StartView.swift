//
//  StartView.swift
//  AnimalQuiz
//
//  Created by kmjak on 2025/06/04.
//

import SwiftUI

struct StartView: View {
    @State var isShowingQuizView: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("どうぶつ\nクイズ！")
                .font(.system(size: 70).bold())
                .foregroundStyle(.originalYellow)
                .stroke(color: .originalGreen, width: 5)
            
            Spacer()
            
            Button {
                isShowingQuizView = true
            } label: {
                Image(.startButton)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
            }
            .fullScreenCover(isPresented: $isShowingQuizView) {
                QuizView()
            }

        }
        .padding()
        .backgroundImage()
    }
}

#Preview {
    StartView()
}
