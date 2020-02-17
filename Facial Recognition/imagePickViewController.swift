//
//  imagePickViewController.swift
//  Facial Recognition
//
//  Created by Moez on 2019-08-09.
//  Copyright © 2019 Moez. All rights reserved.
//

import UIKit

class imagePickViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var pickedImageView: UIImageView!
    
    @IBAction func chooseTapped(_ sender: Any) {
        let img = UIImagePickerController()
        img.delegate = self

        img.sourceType = .photoLibrary
        
        img.allowsEditing = false
        
        self.present(img, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            pickedImageView.image = img
        }
        else {
            print("error, could not convert selected image")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func analyzeTapped(_ sender: Any) {
        performSegue(withIdentifier: "toAnalyzation", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let aView = segue.destination as? analyzationViewController
        
        aView?.image = pickedImageView.image!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickedImageView.image = UIImage(named: "placeholder")
    }

}
