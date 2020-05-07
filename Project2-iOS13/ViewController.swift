//
//  ViewController.swift
//  Project2-iOS13
//
//  Created by Dennis Nesanoff on 07.05.2020.
//  Copyright © 2020 Dennis Nesanoff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    var correctAnswer = 0
    var score = 0
    var currentAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    @IBAction func selectCountry(_ sender: UIButton) {
        if currentAnswer <= 10 {
            if correctAnswer == sender.tag {
                title = "Correct"
                score += 1
                showAlert(title: title ?? "")
            } else {
                title = "Wrong! It's \(countries[sender.tag].uppercased())"
                score -= 1
                showAlert(title: title ?? "")
            }
        } else {
            startNewGame()
        }
    }
    
    func startNewGame() {
        currentAnswer = 0
        setupUI()
    }
    
    func setupUI() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        currentAnswer += 1
        title = "\(countries[correctAnswer].uppercased()) || Score: \(score)"
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    func askQuestion() {
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
    
    func showAlert(title: String) {
        let alertController = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        let action = UIAlertAction(title: "Continue", style: .default) { _ in
            self.setupUI()
        }
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}

