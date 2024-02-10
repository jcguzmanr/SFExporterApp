//
//  ColorInputView.swift
//  SFExporterApp
//
//  Created by jcguzmanr on 2/14/24.
//

import SwiftUI

struct ColorInputView: View {
    @EnvironmentObject var colorSelection: ColorSelection
    @EnvironmentObject var symbolSelection: SymbolSelection
    
    @Environment(\.colorScheme) var colorScheme

    
    var body: some View {
        let colors: [Color] = colorScheme == .dark ? [.white, .black] : [.black, .white]

        HStack {
            ColorPickerView(title: "Color", colors: colors, selectedColor: $colorSelection.foregroundColor)
                .padding()
                .background(.regularMaterial)
                .cornerRadius(10)
            ColorPickerView(title: "Background", colors: colors, selectedColor: $colorSelection.backgroundColor)
                .padding()
                .background(.regularMaterial)
                .cornerRadius(10)
        }
    }
}

struct ColorPickerView: View {
    var title: String
    var colors: [Color]
    @Binding var selectedColor: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .fontDesign(.rounded)
                    .font(.headline)
                    
            }
            Divider()
            HStack {
                ForEach(colors, id: \.self) { color in
                    Circle()
                        .fill(color)
                        .frame(width: 30, height: 30)
                    
                        .onTapGesture {
                            self.selectedColor = color
                            
                        }
                }
                // Standard ColorPicker as the last item in the HStack within ScrollView
                ColorPicker("Select a color", selection: $selectedColor, supportsOpacity: true)
                    .labelsHidden() // Hides the label of the ColorPicker
                    .frame(width: 30, height: 30)
                    .padding(.horizontal, 4) // Add some spacing around the ColorPicker
                    .environmentObject(ColorSelection())
            }            
        }
    }
}

#Preview {
    ColorInputView()
        .environmentObject(ColorSelection())
        .environmentObject(SymbolSelection())
}

