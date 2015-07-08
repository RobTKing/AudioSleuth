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
    
    var testAudioDataExtractor : AudioDataExtractor = AudioDataExtractor()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetDataFromAudioFileReturnsNSData() {
        let testBundle = NSBundle(forClass: AudioDataExtractorTests.self)
        if let testAudioFilePath = testBundle.pathForResource("get-cats", ofType: "m4r") {
            var audioFileData : NSData? = testAudioDataExtractor.getDataFromAudioFile(NSURL.fileURLWithPath(testAudioFilePath))
            XCTAssertNotNil(audioFileData, "getDataFromAudioFile returned a nil value. Check getDataFromAudioFile and AudioDataProcessor.processData()")
            
        } else {
            XCTAssertNotNil(nil, "The testAudioFilePath was unable to find get-cats.m4r resource")
        }
    }
}