//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Zulwiyoza Putra on 11/22/16.
//  Copyright © 2016 Zulwiyoza Putra. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var opponentStatus: Int?
    var playerStatus: Int?
    var resultStatus: Int?

    @IBOutlet weak var resultStatusLabel: UILabel!
    
    @IBOutlet weak var detailInformationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultSetup()
        detailInformation()
        
        
        // Do any additional setup after loading the view.
    }
    
    func resultSetup() -> Void {
        if resultStatus == 1 {
            resultStatusLabel.text = "You win"
        } else if resultStatus == 2 {
            resultStatusLabel.text = "Draw"
        } else if resultStatus == 3 {
            resultStatusLabel.text = "You Lose"
        }
    }
    
    func detailInformation() -> Void {
        if opponentStatus == 1 {
            detailInformationLabel.text = "Opponent throw a paper"
        } else if opponentStatus == 2 {
            detailInformationLabel.text = "Opponent throw a rock"
        } else if opponentStatus == 3 {
            detailInformationLabel.text = "Opponent throw a scissor"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tryAgain(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
