//
//  NewViewController.swift
//  SimpleWrite
//
//  Created by macOS on 2019/7/26.
//  Copyright © 2019 macOS. All rights reserved.
//

import UIKit
import EFMarkdown
class NewViewController: UIViewController {
    let markView = EFMarkdownView()
    var data:Record?
    var datas:[Record]?
    @IBOutlet weak var RecordTitle: UITextField!
    @IBOutlet weak var RecordDate: UIDatePicker!
    @IBOutlet weak var content: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("预览按钮加载成功")

        self.content.layer.borderWidth = 1
        
        self.content.layer.cornerRadius = 16
        
    }
   
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
        data = Record(date: formatter.string(from: RecordDate.date), content: content.text!, title: RecordTitle.text!)
        datas?.append(data!)
    }
}

