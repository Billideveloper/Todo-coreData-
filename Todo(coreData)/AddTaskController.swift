//
//  AddTaskController.swift
//  Todo(coreData)
//
//  Created by Ravi Thakur on 24/09/20.
//

import UIKit

class AddTaskController: UIViewController {
    
    
    @IBOutlet weak var addtaskImage: UIImageView!
    
    @IBOutlet weak var newtask: UITextField!
    
    @IBOutlet weak var addsmileybtn: UISwitch!
    
    //MARK: - viewdidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - imageview animation
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 1.0) {
            self.addtaskImage.transform = self.addtaskImage.transform.rotated(by: CGFloat(Double.pi))
        }
        
    }

  
    @IBAction func addSmileybtn(_ sender: Any) {
        
        
        
    }
    
    //MARK: - addtaskfunc
    
    
    @IBAction func addTaskbtn(_ sender: Any) {
    //add task here
        
        let mydelegates = UIApplication.shared.delegate as! AppDelegate
        
        let context = mydelegates.persistentContainer.viewContext
        
        let mytask = Task(context: context)
        
      
        if let taskname = newtask.text{
            mytask.name = taskname
        }
        
        mytask.smiley = addsmileybtn.isOn
        
        mydelegates.saveContext()
        
        self.navigationController?.popToRootViewController(animated: true)
        
        
        
    }
    
    
    
    @IBAction func cancel(_ sender: Any) {
        
        self.navigationController?.popToRootViewController(animated: true)
        
        
    }
    
}
