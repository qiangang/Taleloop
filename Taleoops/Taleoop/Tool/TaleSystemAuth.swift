//
//  TaleSystemAuth.swift
//  Taleoop
//
//  Created by Ben on 23/5/2025.
//

import Foundation
import UIKit
import AVFoundation
import Photos

public typealias TaleSystemAuthAuthoBlock = () -> (Void)
public typealias TaleZGSystemBlock = () -> (Void)

public enum SystemType : Int {
    
    case microphone
    
    case PhotoAlbum
    
    case Camera
}

public func addSystemAuth(_ authType: SystemType, _ authorizedBlock: @escaping TaleSystemAuthAuthoBlock, _ deniedBlock: @escaping TaleZGSystemBlock) {
    switch authType {
    case .microphone:
        let authStatus:AVAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.audio)
        switch authStatus {
        case .notDetermined:
            DispatchQueue.global(qos: .userInitiated).async {
                AVAudioSession.sharedInstance().requestRecordPermission({ (granted) in
                    DispatchQueue.main.async {
                        if granted {
                            authorizedBlock()
                        } else {
                            deniedBlock()
                        }
                    }
                })
            }
        case .restricted:
            deniedBlock()
        case .denied:
            deniedBlock()
        case .authorized:
            authorizedBlock()
        @unknown default:
            fatalError()
        }
    case .PhotoAlbum:
        let authStatus:PHAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch authStatus {
        case .notDetermined:
            DispatchQueue.global(qos: .userInitiated).async {
                PHPhotoLibrary.requestAuthorization({ (status) in
                    if status == .authorized {
                        authorizedBlock()
                    } else {
                        deniedBlock()
                    }
                })
            }
        case .restricted:
            deniedBlock()
        case .denied:
            deniedBlock()
        case .authorized:
            authorizedBlock()
        case .limited:
            print("")
        @unknown default:
            fatalError()
        }
    case .Camera:
        if AVCaptureDevice.responds(to: #selector(AVCaptureDevice.authorizationStatus(for:))) {
            let authStatus:AVAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
            switch authStatus {
            case .notDetermined:
                DispatchQueue.global(qos: .userInitiated).async {
                    AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (granted) in
                        if granted {
                            authorizedBlock()
                        } else {
                            deniedBlock()
                        }
                    })
                }
            case .restricted:
                deniedBlock()
            case .denied:
                deniedBlock()
            case .authorized:
                authorizedBlock()
            @unknown default:
                fatalError()
            }
        }
    }
}
