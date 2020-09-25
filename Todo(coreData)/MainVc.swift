//
//  ViewController.swift
//  Todo(coreData)
//
//  Created by Ravi Thakur on 24/09/20.
//

import UIKit
import CoreData

class MainVc: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet weak var tableView: UITableView!
    
    var mytask : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchdata()
        
    
    }
    

    override func viewWillAppear(_ animated: Bool) {
        
        fetchdata()
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    

    
    override func viewDidAppear(_ animated: Bool) {
        
        fetchdata() 
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        
        if editingStyle == .delete {
            
            
            let delettask = mytask[indexPath.row]
            
            context.delete(delettask)
            
            delegate.saveContext()
            
            fetchdata()
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mytask.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let taskname = mytask[indexPath.row]
        
        let name = taskname.name
        
        if let myname = name{
            
            if taskname.smiley{
                
                cell.textLabel?.text = "😎 \(myname)"
                
            }else{
            cell.textLabel?.text = myname
            }
        }
    
        return cell
    }
    
    func fetchdata(){
        
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = delegate.persistentContainer.viewContext
        
        do{
            mytask = try context.fetch(Task.fetchRequest())
            
//            tableView.reloadData()
            
        } catch{
            
            debugPrint(error)
            
        }
        
    }


}

