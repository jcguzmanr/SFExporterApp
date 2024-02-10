import SwiftUI

struct ExportOptionsView: View {
    //MARK: Variables
    @Binding var showingExportOptions: Bool
    
    @EnvironmentObject var colorSelection: ColorSelection
    @EnvironmentObject var symbolSelection: SymbolSelection
    
    @State private var selectedSizeIndex: Int = 0
    @State private var includeBackground: Bool = false
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                ExportPreviewImage()
                    .environmentObject(colorSelection)
                    .environmentObject(symbolSelection)
                Spacer()
                
                //
                List{
                    Section(header: Text("Options").font(.headline)) {
                        Toggle(isOn: $includeBackground) {
                            Text("Transparent PNG")
                                .padding()
                        }
                        .onChange(of: includeBackground) { newValue in
                            // Update colorSelection.backgroundColor based on the includeBackground toggle
                            colorSelection.backgroundColor = newValue ? .clear : colorSelection.foregroundColor // Set to transparent or default color
                        }
                        
                    }
                }
                
                
                
                HStack {
                    Button("Save Image") {
                        let renderer = ImageRenderer(content: ExportPreviewImage()
                            .environmentObject(colorSelection)
                            .environmentObject(symbolSelection))
                        
                        // Use includeBackground to control transparency
                        renderer.isOpaque = !includeBackground // Invert includeBackground for correct transparency behavior
                        //colorSelection.backgroundColor = transparent
                        
                        if let image = renderer.uiImage {
                            let resizedImage = image.resizedImage(with: CGSize(width: image.size.width, height: image.size.height))
                            
                            let imageSaver = ImageSaver()
                            imageSaver.writeToPhotoAlbum(image: resizedImage)
                        }
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(colorSelection.foregroundColor) // Use the selected foreground color
                    
                }
                
                
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Preview")
                        .font(.headline)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingExportOptions = false
                    }) {
                        Text("Done")
                            .foregroundStyle(colorSelection.foregroundColor)
                    }
                }
            }
        }
    }
}


extension UIImage {
    func resizedImage(with size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        draw(in: CGRect(origin: .zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return resizedImage
    }
}

#Preview {
    ExportOptionsView(showingExportOptions: .constant(false))
        .environmentObject(ColorSelection())
        .environmentObject(SymbolSelection())
}
