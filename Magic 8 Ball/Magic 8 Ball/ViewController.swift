//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Shorabh Dhandharia on 9/20/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ballImageView: UIImageView!
    
    var randomBallIndex : Int = 0
    let ballArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBallImage()
    }

    @IBAction func askButtonPressed(_ sender: UIButton) {
        updateBallImage()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateBallImage()
    }
    
    func updateBallImage(){
       randomBallIndex = Int(arc4random_uniform(5))
        ballImageView.image = UIImage(named: ballArray[randomBallIndex])
    }
    
}

