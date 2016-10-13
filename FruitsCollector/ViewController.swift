//
//  ViewController.swift
//  FruitsCollector
//
//  Created by 重信和宏 on 10/10/16.
//  Copyright © 2016 Hiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var fruits : [Fruits] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            fruits = try context.fetch(Fruits.fetchRequest())
            tableView.reloadData()
            
        } catch {
        
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt IndexPath : IndexPath) -> UITableViewCell{
        let cell = UITableViewCell()
        let fruit = fruits[IndexPath.row]
        cell.textLabel?.text = fruit.title
        cell.imageView?.image = UIImage(data: fruit.image as! Data)
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let fruit = fruits[indexPath.row]
         performSegue(withIdentifier: "fruitSegue", sender: fruit)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nectVC = segue.destination as! FruitsViewController
        nectVC.fruit = sender as? Fruits
        
    }
}

