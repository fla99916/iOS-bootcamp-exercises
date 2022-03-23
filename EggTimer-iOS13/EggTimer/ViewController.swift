//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    /*
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
     */
    let eggTime = ["Soft":3, "Medium":4, "Hard":7]
    var secondsPaased = 0
    var timer = Timer()
    var totalCounter = -1
    var player: AVAudioPlayer?
    
    @IBOutlet weak var timeInProgress: UIProgressView!
    @IBOutlet weak var labelText: UILabel!
    
    @IBAction func keyPressed(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        timeInProgress.progress=0
        secondsPaased=0
        labelText.text = hardness
        //print(hardness)
        /*
        if hardness == "Soft" {
            print(softTime)
        } else if hardness == "Medium" {
            print(mediumTime)
        } else {
            print(hardTime)
        }
        */
        
//         switch hardness {
//            case "Soft" :
//             print(eggTime["Soft"]!)
//            case "Medium":
//             print(eggTime["Medium"]!)
//            case "Hard":
//             print(eggTime["Hard"]!)
//            default:
//             print("Error")
//         }
         
        totalCounter = eggTime[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
 

    }
    @objc func timerAction(){
        if secondsPaased < totalCounter {
            secondsPaased += 1
            timeInProgress.progress = (Float(secondsPaased)/Float(totalCounter))
        } else {
            timer.invalidate()
            labelText.text = "DONE!"
            playSound()
            secondsPaased = 0
        }

    }

        //When inserts a key that doesn't exist in the dict, the value will be null. It is necessary to unwrap the value
        
        /**
         Ranges:
         a...b
         a..<b
            
         */
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
     
}
