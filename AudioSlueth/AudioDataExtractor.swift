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
        var defaultASBD = createASBD()
        let bufferFrames = 4096
        var data = [Float](count: bufferFrames, repeatedValue: 0.0)
        
        let audioBuffer = AudioBuffer.init(
        mNumberChannels: 1,
        mDataByteSize: UInt32(sizeofValue(data)),
        mData: &data)
        
        let audioFileOpenError : OSStatus = ExtAudioFileOpenURL(audioURL, &audioFileRef!)
        
        // An error occured during file open, log the error
        if audioFileOpenError != noErr {
            NSLog("Cound not open audio URL, error: %@", audioFileOpenError)
        }
        
        let audioFileSetError = ExtAudioFileSetProperty(audioFileRef!, kExtAudioFileProperty_ClientDataFormat, UInt32(sizeofValue(defaultASBD)), &defaultASBD)
        
        if audioFileSetError != noErr {
            NSLog("Cound not set audio file, error: %@", audioFileSetError)
        }
        
        
    }
    
    // This is the default AudioStreamBasicDescription Builder
    func createASBD() -> AudioStreamBasicDescription {
        var clientASBD : AudioStreamBasicDescription = AudioStreamBasicDescription()
        clientASBD.mSampleRate = 44100
        clientASBD.mFormatID = kAudioFormatLinearPCM
        clientASBD.mFormatFlags = kAudioFormatFlagsNativeFloatPacked
        clientASBD.mBitsPerChannel = UInt32(8 * sizeof(Float))
        clientASBD.mChannelsPerFrame = 1
        clientASBD.mFramesPerPacket = 1
        clientASBD.mBytesPerFrame = UInt32(sizeof(Float))
        clientASBD.mBytesPerPacket = UInt32(sizeof(Float))
        clientASBD.mReserved = 0
        
        return clientASBD
    }
    
}