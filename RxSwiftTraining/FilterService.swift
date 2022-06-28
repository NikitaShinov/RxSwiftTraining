//
//  FilterService.swift
//  RxSwiftTraining
//
//  Created by max on 28.06.2022.
//

import UIKit
import CoreImage
import RxSwift

class FilterService {
    
    private var context: CIContext
    
    init() {
        self.context = CIContext()
    }
    
    func applyFilter(to inputImage: UIImage) -> Observable<UIImage> {
        
        return Observable<UIImage>.create { observer in
            
            self.applyFilter(to: inputImage) { filteredImage in
                observer.onNext(filteredImage)
            }
            
            return Disposables.create()
            
        }
    }
    
    private func applyFilter(to inputImage: UIImage, completion: @escaping((UIImage) -> Void)) {
        
        guard let filter = CIFilter(name: "CICMYKHalftone") else { return }
        filter.setValue(5.0, forKey: kCIInputWidthKey)
        
        guard let sourceImage = CIImage(image: inputImage) else { return }
        
        filter.setValue(sourceImage, forKey: kCIInputImageKey)
        if let cgImage = self.context.createCGImage(filter.outputImage!, from: filter.outputImage!.extent) {
            
            let processedImage = UIImage(cgImage: cgImage, scale: inputImage.scale, orientation: inputImage.imageOrientation)
            completion(processedImage)
        }
        
    }
}
