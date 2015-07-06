//
//  ASBDBuilder.swift
//  AudioSleuth
//
//  Created by Robert King on 7/6/15.
//  Copyright © 2015 AppTreats. All rights reserved.
//

import Foundation
import AVFoundation

struct ASBDBuilder {
    
    // Default build with 44100 sampleRate, Mono-Channel auidio, LinearPCM format
    static func build() -> AudioStreamBasicDescription {
        let defaultASBD = AudioStreamBasicDescription.init(
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
        return defaultASBD
    }
}