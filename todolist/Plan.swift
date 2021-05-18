//
//  Plan.swift
//  todolist
//
//  
//
import RealmSwift
import Foundation
class Plan: Object{
    @objc dynamic var task = ""
    @objc dynamic var id = 0
    func setAttribute(_ task: String, _ id: Int){
        self.task = task
        self.id = id
    }
}
