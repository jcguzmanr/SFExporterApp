//
//  ContentView.swift
//  SFExporterApp
//
//  Created by jcguzmanr on 2/10/24.
//

import SwiftUI
import TipKit

struct ContentView: View {
    
    @StateObject var colorSelection = ColorSelection()
    @StateObject var symbolSelection = SymbolSelection()
    
    @State private var showingExportOptions = false
    @State private var showingOptions = false
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                SymbolInputView()
                    .environmentObject(colorSelection)
                    .environmentObject(symbolSelection)
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack {
                        ColorInputView()
                            .environmentObject(colorSelection)
                            .environmentObject(symbolSelection)
                        //--TODO
                        AnimationInputView()
                            .padding()
                            .background(.regularMaterial)
                            .cornerRadius(10)
                        
                    }
                }
                
            }
        
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Symbols+")
                    .font(.headline)
                    .fontDesign(.rounded)
                    .fontWeight(.bold)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    showingExportOptions = true
                    print(symbolSelection.name)
                    
                }) {
                    Image(systemName: "square.and.arrow.up").foregroundColor(colorSelection.foregroundColor)
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    showingOptions = true
                }) {
                    Image(systemName: "gear").foregroundColor(colorSelection.foregroundColor)
                }
            }
        }
            
    }
    
    //Sheet Share
        .sheet(isPresented: $showingExportOptions) {
            ExportOptionsView(showingExportOptions: $showingExportOptions)
                .environmentObject(colorSelection)
                .environmentObject(symbolSelection)
        }
    //Sheet Options
        .sheet(isPresented: $showingOptions) {
            SettingsView(showingOptions: $showingOptions)
                .environmentObject(colorSelection)
        }
        .navigationViewStyle(StackNavigationViewStyle())
}


}


#Preview {
    ContentView()
        .task {
            try? Tips.resetDatastore()
            try? Tips.configure([
            ])
        }
}
