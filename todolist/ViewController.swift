//
//  ViewConttoller.swift
//  todolist
//
//  Created by carol chen on 2021/5/15.
//

import UIKit
import RealmSwift
class ViewController: UIViewController {
    var plans = Plans()
    @IBOutlet weak var myTabelView: UITableView!
    @IBAction func deleting(_ sender: Any) {
        self.myTabelView.setEditing(!self.myTabelView.isEditing, animated: true)
      
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    @IBAction func add(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "toDoViewId") as! todoViewController
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
}
 
extension ViewController: UITableViewDataSource {
   

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plans.plans.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "checking cell", for: indexPath) as! CheckBoxTableViewCell
        
        cell.delegate = self
        
        let plan = plans.plans[indexPath.row]
        cell.Label.text = plan.task
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let plan = plans.plans[indexPath.row]
            plans.remove(p: plan)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}



extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        print(sourceIndexPath.row)
//        print(destinationIndexPath.row)
    }
}

extension ViewController: CheckBoxTableViewCellDelegate {
    func checkcell(_ cell: CheckBoxTableViewCell, didChangeCheckingState checking: Bool) {
        cell.checkbox.checking = !cell.checkbox.checking;
    }

}
extension ViewController: todoViewControllerDelegate{
    func update() {
        setPlan()
        myTabelView.reloadData()
    }
}

