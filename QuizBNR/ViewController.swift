//
//  ViewController.swift
//  QuizBNR
//
//  Created by Anatoliy Chernyuk on 12/22/17.
//  Copyright © 2017 Anatoliy Chernyuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak  var questionLabel: UILabel!
    
    var currentQuestionIndex: Int = 0
    
    let questions = [
        "What is 7+7?",
        "What is the capital of Vermont?",
        "What is congniac made from?"
    ]
    
    let answers = [
        "14",
        "Montpelier",
        "Grapes"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        answerLabel.text = answers[currentQuestionIndex]
    }
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        let question = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }
}












































