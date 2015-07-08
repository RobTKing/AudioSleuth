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
    
    func getDataFromAudioFile(audioURL : NSURL) -> NSData? {
        var audioFileRef : ExtAudioFileRef = nil
        let bufferFrames = 4096
        var data = [Float](count: bufferFrames, repeatedValue: 0.0)
        var clientASBD : AudioStreamBasicDescription = ASBDBuilder.build()
        var mutableAudioData : NSMutableData = NSMutableData()
        let (audioBuffer, audioBufferList) = setupBufferAndBufferList(numberOfChannels: 1, dataPointer: &data)
        let audioFileOpenError : OSStatus = ExtAudioFileOpenURL(audioURL, &audioFileRef)
        
        // An error occured during file open, log the error
        if audioFileOpenError != noErr {
            NSLog("Cound not open audio URL, error: %@", audioFileOpenError)
        }
        
        let audioFileSetError = ExtAudioFileSetProperty(audioFileRef, kExtAudioFileProperty_ClientDataFormat, UInt32(sizeofValue(clientASBD)), &clientASBD)
        
        if audioFileSetError != noErr {
            NSLog("Cound not set audio file, error: %@", String(audioFileSetError))
        }
        
        if mutableAudioData.length > 0 {
            let audioData = mutableAudioData
            return audioData
        } else {
            return nil
        }
    }
    
    func setupBufferAndBufferList (numberOfChannels numberOfChannels : Int, dataPointer : UnsafeMutablePointer<[Float]>) -> (audioBuffer : AudioBuffer, audioBufferList : AudioBufferList) {
        
        let audioBuffer = AudioBuffer.init(
            mNumberChannels: UInt32(numberOfChannels),
            mDataByteSize: UInt32(sizeofValue(dataPointer.memory)),
            mData: dataPointer)
        
        // set default number of buffers to 1
        let auidoBufferList = AudioBufferList.init(
            mNumberBuffers: 1,
            mBuffers: audioBuffer
        )
        
        return (audioBuffer, auidoBufferList)
    }
}