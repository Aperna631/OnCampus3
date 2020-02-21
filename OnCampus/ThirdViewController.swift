//
//  ThirdViewController.swift
//  OnCampus
//
//  Created by Dane Brazinski on 2/15/20.
//  Copyright © 2020 Dane Brazinski. All rights reserved.
//

import UIKit
import GoogleMaps

class ThirdViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func bButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "backButton", sender: self)
    }
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


