//
//  DoctorLoginViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Aryan Singh on 28/04/23.
//

import UIKit

class DoctorLoginViewController: UIViewController {

    
    @IBOutlet var doctorTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        doctorTextField.clipsToBounds = true
        passwordTextField.clipsToBounds = true
        doctorTextField.layer.cornerRadius = 30
        passwordTextField.layer.cornerRadius = 30
        doctorTextField.text = "ujjwal@hms-doctor.in"
        passwordTextField.text = "password"
        
        super.viewDidLoad()
    }
    
    
    @IBAction func loginClicked(_ sender: Any) {
//        if(doctorTextField.text! != "" && passwordTextField.text! != ""){
//            let parameters = [
//                "email":doctorTextField.text!,
//                "password":passwordTextField.text!,
//                "role":"doctor"]
//            UserAuthentication.shared.doctorLogin(parameters: parameters){result in
//                switch result {
//                case .success(let response):
////                    print(response.status)
//                    if(response.status){
//                        self.handleLogin()
//                    }else{
//                        print((response.response?.Message)!)
//                        self.handleError(msg: (response.response?.Message)!)
//                    }
//                    break
//                case .failure(let error):
//                    print(error)
//                    self.handleError(msg: "Somn Error")
//                    break
//                }
//            }
//        }else{
//            self.handleError(msg: "Empty Fields")
//        }
        
        self.handleLogin()
    }
    
    func handleLogin(){
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "HomeStoryboard", bundle: nil)
            let tabBarController = storyboard.instantiateViewController(withIdentifier: "DoctorHomeStoryboard") as! UITabBarController
            tabBarController.modalPresentationStyle = .fullScreen
            self.present(tabBarController, animated: true, completion: nil)
        }
    }
    
    func handleError(msg:String?){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
                      
                      alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel,handler: {action in print("Tapped dismiss")}))
                      self.present(alert,animated: true)
        }
        }
}
