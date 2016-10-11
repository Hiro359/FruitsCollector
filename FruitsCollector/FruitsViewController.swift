//
//  FruitsViewController.swift
//  FruitsCollector
//
//  Created by 重信和宏 on 11/10/16.
//  Copyright © 2016 Hiro. All rights reserved.
//

import UIKit

class FruitsViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var FruitsImageView: UIImageView!
    @IBOutlet weak var Titletextfield: UITextField!
    
    var imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
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
    }
    @IBAction func addTapped(_ sender: AnyObject) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fruit = Fruits(context: context)
        fruit.title = Titletextfield.text
        fruit.image = UIImagePNGRepresentation(FruitsImageView.image!) as NSData?
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
        
    }
   
}
