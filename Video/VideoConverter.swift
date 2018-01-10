//
//  VideoConvertor.swift
//  DemoSwiftyCam
//
//  Created by Yun CHEN on 2018/1/10.
//  Copyright © 2018年 Cappsule. All rights reserved.
//

import UIKit
import AVFoundation

class VideoConverter: Any {

    func convertMovToMp4(urlOfMovFile:URL) {
        let avAsset = AVURLAsset(url: urlOfMovFile)
        let compatiblePresets = AVAssetExportSession.exportPresets(compatibleWith: avAsset)
        
        let quality = AVAssetExportPresetMediumQuality //Choose Quality
        if compatiblePresets.contains(quality) {
            if let exportSession = AVAssetExportSession(asset: avAsset, presetName: quality) {
                let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
                let path = documentsPath + (NSString(format: "/%ld_compressedVideo.mp4", Date().timeIntervalSince1970) as String)
                
                exportSession.outputURL = URL(fileURLWithPath: path)
                exportSession.outputFileType = AVFileTypeMPEG4
                exportSession.shouldOptimizeForNetworkUse = true
                exportSession.exportAsynchronously {
                    if exportSession.status == .completed {
                        let mp4FileData = NSData(contentsOf: URL(fileURLWithPath: path))
                        print("mp4 file length:\(String(describing: mp4FileData?.length))")
                    }
                    else if (exportSession.error != nil) {
                        print("video converting error:\(exportSession.error!.localizedDescription)")
                    }
                }
            }
        }
    }
    
}
