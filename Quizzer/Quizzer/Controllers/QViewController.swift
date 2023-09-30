import UIKit

class QViewController: UIViewController {
    var userChoose: Int?
    var testNumber: Int?
    var model = QModel()
    var score = 0
    var numberOfQ = 0

    @IBOutlet weak var theQLabel: UILabel!
    @IBOutlet weak var ch1: UIButton!
    @IBOutlet weak var ch2: UIButton!
    @IBOutlet weak var ch3: UIButton!
    @IBOutlet weak var goBack: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func userAns(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        if userAnswer == "\(model.theAns)" {
            sender.backgroundColor = UIColor.green
            score = 1 + score
        } else {
            sender.backgroundColor = UIColor.red
        }
        numberOfQ = numberOfQ + 1
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }

    @objc func updateUI() {
        ch1.backgroundColor = UIColor(red: 0xDA/255, green: 0x59/255, blue: 0x00/255, alpha: 1.0)
        ch2.backgroundColor = UIColor(red: 0xDA/255, green: 0x59/255, blue: 0x00/255, alpha: 1.0)
        ch3.backgroundColor = UIColor(red: 0xDA/255, green: 0x59/255, blue: 0x00/255, alpha: 1.0)
        
        model.test(testNumber: testNumber, userChoose: userChoose)
        theQLabel.text = "\(model.number1) * \(model.number2)"
        
        let buttonLabels = model.buttonLabel()
        ch1.setTitle(buttonLabels[0], for: .normal)
        ch2.setTitle(buttonLabels[1], for: .normal)
        ch3.setTitle(buttonLabels[2], for: .normal)
        
        scoreLabel.text = "Score \(score) / \(numberOfQ)"
    }


    @IBAction func goBackPress(_ sender: UIButton) {
        score = 0
        numberOfQ = 0
        dismiss(animated: true, completion: nil)
    }
}
