//
//  PhotosCollectionViewController.swift
//  RxSwiftTraining
//
//  Created by max on 27.06.2022.
//

import UIKit
import RxSwift
import RxCocoa
import Photos

class PhotosCollectionViewController: UICollectionViewController {
    
    private var selectedPhotoSubject = PublishSubject<UIImage>()
    var selectedPhoto: Observable<UIImage> {
        return selectedPhotoSubject.asObservable()
    }
    
    private var images = [PHAsset]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populatePhotos()
    }
    
    private func populatePhotos() {
        PHPhotoLibrary.requestAuthorization { [weak self] status in
            
            if status == .authorized {
                
                //access pictures
                let assets = PHAsset.fetchAssets(with: .image, options: nil)
                assets.enumerateObjects { object, count, stop in
                    self?.images.append(object)
                }
                
                self?.images.reverse()
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
 
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCollectionViewCell else {
            fatalError()
        }
        let asset = images[indexPath.row]
        PHImageManager.default().requestImage(for: asset, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFill, options: nil) { image, _ in
            DispatchQueue.main.async {
                cell.photoImageView.image = image
            }
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedAsset = images[indexPath.row]
        PHImageManager.default().requestImage(for: selectedAsset, targetSize: CGSize(width: 300, height: 300), contentMode: .aspectFit, options: nil) { [weak self] image, info in
            guard let info = info else { return }
            let isDegradedImage = info["PHImageResultIsDegradedKey"] as! Bool
            if !isDegradedImage {
                if let image = image {
                    self?.selectedPhotoSubject.onNext(image)
                    self?.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
}
