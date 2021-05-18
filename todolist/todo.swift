//
//  todo.swift
//  todolist
//
//  Created by carol chen on 2021/5/14.
//

import Foundation
struct todo {
    let title: String
    var complete: Bool = false

    init(title: String, complete: Bool = false) {
        self.title = title
        self.complete = complete
    }
}
    
