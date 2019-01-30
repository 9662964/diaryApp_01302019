//
//  ViewController.swift
//  diaryApp
//
//  Created by ILJOOCHAE on 2019. 1. 29..
//  Copyright © 2019년 com.wpiwireless. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var task : [Task] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            task = try context.fetch(Task.fetchRequest())
            tableView.reloadData()
        }catch{
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let tasks = task[indexPath.row]
        cell.textLabel?.text = tasks.title
        cell.imageView?.image = UIImage(data: tasks.image as! Data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tasks = task[indexPath.row]
        performSegue(withIdentifier: "taskSegue", sender: tasks)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! addTaskViewController
        nextVC.task = sender as! Task
    }

    
  

}

