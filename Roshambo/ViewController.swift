//
//  ViewController.swift
//  Roshambo
//
//  Created by Zulwiyoza Putra on 11/22/16.
//  Copyright © 2016 Zulwiyoza Putra. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {
    
    var opponentValue: Int?
    var playerValue: Int?
    var winningStatus: WinningStatus?
    
    func randomNumber() -> Int {
        let startingNumber = 1
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: 3) + startingNumber
        return randomNumber
    }
    
    func setupOpponentValue() -> Void {
        opponentValue = randomNumber()
        print("Opponent value is \(opponentValue!)")
    }
    
    func setupPlayerValue(sender: UIButton) -> Void {
        switch ButtonType(rawValue: sender.tag)! {
        case .paper:
            playerValue = 1
        case .rock:
            playerValue = 2
        case .scissor:
            playerValue = 3
        }
        
        print("Player value is \(playerValue!)")
    }
    
    func setupComparison() -> Void {
        if playerValue == 1 && opponentValue == 2 {
            winningStatus = .win
        } else if playerValue == 1 && opponentValue == 3 {
            winningStatus = .lose
        } else if playerValue == 2 && opponentValue == 3 {
            winningStatus = .win
        } else if playerValue == 2 && opponentValue == 1 {
            winningStatus = .lose
        } else if playerValue == 3 && opponentValue == 1 {
            winningStatus = .win
        } else if playerValue == 3 && opponentValue == 2 {
            winningStatus = .lose
        } else if playerValue == opponentValue {
            winningStatus = .draw
        }
        
        print((winningStatus?.rawValue)!)
    }
    
    enum ButtonType: Int {
        case paper = 1
        case rock = 2
        case scissor = 3
    }
    
    enum WinningStatus: Int {
        case win = 1
        case draw = 2
        case lose = 3
    }
    
    @IBAction func playerValueInput(_ sender: UIButton) {
        print("Player Value Input Button Tapped")
        
        setupOpponentValue()
        setupPlayerValue(sender: sender)
        setupComparison()
        
        performSegue(withIdentifier: "roshambo", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as! ResultViewController
        
        resultViewController.opponentStatus = self.opponentValue
        resultViewController.playerStatus = self.playerValue
        resultViewController.resultStatus = self.winningStatus?.rawValue
        
        
    }


}

