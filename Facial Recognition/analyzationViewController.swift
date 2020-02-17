//
//  analyzationViewController.swift
//  Facial Recognition
//
//  Created by Moez on 2019-08-09.
//  Copyright © 2019 Moez. All rights reserved.
//

import UIKit

class analyzationViewController: UIViewController {

    var image = UIImage()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var smileLabel: UILabel!
    
    @IBOutlet weak var isSmileLabel: UILabel!
    
    @IBAction func backTapped(_ sender: Any) {
        performSegue(withIdentifier: "backToImagePicker", sender: self)
    }
    
    @IBAction func analyzeTapped(_ sender: Any) {
        detection()
    }
    
    func detection() {
        let img = CIImage(image: image)!
        
        let accuracy = [CIDetectorAccuracy: CIDetectorAccuracyHigh]
        let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: accuracy)
        
        let faces = faceDetector?.features(in:img,options:[CIDetectorTypeFace:true])
        
        if faces!.isEmpty {
            print("no faces detected")
            smileLabel.text = "No faces detected."
        }
        else {
            if faces!.count == 1 {
                var person = faces![0]
            }
            else{
                print("This picture has more than one face!")
            }
            smileLabel.text = "Num of Faces: \(faces!.count)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = image
        detection()
    }

}
