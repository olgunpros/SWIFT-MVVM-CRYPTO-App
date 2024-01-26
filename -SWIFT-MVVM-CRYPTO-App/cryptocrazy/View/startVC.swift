//
//  startVC.swift
//  cryptocrazy
//
//  Created by Olgun ‏‏‎‏‏‎ on 25.01.2024.
//

import UIKit

class startVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func startClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "startclick", sender: nil)
    }
    
    
}
