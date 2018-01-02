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
    @IBOutlet weak var currentQuestionLabel: UILabel!
    @IBOutlet weak var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet weak var nextQuestionLabel: UILabel!
    @IBOutlet weak var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
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
        currentQuestionLabel.text = questions[currentQuestionIndex]
        updateOffScreenLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nextQuestionLabel.alpha = 0
    }
    
    func animateLabelTransitions() {
        view.layoutIfNeeded() //Forces any outstanding layout changes to occur
        
        //MARK: - Silver Challenge Chapter 8 - Block 2
        //This is the solution to the Silver Challenge Chapter 8 instead of commented out code
        nextQuestionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        let layoutGuide = UILayoutGuide()
        view.addLayoutGuide(layoutGuide)
        layoutGuide.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        layoutGuide.leadingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        currentQuestionLabel.centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor).isActive = true
        
        //let screenWidth = view.bounds.width
        //nextQuestionLabelCenterXConstraint.constant = 0
        //currentQuestionLabelCenterXConstraint.constant += screenWidth
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.1, options: [.curveLinear], animations: {
            self.currentQuestionLabel.alpha = 0
            self.nextQuestionLabel.alpha = 1
            self.view.layoutIfNeeded()
        }) { _ in
            swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
            swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)
            self.updateOffScreenLabel()
        }
    }
    
    func updateOffScreenLabel() {
        //MARK: - Silver Challenge Chapter 8 - Block 1
        //This is the solution to the Silver Challenge Chapter 8 instead of commented out code
        let layoutGuide = UILayoutGuide()
        view.addLayoutGuide(layoutGuide)
        layoutGuide.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        layoutGuide.trailingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        nextQuestionLabel.centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor).isActive = true
        
        //let screenWidth = view.bounds.width
        //nextQuestionLabelCenterXConstraint.constant = -screenWidth
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
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        animateLabelTransitions()
    }
}












































