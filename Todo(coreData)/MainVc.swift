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
        
        self.tableView.reloadData()
    
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mytask.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let taskname = mytask[indexPath.row]
        
        cell.textLabel?.text = "\(String(describing: taskname.name))"
        
        return cell
    }
    
    func fetchdata(){
        
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = delegate.persistentContainer.viewContext
        
        do{
            mytask = try context.fetch(Task.fetchRequest())
            
            tableView.reloadData()
            
        } catch{
            
            debugPrint(error)
            
        }
        
    }


}

