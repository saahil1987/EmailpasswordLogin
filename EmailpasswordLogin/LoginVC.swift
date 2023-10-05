//
//  LoginVC.swift
//  EmailpasswordLogin
//
//  Created by yapapp on 05/10/23.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var Loginbtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    
        Loginbtn.addTarget(self, action: #selector(Login), for: .touchUpInside)
        
    }
    
    @IBAction func registerBtn(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: tfEmail.text!, password: tfPassword.text!) { authResult, error in
            if error != nil {
                print(error?.localizedDescription ?? "Exception")
            }else{
                //print("Login - \(String(describing: authResult?.user))")
                print("Register by User")
            }
        }
    }
    @objc func Login(){
        Auth.auth().signIn(withEmail: tfEmail.text!, password: tfPassword.text!) { authResult, error in
            if error != nil {
                print(error?.localizedDescription ?? "Exception")
            }else{
               // print("Login - \(String(describing: authResult?.user))")
                print("Login by user")
            }
        }
    }

   
    @IBAction func resetPasssword(_ sender: UIButton) {
        guard let email = tfEmail.text,!email.isEmpty else{
           return
        }
        resetpassword(email:email)
        
    }
    func resetpassword(email:String){
//        func sendPasswordReset(withEmail email: String, _ callback: ((Error?) -> ())? = nil){
//            Auth.auth().sendPasswordReset(withEmail: email) { error in
//                callback?(error)
//            }
//        }
        Auth.auth().sendPasswordReset(withEmail: tfEmail.text!) { error in
            if error != nil{
                print("Error in resetPassword")
            }else{
                print("resetPassword sucessfully")
            }
        }
    }
    
}
