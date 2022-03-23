//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    

    var storyBrain: StoryBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyLabel.text = storyBrain.stories[0].title
        
        choice1Button.setTitle(storyBrain.stories[0].choice1, for: .normal)
        choice1Button.titleLabel?.numberOfLines = 0
        choice2Button.setTitle(storyBrain.stories[0].choice2, for: .normal)
        choice2Button.titleLabel?.numberOfLines = 0

    }
    
    @IBAction func choiceMade(_ sender: UIButton) {
//        if sender.currentTitle == example[0].choice1 {
//            updateUI(index: 1)
//
//        } else {
//            updateUI(index: 2)
//
//        }
        let nextStory = storyBrain.nextStory(userChoice: sender.currentTitle!)
        updateUI(nextStory: nextStory)
    }
    
    func updateUI(nextStory: Story) {
        storyLabel.text = nextStory.title
        choice1Button.setTitle(nextStory.choice1, for: .normal)
        choice2Button.setTitle(nextStory.choice2, for: .normal)
    }
}

