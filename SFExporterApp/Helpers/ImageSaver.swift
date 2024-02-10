//
//  ImageSaver.swift
//  SFExporterApp
//
//  Created by jcguzmanr on 2/14/24.
//

import Foundation
import PhotosUI


//🅰️ Remember to add information to the PLIST (app Settings) about access to the photo library
//Look for key: "Privacy - Photo Library Additions Usage Description"

class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        
        // Convert UIImage to PNG data
        guard let pngData = image.pngData() else { return }
        
        // Request access to the photo library
        PHPhotoLibrary.shared().performChanges({
            // Create a PHAssetCreationRequest for an asset from the image data
            let creationRequest = PHAssetCreationRequest.forAsset()
            // Add the PNG data as the asset's data
            creationRequest.addResource(with: .photo, data: pngData, options: nil)
        }) { success, error in
            if let error = error {
                print("Error saving PNG to photo album: \(error.localizedDescription)")
            } else {
                print("PNG saved successfully!")
            }
        }
        //UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    //@objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
    //  print("Saved!")
    //}
}
