//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Yelim Kim on 4/12/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    let text: String
    let answerOptions: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answerOptions = a
        self.correctAnswer = correctAnswer
    }
}
