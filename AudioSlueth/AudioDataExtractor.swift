//
//  AudioDataExtractor.swift
//  AudioSlueth
//
//  Created by Robert King on 7/3/15.
//  Copyright © 2015 AppTreats. All rights reserved.
//

import Foundation
import AVFoundation

struct AudioDataExtractor {
    
    // Properties for Audio
    var error : NSError?
    var audioFileRef : UnsafeMutablePointer<ExtAudioFileRef>?
    let bytesPerPacket : Int = Int(sizeof(Float)) * Int(CHAR_BIT)
    
    let clientASBD : AudioStreamBasicDescription = AudioStreamBasicDescription.init(
        44100,
        kAudioFormatLinearPCM,
        kAudioFormatFlagsNativeFloatPacked,
        Int(sizeof(Float)) * Int(CHAR_BIT),
        1,
        1,
        sizeof(Float),
        sizeof(Float),
        0
    )
    
    func getDataFromAudioFile(audioURL : NSURL) {
        let audioFileOpenError : OSStatus = ExtAudioFileOpenURL(audioURL, audioFileRef!)
        
        // An error occured during file open, log the error
        if audioFileOpenError != noErr {
            NSLog("Cound not open audio URL, error: %@", audioFileOpenError)
        }
    }
    
    
}