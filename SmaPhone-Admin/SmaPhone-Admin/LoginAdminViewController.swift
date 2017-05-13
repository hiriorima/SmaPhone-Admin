//
//  LoginAdminViewController.swift
//  SmaPhone-Admin
//
//  Created by 会津慎弥 on 2017/05/13.
//  Copyright © 2017年 会津慎弥. All rights reserved.
//

import UIKit

class LoginAdminViewController: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwdTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwdTextField.isSecureTextEntry = true
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.performSegue(withIdentifier: "adminView", sender: nil)
        }
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
