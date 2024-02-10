//
//  UserInputView.swift
//  SFExporterApp
//
//  Created by jcguzmanr on 2/10/24.
//

import SwiftUI
import SFSymbolsPicker
import TipKit

struct SymbolInputView: View {
    //MARK: Variables
    @State private var isPresented = false // For presenting the SymbolsPicker sheet
    @EnvironmentObject var colorSelection: ColorSelection
    @EnvironmentObject var symbolSelection: SymbolSelection
    
    //TipKit specific variables
    let onBoardingTip = OnboardingTip()
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                
                Button(action: {
                    onBoardingTip.invalidate(reason: .actionPerformed)
                    isPresented.toggle()
                    
                }) {
                   ExportPreviewImage()
                        .environmentObject(colorSelection)
                        .environmentObject(symbolSelection)
                }
                .popoverTip(onBoardingTip)
                .padding()
                
                .sheet(isPresented: $isPresented, content: {
                    // Use the SymbolsPicker here and bind the selection to the observable object
                    SymbolsPicker(selection: $symbolSelection.name, title: "Select a symbol", autoDismiss: true)
                        .environmentObject(colorSelection)
                        .accentColor(colorSelection.foregroundColor)
                })
            }
            
            Spacer()
            
            
            
        }.padding()
    }
}





#Preview {
    SymbolInputView()
        .environmentObject(ColorSelection())
        .environmentObject(SymbolSelection())
        .task {
            try? Tips.resetDatastore()
            try? Tips.configure([
            ])
        }
}
