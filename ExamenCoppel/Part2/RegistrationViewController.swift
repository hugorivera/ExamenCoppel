//
//  RegistrationViewController.swift
//  ExamenCoppel
//
//  Created by Hugo Rivera on 12/11/24.
//

import UIKit

protocol RegistrationViewControllerInput: AnyObject {
    func registrationSuccess()
    func registrationFailure(message: String)
}

protocol RegistrationViewControllerOutput: AnyObject {
    func register(user: InfoUser)
}

class RegistrationViewController: UIViewController {
    
    var interactor: RegistrationInteractorInput?
    var router: RegistrationRoutingLogic?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var registerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        activityIndicator.stopAnimating()
        title = "Registro"
        navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(close))
    }
    
    @IBAction func registerTapped(_ sender: Any) {
        registerButton.isEnabled = false
        activityIndicator.startAnimating()
        let user = InfoUser(name: nameTextField.text ?? "", email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
        interactor?.register(user: user)
    }
    
    func resetForm() {
        nameTextField.text = ""
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    @objc func close() {
        router?.goBack()
    }

}

extension RegistrationViewController: RegistrationViewControllerInput {
    func registrationFailure(message: String) {
        activityIndicator.stopAnimating()
        router?.showRegisterError(message: message)
        registerButton.isEnabled = true
    }
    
    func registrationSuccess() {
        activityIndicator.stopAnimating()
        router?.showRegistrationSuccess()
        resetForm()
        registerButton.isEnabled = true
    }
}
