//
//  SettingsView.swift
//  SFExporterApp
//
//  Created by jcguzmanr on 2/14/24.
//

import SwiftUI

struct SettingsView: View {
    //MARK: --Variables
    @Binding var showingOptions: Bool
    @EnvironmentObject var colorSelection: ColorSelection
    
    //MARK: --Body
    var body: some View {
        NavigationView {
            VStack {
                Image("Icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 250)
                                .cornerRadius(25)
                
                // Texto en la parte inferior
                            Text("Mentat (c) - 2024\nV")
                                .font(.caption)
                                .padding(
                                )
                
                NavigationStack {
                    List{
                        
                        Section(header: Text("Support").font(.headline)) {
                            NavigationLink(destination: Text("Bug Report")) {
                                SettingRow(iconName: "ant.fill", title:"Bug Report")
                            }
                            
                            NavigationLink(destination: Text("Feature Request")) {
                                SettingRow(iconName: "paperplane.fill", title:"Feature Request")
                            }
                        }
                        
                        Section(header: Text("Legal").font(.headline)) {
                            NavigationLink(destination: Text("Privacy Policy")) {
                                SettingRow(iconName: "lock.fill", title:"Privacy Policy")
                            }
                            
                            NavigationLink(destination: Text("Terms of Use")) {
                                SettingRow(iconName: "doc.fill", title:"Terms of Use")
                            }
                        }
                        
                        
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Settings")
                            .font(.headline)
                            .foregroundColor(.primary)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showingOptions = false
                        }) {
                            Text("Done")
                                .foregroundStyle(colorSelection.foregroundColor)
                        }
                    }
                }
                
                
                
                
        
            }
        }
    }
}

struct SettingRow: View {
    let iconName: String
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
            Text(title)
            Spacer()
            // Añade aquí condiciones o vistas adicionales según sea necesario
        }
    }
}

#Preview {
    SettingsView(showingOptions: .constant(true))
        .environmentObject(ColorSelection())
}
