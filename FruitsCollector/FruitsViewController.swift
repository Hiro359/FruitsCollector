//
//  FruitsViewController.swift
//  FruitsCollector
//
//  Created by 重信和宏 on 11/10/16.
//  Copyright © 2016 Hiro. All rights reserved.
//

import UIKit

class FruitsViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var deletebutton: UIButton!
    @IBOutlet weak var addupdatedbutton: UIButton!
    @IBOutlet weak var FruitsImageView: UIImageView!
    @IBOutlet weak var Titletextfield: UITextField!
    
    var imagePicker = UIImagePickerController()
    var fruit : Fruits? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        
        if fruit != nil {
            FruitsImageView.image = UIImage(data: fruit?.image as! Data)
            Titletextfield.text = fruit?.title
            addupdatedbutton.setTitle("Update", for: .normal)
        } else { deletebutton.isHidden = true}
    }
    @IBAction func photoTapped(_ sender: AnyObject) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
    FruitsImageView.image = image
        imagePicker.dismiss(animated: true, completion: nil)
    }
    @IBAction func cameraTapped(_ sender: AnyObject) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
        
        
        
        
    }
    @IBAction func addTapped(_ sender: AnyObject) {
        if fruit != nil {
            fruit!.title = Titletextfield.text
            fruit!.image = UIImagePNGRepresentation(FruitsImageView.image!) as NSData?
}
        else {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let fruit = Fruits(context: context)
            fruit.title = Titletextfield.text
            fruit.image = UIImagePNGRepresentation(FruitsImageView.image!) as NSData?}
        
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
        }
    
    @IBAction func deleteTapped(_ sender: AnyObject) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(fruit!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
}
