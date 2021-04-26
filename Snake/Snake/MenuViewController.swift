 //
//  MenuViewController.swift
//  Snake
//
//  Created by etudiant on 4/26/21.
//  Copyright © 2021 TheSmurf. All rights reserved.
//

import UIKit

 class MenuViewController : UIViewController {
    
    @IBAction func Start(_ sender: Any) {
        self.performSegue(withIdentifier: "ViewController", sender: self)
    
    
        func viewDidLoad(){
        super.viewDidLoad()
        
    }
 }

 }
