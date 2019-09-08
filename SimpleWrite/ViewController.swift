//
//  ViewController.swift
//  SimpleWrite
//
//  Created by macOS on 2019/7/24.
//  Copyright © 2019 macOS. All rights reserved.
//

import UIKit
import EFMarkdown
class ViewController: UIViewController {
    let markView = EFMarkdownView()
    var data:Record?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("预览按钮加载成功")
        self.RecordDate.setDate(Date((data?.date)!), animated: false)
        self.RecordTitle.text = data?.title
        self.content.layer.borderWidth = 1
        
        self.content.layer.cornerRadius = 16
        self.content.text = data?.content
    
    }
    @IBOutlet var EditView: UIView!
    
    @IBOutlet weak var RecordDate: UIDatePicker!
    
    @IBOutlet weak var RecordTitle: UITextField!
    
    
    @IBAction func preview(_ sender: UIButton) {
        if sender.currentTitle == "预览"{
            sender.setTitle("原文", for: UIControl.State.normal)
            let screenSize = UIScreen.main.bounds
            markView.frame = CGRect(x: 0, y: 205, width: screenSize.width, height: 530)
            self.view.addSubview(markView)
            markView.load(markdown: content.text, options: [.default]) {
                [weak self] (_, _) in
                
            }
        }
        else {
            markView.removeFromSuperview()
            sender.setTitle("预览", for: UIControl.State.normal)
        }
    }
    
    @IBAction func save(_ sender: UIButton) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        data?.date = formatter.string(from: RecordDate.date)
        data?.content = content.text!
        data?.title = RecordTitle.text!
    }

    
    
    @IBOutlet weak var content: UITextView!
}
extension Date {
    init(_ dateString: String, dateFormat: String = "yyyy.MM.dd") {
        let df = DateFormatter()
        df.dateFormat = dateFormat
        let date = df.date(from: dateString)!
        self.init(timeInterval: 0, since: date)
    }
}
