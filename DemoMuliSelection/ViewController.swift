//
//  ViewController.swift
//  DemoMuliSelection
//
//  Created by Square Infosoft on 18/05/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onClickBtn(_ sender: Any) {
        selectFromLibrary()
    }
    
    func selectFromLibrary(){
        
        var config = YPImagePickerConfiguration()
        // [Edit configuration here ...]
        // Build a picker with your configuration
       
        
        config.isScrollToChangeModesEnabled = true
        config.showsPhotoFilters = false
        config.showsVideoTrimmer = true
        config.shouldSaveNewPicturesToAlbum = true
        config.albumName = "DefaultYPImagePickerAlbumName"
        config.startOnScreen = YPPickerScreen.library
        config.screens = [.library]
        config.showsCrop = .none
        config.targetImageSize = YPImageSize.original
        config.overlayView = UIView()
        config.hidesStatusBar = false
        config.hidesBottomBar = false
        config.hidesCancelButton = false
        config.preferredStatusBarStyle = UIStatusBarStyle.default
        config.maxCameraZoomFactor = 1.0
      
        
        config.library.options = nil
        config.library.onlySquare = false
        config.library.isSquareByDefault = true
        config.library.minWidthForItem = nil
        config.library.mediaType = YPlibraryMediaType.photoAndVideo
        config.library.maxNumberOfItems = 6 //- (selectedImages.count + selectedVideo.count)
        config.library.numberOfItemsInRow = 4
//        config.library.maxNumberOfVideos = 2 //- selectedVideo.count
        config.library.spacingBetweenItems = 1.0
        
        config.library.skipSelectionsGallery = false
        config.library.preselectedItems = []
        config.library.preSelectItemOnMultipleSelection = false
        
        config.video.compression = AVAssetExportPresetHighestQuality
        config.video.fileType = .mov
        config.video.recordingTimeLimit = 30.0
        config.video.libraryTimeLimit = 30.0
        config.video.minimumTimeLimit = 3.0
        config.video.trimmerMaxDuration = 30.0
        config.video.trimmerMinDuration = 3.0
        
        let picker = YPImagePicker(configuration: config)
//        picker.navigationItem.rightBarButtonItem = nil
        picker.didFinishPicking { [unowned picker] items, cancelled in
            if !cancelled {
//                self.setDateFromMedia(media: items.first)
//                for item in items {
//                    switch item {
//                    case let .photo(photo):
//                        self.selectedImages.append(photo.image)
//                    case let .video(video):
//                        self.selectedVideo.append(video)
//                    }
//                }
//                self.changeToPictureViewIfNeeded()
//                self.enableLibraryButtonIfNeeded()
//                self.checkCollectionViewHeight()
//                self.imageCollectionView.reloadData()
            }
            picker.dismiss(animated: true)
        }
        
        present(picker, animated: true)
    }
}

