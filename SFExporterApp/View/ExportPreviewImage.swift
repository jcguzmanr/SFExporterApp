//
//  ExportPreviewImage.swift
//  SFExporterApp
//
//  Created by jcguzmanr on 2/14/24.
//

import SwiftUI

struct ExportPreviewImage: View {
    
    //MARK: Variables
    @EnvironmentObject var colorSelection: ColorSelection
    @EnvironmentObject var symbolSelection: SymbolSelection
    
    
    var body: some View {
        VStack {
            Image(systemName: symbolSelection.name)
                .font(.system(size: 250))
                .symbolEffect(.bounce, value: 1)
                .foregroundColor(colorSelection.foregroundColor)
                .background(
                    Rectangle()
                        .fill(colorSelection.backgroundColor)
                        .cornerRadius(25)
              )
        }
    }
}
                    
        #Preview {
            ExportPreviewImage()
                .environmentObject(ColorSelection())
                .environmentObject(SymbolSelection())
        }
