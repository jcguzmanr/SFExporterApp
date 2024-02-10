//
//  AnimationInputView.swift
//  SFExporterApp
//
//  Created by jcguzmanr on 2/15/24.
//

import SwiftUI

struct AnimationInputView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text("Animation")
                    .font(.headline)
                    .fontDesign(.rounded)
            }
            Divider()
            HStack {
                        // Charge Button
                        Button(action: {
                            // Perform charge action
                        }) {
                            Label("Bounce", systemImage: "target")
                        }
                        .buttonStyle(PillButtonStyle(backgroundColor: .purple))

                        // Praise Button
                        Button(action: {
                            // Perform praise action
                        }) {
                            Label("Scale", systemImage: "square.resize")
                        }
                        .buttonStyle(PillButtonStyle(backgroundColor: .purple))

                        // Debug Button
                        Button(action: {
                            // Perform debug action
                        }) {
                            Label("Pulse", systemImage: "eye.fill")
                        }
                        .buttonStyle(PillButtonStyle(backgroundColor: .purple))
            }.fontDesign(.rounded).fontWeight(.bold)
        }
       
    }
}


// Custom pill-shaped button style
struct PillButtonStyle: ButtonStyle {
    var backgroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .frame(height: 30)
            .font(.caption2)
            .background(backgroundColor)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    AnimationInputView()
}
