//
//  AddPostVCViewController.swift
//  MyHood
//
//  Created by Petr on 30.10.17.
//  Copyright © 2017 Andi. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descField: UITextField!
    
    var imagePicker : UIImagePickerController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postImg.layer.cornerRadius = postImg.frame.width/2
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
    }

    @IBAction func addPicBtnPressed(_ sender: UIButton) {
        sender.setTitle("", for: .normal)
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func makePostBtnPressed(_ sender: UIButton) {
        if let title = titleField.text, let desc = descField.text, let img = postImg.image {
            let imgPath = DataService.instance.saveImageAndCreatePath(img)
//            print("ImgPath = \(imgPath)")
            let post = Post(imagePath: imgPath, title: title, description: desc)
            DataService.instance.addPosts(post: post)
//            testImage.image = UIImage(named: imgPath)
            dismiss(animated: true, completion: nil)
            
        }
        
        
    }
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
//            imagePicker.dismiss(animated: true, completion: nil)
//            postImg.image = selectedImage
//         print("image posted")
//        
//        
//    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imagePicker.dismiss(animated: true, completion: nil)
            postImg.image = selectedImage
            print("image posted")
        } else {
            print("something went wrong")
        }
    }
    
//        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
//        imagePicker.dismiss(animated: true, completion: nil)
//        postImg.image = selectedImage
//        
//    }
    
 
}
