//
//  AudioImage.swift
//  AudioImages
//
//  Created by Kevin Chang on 6/23/16.
//  Copyright (c) 2016 Kevin Chang. All rights reserved.
//

import UIKit
import AVFoundation

class AudioImage: NSObject {
    
    var image: UIImage!
    var audioURL: NSURL!
    var audioPlayer = AVAudioPlayer()
    
    init(imagePath: String, audioPath: String) {
        self.image = UIImage(named: imagePath)!
        self.audioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(audioPath, ofType: "wav")!)
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOfURL: audioURL)
        } catch { }
    }
    
    func playAudio() {
        print("play audio")
        audioPlayer.play()
    }
    
    func stopAudio() {
        audioPlayer.stop()
    }
}
