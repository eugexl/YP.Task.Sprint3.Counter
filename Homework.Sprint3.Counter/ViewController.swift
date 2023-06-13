//
//  ViewController.swift
//  Homework.Sprint3.Counter
//
//  Created by Eugene Dmitrichenko on 13.06.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var logView: UITextView!
    
    var counterValue: Int = 0
    
    var counter: Int {
        get {
            return counterValue
        }
        set {
            counterValue = newValue
            counterLabel.text = counterValue.description
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
    }
    
    @IBAction func minusTapped(_ sender: UIButton) {
        guard counter > 0 else {
            log("попытка уменьшить значение счётчика ниже 0")
            return
        }
        counter -= 1
        log("значение изменено на -1")
    }
    
    @IBAction func plusTapped(_ sender: UIButton) {
        counter += 1
        log("значение изменено на +1")
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        guard counter > 0 else { return }
        counter = 0
        log("значение сброшено")
    }
    
    func log(_ text: String){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        
        let dateTime = dateFormatter.string(from: Date())
        
        let logString = "\n[\(dateTime)]: \(text)"
        
        logView.text.append(logString)
    }
    
}

