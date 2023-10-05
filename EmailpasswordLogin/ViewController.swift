//
//  ViewController.swift
//  EmailpasswordLogin
//
//  Created by yapapp on 05/10/23.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func EmailLogin(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC")as? LoginVC
        self.navigationController?.pushViewController(vc! , animated: true)
    }
    
    @IBAction func logoutBtn(_ sender: UIButton) {
        
        signOut() 
        
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            // Sign-out was successful
            // You can navigate the user to the login screen or perform any other required actions.
            print("User signing out")
        } catch let signOutError as NSError {
            print("Error signing out: \(signOutError.localizedDescription)")
            //print("Error signing out")
        }
    }

}
