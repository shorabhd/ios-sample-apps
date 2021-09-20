//
//  Question.swift
//  Quizzler
//
//  Created by Shorabh Dhandharia on 9/20/21.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    let questionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}

