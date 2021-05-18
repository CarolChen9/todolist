//
//  CheckBoxTableViewCell.swift
//  todolist
//
//  Created by carol chen on 2021/5/14.
//

import UIKit
protocol CheckBoxTableViewCellDelegate: AnyObject {
    func checkcell(_ cell: CheckBoxTableViewCell, didChangeCheckingState checking: Bool)
}
class CheckBoxTableViewCell: UITableViewCell {

    @IBOutlet weak var Label: UILabel!
    
    weak var delegate: CheckBoxTableViewCellDelegate?
    
    @IBAction func checking(_ sender: Checkbox) {
        updateChecking()
        delegate?.checkcell(self, didChangeCheckingState: checkbox.checking)
        
    }
    @IBOutlet weak var checkbox: Checkbox!
    
    func set(title: String, checking: Bool) {
        Label.text = title
        checkbox.checking = checking
    }
    
    //cross out
    func updateChecking() {
        let AS = NSMutableAttributedString(string: Label.text!)
        
        if checkbox.checking {
            AS.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, AS.length))
            checkbox.checking = false
        } else {
            checkbox.checking = true
            AS.removeAttribute(.strikethroughStyle, range: NSMakeRange(0, AS.length))
        }
        
        Label.attributedText = AS
    }
}

