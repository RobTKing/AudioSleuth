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
    
    func getDataFromAudioFile(audioURL : NSURL) {
        var audioFileRef : ExtAudioFileRef?
        let bufferFrames = 4096
        var data = [Float](count: bufferFrames, repeatedValue: 0.0)
        
        // Setting defualt # of channels to 1
        let audioBuffer = AudioBuffer.init(
        mNumberChannels: 1,
        mDataByteSize: UInt32(sizeofValue(data)),
        mData: &data)
        
        var clientASBD = ASBDBuilder.build()
        let audioFileOpenError : OSStatus = ExtAudioFileOpenURL(audioURL, &audioFileRef!)
        
        // An error occured during file open, log the error
        if audioFileOpenError != noErr {
            NSLog("Cound not open audio URL, error: %@", audioFileOpenError)
        }
        
        let audioFileSetError = ExtAudioFileSetProperty(audioFileRef!, kExtAudioFileProperty_ClientDataFormat, UInt32(sizeofValue(clientASBD)), &clientASBD)
        
        if audioFileSetError != noErr {
            NSLog("Cound not set audio file, error: %@", audioFileSetError)
        }
        
        
    }
}