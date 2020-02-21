//
//  SecondViewController.swift
//  OnCampus
//
//  Created by Dane Brazinski on 2/15/20.
//  Copyright © 2020 Dane Brazinski. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
  
    @IBAction func aClick(_ sender: UIButton) {
        print("Filter Pressed")
        self.performSegue(withIdentifier: "thirdViewSegue", sender: self)
        
    }

    @IBAction func home(_ sender: UIButton) {
        self.performSegue(withIdentifier: "ogBack", sender: self)
    }
  
    @IBAction func dClick(_ sender: UIButton) {
        self.performSegue(withIdentifier: "fourthViewSegue", sender: self)
    }
    
}



