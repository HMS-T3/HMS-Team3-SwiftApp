//
//  LoginViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Aryan Singh on 13/04/23.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

class LoginViewController: UIViewController {
    
    private let phoneNumberTextField: UITextField = {
        
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Enter Your Phone Number"
        field.layer.cornerRadius = 10
        field.layer.masksToBounds = true
        field.layer.borderColor = UIColor.gray.cgColor
        field.layer.borderWidth = 2
        field.textAlignment = .center
        field.keyboardType = .phonePad
        return field
    }()
    
    private let otpField: UITextField = {
        
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Enter The OPT Recieved on Your Phone"
        field.layer.cornerRadius = 10
        field.layer.masksToBounds = true
        field.layer.borderColor = UIColor.gray.cgColor
        field.layer.borderWidth = 2
        field.textAlignment = .center
        field.keyboardType = .phonePad
        return field
    }()
    
    private let getOTPButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get OTP", for: .normal)
        button.backgroundColor = UIColor(named: "GetOTPButton")
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    private let submitOTPButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Submit", for: .normal)
        button.backgroundColor = UIColor(named: "GetOTPButton")
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    private let googleSignInButton: GIDSignInButton = {
        
        let button = GIDSignInButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.style = .wide
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Patient Login"
        view.backgroundColor = .systemBackground
                
        view.addSubview(phoneNumberTextField)
        view.addSubview(otpField)
        otpField.isHidden = true
        
        view.addSubview(getOTPButton)
        getOTPButton.addTarget(self, action: #selector(getOTPButtonPressed), for: .touchUpInside)
        
        view.addSubview(submitOTPButton)
        submitOTPButton.isHidden = true
        submitOTPButton.addTarget(self, action: #selector(submitOTPButtonPressed), for: .touchUpInside)
        
        view.addSubview(googleSignInButton)
        googleSignInButton.addTarget(self, action: #selector(googleSignInFunction), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate(
            [
                phoneNumberTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
                phoneNumberTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
                phoneNumberTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
                phoneNumberTextField.heightAnchor.constraint(equalToConstant: 50),
                
                otpField.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 20),
                otpField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
                otpField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
                otpField.heightAnchor.constraint(equalToConstant: 50),
                
                getOTPButton.topAnchor.constraint(equalTo: otpField.bottomAnchor, constant: 20),
                getOTPButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
                getOTPButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
                getOTPButton.heightAnchor.constraint(equalToConstant: 40),
                
                submitOTPButton.topAnchor.constraint(equalTo: otpField.bottomAnchor, constant: 20),
                submitOTPButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
                submitOTPButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
                submitOTPButton.heightAnchor.constraint(equalToConstant: 40),
                
                googleSignInButton.topAnchor.constraint(equalTo: getOTPButton.bottomAnchor, constant: 50),
                googleSignInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ]
        )
    }
    
    @objc func getOTPButtonPressed() {
        otpField.isHidden = false
        PhoneAuthProvider.provider()
            .verifyPhoneNumber(phoneNumberTextField.text!, uiDelegate: nil) { verificationID, error in
                if let error = error {
                    print("Error sending code to phone number\(error)")
                    return
                }
                UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
                self.getOTPButton.isHidden = true
                self.submitOTPButton.isHidden = false
            }
    }
    
    @objc func submitOTPButtonPressed() {
        // code to sign in the user using OTP
    }
    
    @objc func googleSignInFunction() {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
          guard error == nil else {
            return
          }

          guard let user = result?.user,
            let idToken = user.idToken?.tokenString
          else {
            return
          }

          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: user.accessToken.tokenString)

            Auth.auth().signIn(with: credential) { result, error in

                let user = Auth.auth().currentUser
                guard let email = user?.email,
                      let uid = user?.uid else { return }
                UserAuthentication.shared.loginPatient(completion: { results in
                    
                    switch results {
                    case .success(let loginPatient):
                        DispatchQueue.main.async {
                            if let controller = self.storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") {
                                self.navigationController?.pushViewController(controller, animated: true)
                                print(loginPatient.response?.id) // Save this id to user defaults
                                UserDefaults.standard.set(loginPatient.response?.id!, forKey: "PatientID")
                            }
                            self.updateUserDetails()
                        }
                    case .failure(let error):
                        print(error)
                        self.registerGoogleUser(email: email, uniqueID: uid)
                    }
                    
                }, email: email, uniqueID: uid)
            }
        }
    }
    
    func registerGoogleUser(email: String, uniqueID: String) {
        UserAuthentication.shared.registerPatient(completion: { results in
            
            switch results {
            case .success(let loginPatient):
                DispatchQueue.main.async {
                    print("Registered New User")
                    if let controller = self.storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") {
                        self.navigationController?.pushViewController(controller, animated: true)
                        print(loginPatient.response?.id) // Save this id to user defaults
                        UserDefaults.standard.set(loginPatient.response?.id!, forKey: "PatientID")
                        // Update User Details
                    }
                }
            case .failure(let error):
                print(error)
            }
        }, email: email, uniqueID: uniqueID)
    }
    
    func updateUserDetails() {
        if let user = Auth.auth().currentUser {
            let name = user.displayName
            let phone = user.phoneNumber
            let imgUrl = user.photoURL?.absoluteString

            UpdateUserDetails.shared.updatePatient(completion: { results in
                switch results {
                case .success(let user):
                    print("Success")
                    DispatchQueue.main.async {
                        print(results)
                    }
                case .failure(let error):
                    print(error)
                }
            }, name: name ?? "", phoneNumber: phone ?? "", imgUrl: imgUrl!)
        }
    }
}
