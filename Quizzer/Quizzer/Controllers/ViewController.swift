//
//  ViewController.swift
//  Quizzer
//
//  Created by majd on 9/28/23.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    var avPlayer : AVPlayer?
    var userChoose : Int = 0
    var testNumber :Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func userNumber(_ sender: UIButton) {
        userChoose = sender.tag
        testNumber = 1
        performSegue(withIdentifier: "goToQ", sender: self)
    }

    
    @IBAction func allNumbers(_ sender: UIButton) {
        userChoose = Int.random(in: 1...12)
        testNumber = 2
        performSegue(withIdentifier: "goToQ", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToQ" {
            let destinationVC = segue.destination as! QViewController
            destinationVC.userChoose = userChoose
            destinationVC.testNumber = testNumber
        }
    }
}

