//
//  HomeViewController.swift
//  DatabaseExample
//
//  Created by Ankita Pabbi on 2019-07-04.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var lblUserEmailId: UILabel!
    
    
    @IBAction func btnLogout(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "Home"
        
        let userDefault = UserDefaults.standard
        if let email = userDefault.string(forKey: "userEmail"){
           // print(email)
            
            lblUserEmailId.text = "\(email)"
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
