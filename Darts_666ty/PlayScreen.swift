//
//  playScreen.swift
//  Darts_666ty
//
//  Created by BLA on 19.08.21.
//

import Foundation
import UIKit

struct Person {
    var name: String?
    var score: Int = selectedGameValue
    var thrownDarts: Int = 0
}

var selectedGameValue: Int = 0
var playerArray = Array<Person>()

class PlayScreen: UIViewController {
    
    
    @IBAction func numberStartButton(_ sender: UIButton) {
        selectedGameValue = Int(sender.currentTitle!)!

        var playersCount = 0
        playersCount = Int(playersCounterLabel.text!)!
        
        playerArray = Array<Person>()
        
        for idx in 1..<playersCount+1{
            let person = Person(name: "Player\(idx)", score: selectedGameValue, thrownDarts: 0)
            playerArray.append(person)
        }
        
        print(playerArray.count)
        
    }
    
    @IBOutlet weak var playersCounterLabel: UILabel!
    @IBOutlet weak var playersStepper: UIStepper!
    @IBAction func playersCounterStepper(_ sender: UIStepper) {
        playersCounterLabel.text = Int(sender.value).description
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playersStepper.maximumValue = 6
        playersStepper.minimumValue = 1
    }
}



