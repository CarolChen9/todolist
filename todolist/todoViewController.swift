//
//  todoViewController.swift
//  todolist
//
//  Created by carol chen on 2021/5/15.
//

import UIKit
import RealmSwift
protocol todoViewControllerDelegate: AnyObject {
    func update()
}
class todoViewController: UIViewController {
    @IBOutlet weak var textfiled: UITextField!
    
    weak var delegate: todoViewControllerDelegate!
    var plans = Plans()
    override func viewDidLoad() {
        super.viewDidLoad()
        setPlan()
    }
    
    func setPlan(){
        let realm = try! Realm()
        if realm.objects(Plans.self).count>0{
            plans = realm.objects(Plans.self)[0]
        }else{
            realm.beginWrite()
            realm.add(plans)
            try! realm.commitWrite()
        }
    }
    
    @IBAction func save(_ sender: Any) {
        let plan  = Plan()
        let realm = try! Realm()
        plan.setAttribute(textfiled.text!, plans.id)
        realm.beginWrite()
        plans.id = plans.id + 1
        plans.plans.append(plan)
        try! realm.commitWrite()
        dismiss(animated: true, completion: nil)
        delegate?.update()
    }
    
    
    
}
