//
//  ViewController.swift
//  Facial Recognition
//
//  Created by Moez on 2019-08-09.
//  Copyright © 2019 Moez. All rights reserved.
//  Start view controller class

//THERE IS LITERALLY NO POINT TO THIS SCREEN IDK WHY I DID IT LOL MOMENT F

import UIKit

class ViewController: UIViewController {

    @IBAction func continueTapped(_ sender: Any) {
        performSegue(withIdentifier: "toImageSelector", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

