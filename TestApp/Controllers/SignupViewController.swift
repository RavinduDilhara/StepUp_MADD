//
//  SignupViewController.swift
//  Assignment03
//
//  Created by Ravidu Dilhara on 2022-04-29.
//

import UIKit

class SignupViewController: BaseViewController {
    @IBOutlet weak var topNavigationBarView: TopNavigationView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var password1TextField: UITextField!
    @IBOutlet weak var password2TextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topNavigationBarView.backButton.addTarget(self, action: #selector(self.goToBack(_:)), for: .touchUpInside)
        signupButton.layer.cornerRadius = 5
    }

    
    @IBAction func signupAction(_ sender: Any) {
        let nameInput = nameTextField.text
        let emailInput = emailTextField.text
        let password1Input = password1TextField.text
        let password2Input = password2TextField.text
        
        if nameInput?.count == 0 || emailInput?.count == 0 || password1Input?.count == 0 || password2Input?.count == 0 {
            showAlert(title: "Error", message: "Some Fields Are Missing")
        }else if !isValidEmail(emailInput!){
            showAlert(title: "Error", message: "Please enter a valid email address")
        }else if password1Input != password2Input{
            showAlert(title: "Error", message: "Your passwords do not match")
        }else{
            let storyBoard = UIStoryboard(name: "Main", bundle: .main)
            guard let productListVC = storyBoard.instantiateViewController(withIdentifier: "main_tab_bar_vc") as? MainTabBarController else {
                return
            }
            self.navigationController?.pushViewController(productListVC, animated: true)
        }
    }
}
