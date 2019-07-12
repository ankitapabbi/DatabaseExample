//
//  ViewController.swift
//  DatabaseExample
//
//  Created by Ankita Pabbi on 2019-07-04.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var textUserEmail: UITextField!
    
    @IBOutlet weak var textUserPassword: UITextField!
    @IBOutlet weak var switchRememberMe: UISwitch!
    
    
    
    @IBAction func btnLogin(_ sender: UIButton) {
        if self.textUserEmail.text == "admin" && self.textUserPassword.text == "admin"{
            let userDefault = UserDefaults.standard
            if switchRememberMe.isOn{
               
                
                userDefault.setValue(textUserEmail.text, forKey: "userEmail")
                userDefault.set(textUserPassword.text,forKey: "userPassword")
                
                
                
//                // Step - 1 Mention Storyboard Id of View Controller
//                // Step - 2 Get the reference of Stroyboard
//                let sb = UIStoryboard(name: "Main", bundle: nil)
//
//                // Step - 3 GEt reference of View Controller Using storyBoard id
//
//                let userVC = sb.instantiateViewController(withIdentifier: "UserVC") as! HomeViewController
//
//               //userVC.lblUserEmailId.text = self.textUserEmail.text
//                // step - 4 Navigate or present
//                //self.present(userVC, animated: true,completion: nil)
//                self.navigationController?.pushViewController(userVC,animated: true)
            }
            else{
                // removing UserDefaults
                userDefault.removeObject(forKey: "userEmail")
                userDefault.removeObject(forKey: "userPassword")
            }
        }else{
            
            //user not exist
            
            let alert = UIAlertController(title: "Error", message: "User Email / Password Incorrect", preferredStyle: UIAlertController.Style.alert)
            //Step 2 OK Button Add
            let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
           
            let actionCanel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
            
            
            
            
            //Step 3 Add button To Alert
            alert.addAction(actionOk)
            alert.addAction(actionCanel)
            
            
            
            // Step 4 Present Alert Box To user
            self .present(alert, animated: true ,completion: nil)
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getRememberMeValues()
        // Do any additional setup after loading the view.
    }

    private func getRememberMeValues()
    {
        let userDefault = UserDefaults.standard
        
        if let email = userDefault.string(forKey: "userEmail")
        {
            textUserEmail.text = email
            
            if let pwd = userDefault.string(forKey: "userPassword")
            {
                textUserPassword.text = pwd
            }
        }
    }

    // like onClick 
    @IBAction func unWindLogoutFromAnyScreen(storyboard : UIStoryboardSegue){
        print("Logout")
        // picking value from sencond screen and displaying on first screen while logout
        let s = storyboard.source as! HomeViewController
        print(s.lblUserEmailId.text!)
        
        textUserEmail.text = ""
        textUserPassword.text = ""
        
    }
}

