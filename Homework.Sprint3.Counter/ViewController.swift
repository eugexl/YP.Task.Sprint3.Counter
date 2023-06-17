//
//  ViewController.swift
//  Homework.Sprint3.Counter
//
//  Created by Eugene Dmitrichenko on 13.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var logView: UITextView!
    
    private var counterValue: Int = 0
    private let dateFormatter = DateFormatter()
    
    private var counter: Int {
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
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        
    }
    
    @IBAction private func minusTapped(_ sender: UIButton) {
        guard counter > 0 else {
            log("попытка уменьшить значение счётчика ниже 0")
            return
        }
        counter -= 1
        log("значение изменено на -1")
    }
    
    @IBAction private func plusTapped(_ sender: UIButton) {
        counter += 1
        log("значение изменено на +1")
    }
    
    @IBAction private func clearTapped(_ sender: UIButton) {
        guard counter > 0 else { return }
        counter = 0
        log("значение сброшено")
    }
    
    private func log(_ text: String){
        
        let dateTime = dateFormatter.string(from: Date())
        
        let logString = "\n[\(dateTime)]: \(text)"
        
        logView.text.append(logString)
    }
}
