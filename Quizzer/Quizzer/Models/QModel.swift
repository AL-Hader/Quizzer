import Foundation

class QModel {
    var number1 = 0
    var number2 = 0
    var theAns = 0
    var ans: Int?
    
    func test(testNumber: Int?, userChoose: Int?) {
        if testNumber == 1 {
            number1 = userChoose!
            number2 = Int.random(in: 1...12)
        } else if testNumber == 2 {
            number1 = Int.random(in: 1...12)
            number2 = Int.random(in: 1...12)
        }
        theAns = number1 * number2
    }
    
    func buttonLabel() -> [String] {
        var valueButton = [String(theAns), String(Int.random(in: theAns + 1...theAns + 5)), String(Int.random(in: theAns + 6...theAns + 10))]
        valueButton.shuffle()
        return valueButton
    }
}
