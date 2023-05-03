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
	
	private let errorLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .systemFont(ofSize: 15)
		label.textColor = .red
		label.numberOfLines = 2
		label.textAlignment = .center
		return label
	}()
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
//		let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
//
//		let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
//		loadingIndicator.hidesWhenStopped = true
//		loadingIndicator.style = UIActivityIndicatorView.Style.medium
//		loadingIndicator.startAnimatin g();
//
//		alert.view.addSubview(loadingIndicator)
//		present(alert, animated: true, completion: nil)
//
//		alert.dismiss(animated: true, completion: nil)
//		print("dismissed")
		
		if Auth.auth().currentUser != nil {
//			if let controller = self.storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") {
//				print(Auth.auth().currentUser?.displayName ?? Auth.auth().currentUser?.phoneNumber ?? "No User Data")
//				self.navigationController?.pushViewController(controller, animated: true)
//			}
			do {
				try Auth.auth().signOut()
				print("User Signed Out")
			} catch {
				print(error)
			}
			
		}
	}

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Patient Login"
        view.backgroundColor = .systemBackground
		
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Resend", style: .done, target: self, action: #selector(getOTPButtonPressed))
                
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
		
		view.addSubview(errorLabel)
		errorLabel.isHidden = true
		
		
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
				
				errorLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
				errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
				errorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
            ]
        )
    }
    
	@objc func getOTPButtonPressed() {
		
		if phoneNumberTextField.text?.count != 10 {
			errorLabel.text = "Please enter a valid Indian Phone Number"
			errorLabel.isHidden = false
			return
		} else {
			otpField.isHidden = false
		}
		
		if let phonNumberText = phoneNumberTextField.text {
			let phonNumberTextWithIndCode = phonNumberText.addIndianPhoneCode()
			PhoneAuthProvider.provider()
				.verifyPhoneNumber(phonNumberTextWithIndCode, uiDelegate: nil) { verificationID, error in
					if let error = error {
						print("Error sending code to phone number\(error)")
						self.errorLabel.text = "Error sending code to phone number. Please try again later. Or check if the phone number entered is correct"
						self.errorLabel.isHidden = false
						return
					}
					UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
					self.getOTPButton.isHidden = true
					self.submitOTPButton.isHidden = false
				}
		}
	}
	
	@objc func submitOTPButtonPressed() {
		
		DispatchQueue.main.async {
			self.phoneNumberTextField.resignFirstResponder()
		}
		
		
		if let verificationID = UserDefaults.standard.string(forKey: "authVerificationID"),
		   let userOTP = otpField.text {
			
			let credential = PhoneAuthProvider.provider().credential(
				withVerificationID: verificationID,
				verificationCode: userOTP
			)
			
			Auth.auth().signIn(with: credential) { authResult, error in
				if let error = error {
					print(error.localizedDescription)
					self.errorLabel.text = "Invalid OTP. Please enter the correct OTP. Or Request for a new one"
					self.errorLabel.isHidden = false
					return
				}
				DispatchQueue.main.async {
					print("User Verified")
					UserAuthentication.shared.loginPatient(completion: { results in
						switch results {
						case .success(let loginPatient):
							DispatchQueue.main.async {
								if let controller = self.storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") {
									self.navigationController?.pushViewController(controller, animated: true)
								}
								print(loginPatient)
								print("Logged In User")
//								print(loginPatient.response?.id)
								UserDefaults.standard.setValue(loginPatient.response?.id!, forKey: "PatientID")//  Save This to User Defaults
							}
						case .failure(let error):
							if error as! APIError == APIError.UserNotFound {
								DispatchQueue.main.async {
									self.registerPhoneNumber(pNumber: self.phoneNumberTextField.text ?? "123")
								}
							} else {
								print("error before registering")
								print(error)
								self.errorLabel.text = "Server is offline. Please try again later"
								self.errorLabel.isHidden = false
							}
						}
					}, email: nil, uniqueID: nil, pNumber: self.phoneNumberTextField.text)
				}
				return
			}
		}
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
//                                print(loginPatient.response!.id) // Save this id to user defaults
								UserDefaults.standard.setValue(loginPatient.response?.id!, forKey: "PatientID")
                            }
//                            self.updateUserDetails()
                        }
                    case .failure(let error):
						if error as! APIError == APIError.UserNotFound {
							self.registerGoogleUser(email: email, uniqueID: uid)
						} else {
							print("error before registering")
							   print(error)
							   self.errorLabel.text = "Server is offline. Please try again later"
							   self.errorLabel.isHidden = false
						   }
                    }
                }, email: email, uniqueID: uid, pNumber: nil)
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
//                        print(loginPatient.response!.id) // Save this id to user defaults
						UserDefaults.standard.setValue(loginPatient.response?.id!, forKey: "PatientID")
						self.updateUserDetails()
                    }
                }
            case .failure(let error):
                print(error)
				let alert = UIAlertController(title: "We Were Unable To Verify Your Account.", message: "Please Try Again Later", preferredStyle: .actionSheet)
				alert.addAction(UIAlertAction(title: "OK", style: .default))
				self.present(alert, animated: true)
            }
          }, email: email, uniqueID: uniqueID, pNumber: nil)
    }
    
    func updateUserDetails() {
        if let user = Auth.auth().currentUser {
            let name = user.displayName
            let phone = user.phoneNumber
            let imgUrl = user.photoURL?.absoluteString

            UpdateUserDetails.shared.updatePatient(completion: { results in
                switch results {
                case .success(let user):
                    DispatchQueue.main.async {
						print(user)
                        print(results)
                    }
                case .failure(let error):
                    print(error)
                }
            }, name: name ?? "", phoneNumber: phone ?? "", imgUrl: imgUrl!)
		}
    }
	
	func registerPhoneNumber(pNumber: String) {
		UserAuthentication.shared.registerPatient(completion: { results in
			
			switch results {
			case .success(let loginPatient):
				DispatchQueue.main.async {
					print("Registered New Phone Number")
					if let controller = self.storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") {
						self.navigationController?.pushViewController(controller, animated: true)
//						print(loginPatient.response!.id) // Save this id to user defaults
						UserDefaults.standard.setValue(loginPatient.response?.id!, forKey: "PatientID")
					}
				}
			case .failure(let error):
				print(error)
				let alert = UIAlertController(title: "We Were Unable To Verify Your Account.", message: "Please Try Again Later", preferredStyle: .actionSheet)
				alert.addAction(UIAlertAction(title: "OK", style: .default))
				self.present(alert, animated: true)
			}
		}, email: nil, uniqueID: nil, pNumber: pNumber)
	}
}
