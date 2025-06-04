//
//  ScoreView.swift
//  AnimalQuiz
//
//  Created by kmjak on 2025/06/05.
//

import SwiftUI

struct ScoreView: View {
    @State var isShowingContetntView: Bool = false
    
    var body: some View {
        VStack {
            Text("5問中3問正解!")
            Button("トップへ") {
                isShowingContetntView = true
            }
            .fullScreenCover(isPresented: $isShowingContetntView) {
                StartView()
            }
        }
    }
}

#Preview {
    ScoreView()
}
