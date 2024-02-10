//
//  ColorSelection.swift
//  SFExporterApp
//
//  Created by jcguzmanr on 2/10/24.
//

import Foundation
import Combine
import SwiftUI

class ColorSelection: ObservableObject {
    
    @Published var foregroundColor: Color = .green
    @Published var backgroundColor: Color = .clear
}
