//
//  Record.swift
//  EFCMark
//
//  Created by macOS on 2019/7/25.
//

import Foundation
class Record {
    var date: String
    var content: String
    var title: String
    init(date: String, content: String, title: String){
        self.date = date
        self.content = content
        self.title = title
    }
    
}
