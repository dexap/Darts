//
//  MatchScreen.swift
//  Darts_666ty
//
//  Created by admin on 19.08.21.
//

import Foundation
import UIKit



class MatchScreen: UIViewController {
    // LABELS
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var currentScoreLabel: UILabel!
    @IBOutlet weak var overallScoreLabel: UILabel!
    @IBOutlet weak var firstDartScoreLabel: UILabel!
    @IBOutlet weak var secondDartScoreLabel: UILabel!
    @IBOutlet weak var thirdDartScoreLabel: UILabel!
    @IBOutlet weak var dartCounter: UILabel!
    
    @IBOutlet weak var multiplierLabel: UILabel!
    
    var multiTapped = false
    var multiplier = 0
    var activePlayer = 0

    
    
    // NUMBER BUTTONS
    @IBAction func numberTapped(_ sender: UIButton) {
        
        var scoreString: String = sender.currentTitle!
        
        if multiTapped == true {
            if sender.tag == 25 || sender.tag == 50 {
                scoreString = sender.currentTitle!
            } else {
                scoreString = String(Int(scoreString)! * multiplier)
                
            }
        }

        // First press
        if firstDartScoreLabel.text == "-" {
        
            firstDartScoreLabel.text = scoreString
            currentScoreLabel.text = scoreString
            playerArray[activePlayer].thrownDarts += 1
            dartCounter.text = "\(playerArray[activePlayer].thrownDarts) Darts"
        }
        
        // Second Press
        else if firstDartScoreLabel.text != "-" && secondDartScoreLabel.text == "-"{
            
            secondDartScoreLabel.text = scoreString
            currentScoreLabel.text = String(Int(currentScoreLabel.text!)! + Int(scoreString)!)
            playerArray[activePlayer].thrownDarts += 1
            dartCounter.text = "\(playerArray[activePlayer].thrownDarts) Darts"
        }
        
        // Third Press
        else if firstDartScoreLabel.text != "-" && secondDartScoreLabel.text != "-" && thirdDartScoreLabel.text == "-"{
            
            thirdDartScoreLabel.text = scoreString
            currentScoreLabel.text = String(Int(currentScoreLabel.text!)! + Int(scoreString)!)
            playerArray[activePlayer].thrownDarts += 1
            dartCounter.text = "\(playerArray[activePlayer].thrownDarts) Darts"
        }
                
        

        
        // Multiplier zurücksetzten
        multiTapped = false
        multiplierLabel.text = ""
        
    }
    
    
    
    // MULTYPLY BUTTONS
    @IBAction func multiplyTapped(_ sender: UIButton) {
        
        multiplierLabel.text = sender.currentTitle
        multiplier = sender.tag
        multiTapped = true
    }
    
    
    // NEXT BUTTON
    @IBAction func nextTapped(_ sender: UIButton) {
        
        // Win Screen Mit Restart Button zum drücken
        if overallScoreLabel.text == "WIN" {
            overallScoreLabel.text = String(selectedGameValue)
            sender.setTitle("Next", for: .normal)
            
        }
        
        // Wenn überworfen
        if playerArray[activePlayer].score - Int(currentScoreLabel.text!)! < 0 {
            
        }
        // wenn Beendet
        else if playerArray[activePlayer].score - Int(currentScoreLabel.text!)! == 0{
            
            overallScoreLabel.text = "WIN"
            sender.setTitle("Restart", for: .normal)
        }
        // wenn inGame
        else {
            let newScore = playerArray[activePlayer].score - Int(currentScoreLabel.text!)!
            playerArray[activePlayer].score = newScore
            overallScoreLabel.text = String(newScore)
            
        }
        
        switchPlayers()
        resetDartLabels()
    }
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetDartLabels()
        overallScoreLabel.text = String(playerArray[activePlayer].score)
        activePlayer = 0
        playerNameLabel.text = playerArray[activePlayer].name
    }
    
    
    

    
    func resetDartLabels() {
        firstDartScoreLabel.text = "-"
        secondDartScoreLabel.text = "-"
        thirdDartScoreLabel.text = "-"
        currentScoreLabel.text = "0"
        multiplierLabel.text = ""
        
    }
    
    func resetPlayerScores() {
        for i in 0..<playerArray.count {
            playerArray[i].score = 0
            playerArray[i].thrownDarts = 0
        }
    }

    func switchPlayers() {
        
        // playerArray[0] - Player1
        // playerArray[1] - Player2
        
                // 0
        if activePlayer < playerArray.count-1 {
            activePlayer += 1
        } else {
            activePlayer = 0
        }
        playerNameLabel.text = playerArray[activePlayer].name
        overallScoreLabel.text = String(playerArray[activePlayer].score)
        dartCounter.text = String("\(playerArray[activePlayer].thrownDarts) Darts")
    }
    
    
    
    
}
