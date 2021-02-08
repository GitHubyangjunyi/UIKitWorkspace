//
//  ViewController.swift
//  PhotoKit
//
//  Created by 杨俊艺 on 2020/11/14.
//

import UIKit
import Photos

class ViewController: UIViewController, PHPhotoLibraryChangeObserver {

    
    
    var collectionResult: PHFetchResult<PHAssetCollection>?
    var collectionAssetResults = [PHAsset]()
    var momentDateFormatter: DateFormatter = {
        let formatter = DateFormatter.init()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        PHPhotoLibrary.requestAuthorization { (status) in
            if status == .authorized {
                self.loadAssetCollectionsForDisplay()
            } else {
                DispatchQueue.main.async {
                    let alertController = UIAlertController.init(title: "NOT AUTH", message: "xxxx", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        
        
    }

    func loadAssetCollectionsForDisplay() {
        PHPhotoLibrary.shared().register(self)
        
        let options = PHFetchOptions.init()
        options.sortDescriptors = [NSSortDescriptor.init(key: "startDate", ascending: true)]
        
        self.collectionResult = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: options)
        
        collectionResult?.enumerateObjects({ (collection, index, _) in
            let result = PHAsset.fetchAssets(in: collection, options: nil)
            
            
        })
        
        
    }
    
    
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        
    }
    
    deinit {
        PHPhotoLibrary.shared().unregisterChangeObserver(self)
    }

}

