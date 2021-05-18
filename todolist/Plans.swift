//
//  Plans.swift
//  todolist
//
//  
//

import Foundation
import RealmSwift
import Foundation
class Plans: Object{
    var plans = List<Plan>()
    @objc dynamic var id = 1
    func remove(p: Plan){
        let realm = try! Realm()
        for i in 0..<plans.count{
            if plans[i].id == p.id{
                realm.beginWrite()
                plans.remove(at: i)
                try! realm.commitWrite()
                break
            }
        }
    }
}
