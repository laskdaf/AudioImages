//
//  ViewController.swift
//  AudioImages
//
//  Created by Kevin Chang on 6/23/16.
//  Copyright (c) 2016 Kevin Chang. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var soundButton: UIButton!
    @IBOutlet var imageButton1: UIButton!
    @IBOutlet var imageButton2: UIButton!
    @IBOutlet var imageButton3: UIButton!
    @IBOutlet var imageButton4: UIButton!
    @IBOutlet var newGameButton: UIButton!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var instructionLabel: UILabel!
    
    var audioImageArray = [AudioImage]()
    var choicesArray = [-1, -1, -1, -1]
    var answer: Int!
    var count: Int!
    
    var winAudioPlayer = AVAudioPlayer()
    var tryAgainAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let winAudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("gamewin", ofType: "wav")!)
        do {
            winAudioPlayer = try AVAudioPlayer(contentsOfURL: winAudioURL)
        } catch { }
        
        let tryAgainAudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("TryAgain", ofType: "wav")!)
        do {
            tryAgainAudioPlayer = try AVAudioPlayer(contentsOfURL: tryAgainAudioURL)
        } catch { }
        
        getAudioImages()
        initializeRound()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func soundButtonPressed(sender: UIButton) {
        let x = choicesArray[answer]
        audioImageArray[x].playAudio()
    }

    @IBAction func imageButton1Pressed(sender: UIButton) {
        if answer == 0 {
            correct()
        } else {
            imageButton1.setBackgroundImage(nil, forState: UIControlState.Normal)
            imageButton1.setTitle("Opps. Try Again!", forState: UIControlState.Normal)
            tryAgainAudioPlayer.play()
        }
    }
    
    @IBAction func imageButton2Pressed(sender: UIButton) {
        if answer == 1 {
            correct()
        } else {
            imageButton2.setBackgroundImage(nil, forState: UIControlState.Normal)
            imageButton2.setTitle("Opps. Try Again!", forState: UIControlState.Normal)
            tryAgainAudioPlayer.play()
        }
    }
    
    @IBAction func imageButton3Pressed(sender: UIButton) {
        if answer == 2 {
            correct()
        } else {
            imageButton3.setBackgroundImage(nil, forState: UIControlState.Normal)
            imageButton3.setTitle("Opps. Try Again!", forState: UIControlState.Normal)
            tryAgainAudioPlayer.play()
        }
    }
    
    @IBAction func imageButton4Pressed(sender: UIButton) {
        if answer == 3 {
            correct()
        } else {
            imageButton4.setBackgroundImage(nil, forState: UIControlState.Normal)
            imageButton4.setTitle("Opps. Try Again!", forState: UIControlState.Normal)
            tryAgainAudioPlayer.play()
        }
    }
    
    @IBAction func newGameButtonPressed(sender: UIButton) {
        newGame()
    }
    
    
    func getAudioImages() {
        switch category {
        case "animal":
            print("animal")
            audioImageArray.append(AudioImage(imagePath: "bird.jpg", audioPath: "bird"))
            audioImageArray.append(AudioImage(imagePath: "duck.jpg", audioPath: "duck"))
            audioImageArray.append(AudioImage(imagePath: "monkey.jpg", audioPath: "monkey"))
            audioImageArray.append(AudioImage(imagePath: "wolf.jpg", audioPath: "wolf"))
            audioImageArray.append(AudioImage(imagePath: "cat.jpg", audioPath: "cat"))
            audioImageArray.append(AudioImage(imagePath: "dog.jpeg", audioPath: "dog"))
            audioImageArray.append(AudioImage(imagePath: "elephant.jpg", audioPath: "elephant"))
            audioImageArray.append(AudioImage(imagePath: "frog.jpg", audioPath: "frog"))
            audioImageArray.append(AudioImage(imagePath: "horse.jpg", audioPath: "horse"))
            audioImageArray.append(AudioImage(imagePath: "owl.jpg", audioPath: "owl"))
            audioImageArray.append(AudioImage(imagePath: "sheep.jpg", audioPath: "sheep"))
            audioImageArray.append(AudioImage(imagePath: "tiger.jpg", audioPath: "tiger"))

        case "nature":
            print("nature")
            audioImageArray.append(AudioImage(imagePath: "lava.jpg", audioPath: "lava"))
            audioImageArray.append(AudioImage(imagePath: "stream.jpg", audioPath: "stream"))
            audioImageArray.append(AudioImage(imagePath: "thunder.jpg", audioPath: "thunder"))
            audioImageArray.append(AudioImage(imagePath: "fire.jpg", audioPath: "fire"))
            audioImageArray.append(AudioImage(imagePath: "night.jpg", audioPath: "night"))
            audioImageArray.append(AudioImage(imagePath: "rainforest.jpg", audioPath: "rainforest"))
            audioImageArray.append(AudioImage(imagePath: "snowstorm.jpg", audioPath: "snowstorm"))
        case "instrument":
            print("instrument")
            audioImageArray.append(AudioImage(imagePath: "cello.jpg", audioPath: "cello"))
            audioImageArray.append(AudioImage(imagePath: "clarinet.jpeg", audioPath: "clarinet"))
            audioImageArray.append(AudioImage(imagePath: "flute.jpg", audioPath: "flute"))
            audioImageArray.append(AudioImage(imagePath: "guitar.jpg", audioPath: "guitar"))
            audioImageArray.append(AudioImage(imagePath: "marimba.jpg", audioPath: "marimba"))
            audioImageArray.append(AudioImage(imagePath: "piano.jpg", audioPath: "piano"))
            audioImageArray.append(AudioImage(imagePath: "saxophone.jpg", audioPath: "saxophone"))
            audioImageArray.append(AudioImage(imagePath: "timpani.jpg", audioPath: "timpani"))
            audioImageArray.append(AudioImage(imagePath: "triangle.png", audioPath: "triangle"))
            audioImageArray.append(AudioImage(imagePath: "trumpet.jpg", audioPath: "trumpet"))
            audioImageArray.append(AudioImage(imagePath: "violin.png", audioPath: "violin"))
        case "city":
            print("city")
            audioImageArray.append(AudioImage(imagePath: "airplane.jpg", audioPath: "airplane"))
            audioImageArray.append(AudioImage(imagePath: "ambulance.JPG", audioPath: "ambulance"))
            audioImageArray.append(AudioImage(imagePath: "boat.jpg", audioPath: "boat"))
            audioImageArray.append(AudioImage(imagePath: "cafe.jpg", audioPath: "cafe"))
            audioImageArray.append(AudioImage(imagePath: "construction.jpg", audioPath: "construction"))
            audioImageArray.append(AudioImage(imagePath: "court.jpg", audioPath: "court"))
            audioImageArray.append(AudioImage(imagePath: "traffic.jpg", audioPath: "traffic"))
            audioImageArray.append(AudioImage(imagePath: "train.jpg", audioPath: "train"))
        default:
            print("all")
        }
    }
    
    func initializeRound() {
        count = audioImageArray.count
        //print("Number of images left: \(count)")
        var indexTracker = [Bool](count: count, repeatedValue: false)
        for i in 0 ..< 4 {
            var x = Int(arc4random_uniform(UInt32(count)))
            while indexTracker[x] == true {
                x = (x + 1) % count
            }
            indexTracker[x] = true
            choicesArray[i] = x
        }
        
        answer = Int(arc4random_uniform(UInt32(4)))
        print("Answer: \(answer)")
        
        imageButton1.setBackgroundImage(audioImageArray[choicesArray[0]].image, forState: UIControlState.Normal)
        imageButton2.setBackgroundImage(audioImageArray[choicesArray[1]].image, forState: UIControlState.Normal)
        imageButton3.setBackgroundImage(audioImageArray[choicesArray[2]].image, forState: UIControlState.Normal)
        imageButton4.setBackgroundImage(audioImageArray[choicesArray[3]].image, forState: UIControlState.Normal)
        
        while winAudioPlayer.playing { }
        let x = choicesArray[answer]
        audioImageArray[x].playAudio()
    }
    
    func correct() {
        audioImageArray[choicesArray[answer]].stopAudio()
        audioImageArray.removeAtIndex(choicesArray[answer])
        winAudioPlayer.play()
        if count <= 4 {
            //print("game finished.")
            soundButton.hidden = true
            imageButton1.hidden = true
            imageButton2.hidden = true
            imageButton3.hidden = true
            imageButton4.hidden = true
            instructionLabel.hidden = true
            newGameButton.hidden = false
            backButton.hidden = false
        } else {
            initializeRound()
            imageButton1.setTitle("", forState: UIControlState.Normal)
            imageButton2.setTitle("", forState: UIControlState.Normal)
            imageButton3.setTitle("", forState: UIControlState.Normal)
            imageButton4.setTitle("", forState: UIControlState.Normal)
        }
    }
    
    func newGame() {
        audioImageArray = [AudioImage]()
        choicesArray = [-1, -1, -1, -1]
        answer = -1
        count = 0
        getAudioImages()
        initializeRound()
        soundButton.hidden = false
        imageButton1.hidden = false
        imageButton2.hidden = false
        imageButton3.hidden = false
        imageButton4.hidden = false
        instructionLabel.hidden = false
        newGameButton.hidden = true
        backButton.hidden = true
        
        // play sound when round begins, probably after congrats images
    }
}

