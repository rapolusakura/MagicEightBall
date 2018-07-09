//
//  ViewController.swift
//  MagicEightBall
//
//  Created by Sakura Rapolu on 7/2/18.
//  Copyright © 2018 Sakura Rapolu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var revealed: Bool = false
    let introOptions: [String] = ["think of a yes/no question", "the answer is.."]
    let answerOptions: [String] = ["yes", "no", "maybe.."]
    let buttonOptions: [String] = ["get your fortune!", "play again"]
    
    @IBAction func buttonPressed(_ sender: Any) {
        generateAnswer()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
        generateAnswer()
    }
    
    func generateAnswer(){
        self.revealed = !revealed
        if revealed{
            mainButton.setTitle("play again", for: .normal)
            fortune.text = answerOptions[Int(arc4random_uniform(3))]
            introStatement.text = introOptions[1]
        }
        else{
            mainButton.setTitle("get your fortune!", for: .normal)
            fortune.text = ""
            introStatement.text = introOptions[0]
        }
    }
    
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var introStatement: UILabel!
    
    @IBOutlet weak var fortune: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

