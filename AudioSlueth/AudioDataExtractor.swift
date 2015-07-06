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
        
        let audioBuffer = AudioBuffer.init(
        mNumberChannels: 1,
        mDataByteSize: UInt32(sizeofValue(data)),
        mData: &data)
        
        var clientASBD = AudioStreamBasicDescription.init(
        mSampleRate: 44100,
        mFormatID: kAudioFormatLinearPCM,
        mFormatFlags: kAudioFormatFlagsNativeFloatPacked,
        mBytesPerPacket: UInt32(8 * sizeof(Float)),
        mFramesPerPacket: 1,
        mBytesPerFrame: 1,
        mChannelsPerFrame: UInt32(sizeof(Float)),
        mBitsPerChannel: UInt32(sizeof(Float)),
        mReserved: 0
        )
        
        let audioFileOpenError : OSStatus = ExtAudioFileOpenURL(audioURL, &audioFileRef!)
        
        // An error occured during file open, log the error
        if audioFileOpenError != noErr {
            NSLog("Cound not open audio URL, error: %@", audioFileOpenError)
        }
        
        let audioFileSetError = ExtAudioFileSetProperty(audioFileRef!, kExtAudioFileProperty_ClientDataFormat, UInt32(sizeofValue(clientASBD)), &defaultASBD)
        
        if audioFileSetError != noErr {
            NSLog("Cound not set audio file, error: %@", audioFileSetError)
        }
        
        
    }
}