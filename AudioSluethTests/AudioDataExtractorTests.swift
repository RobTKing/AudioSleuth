//
//  AudioDataExtractorTests.swift
//  AudioSlueth
//
//  Created by Robert King on 7/3/15.
//  Copyright © 2015 AppTreats. All rights reserved.
//

import XCTest
import Foundation
import AVFoundation
@testable import AudioSlueth

class AudioDataExtractorTests: XCTestCase {
    
    var testAudioDataExtractor : AudioDataExtractor?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreateASBDReturnsADefualtAudioSteamBasicDescription() {
        testAudioDataExtractor = AudioDataExtractor()
        let testASBD = testAudioDataExtractor?.createASBD()
        XCTAssertEqual(testASBD!.mSampleRate, 44100, "The default sample rate should be 44100 frames per second")
    }
}
