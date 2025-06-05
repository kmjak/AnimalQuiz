//
//  ScoreView.swift
//  AnimalQuiz
//
//  Created by kmjak on 2025/06/05.
//

import SwiftUI

struct ScoreView: View {
    let scoreText: String

    var body: some View {
        VStack {
            Spacer()

            Text(scoreText)
                .font(.system(size: 40).bold())
                .foregroundStyle(.originalYellow)
                .stroke(color: .originalGreen, width: 5)

            Spacer()

            Button {
                let WindowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                    WindowScene?.windows.first?.rootViewController?.dismiss(animated: true)
            } label: {
                Image(.topButton)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .backgroundImage()
    }
}

#Preview {
    ScoreView(scoreText: "")
}
