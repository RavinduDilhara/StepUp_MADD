//
//  LoginViewController.swift
//  Assignment03
//
//  Created by Ravidu Dilhara on 2022-04-29.
//

import UIKit

class LoginViewController: BaseViewController {
    @IBOutlet weak var topNavigationBarView: TopNavigationView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let USERNAME:String = "ravidu@sliit.lk"
    let PASSWORD:String = "password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topNavigationBarView.backButton.addTarget(self, action: #selector(self.goToBack(_:)), for: .touchUpInside)
        loginButton.layer.cornerRadius = 5
    }

    @IBAction func loginAction(_ sender: Any) {
        
        let inputUserName = userNameTextField.text
        let inputPassword = passwordTextField.text
        
        if (inputUserName?.count == 0 || inputPassword?.count == 0){
            self.showAlert(title: "Error", message: "User Name Or Email Cannot Be Empty")
        }else if !isValidEmail(inputUserName!){
            self.showAlert(title: "Error", message: "Please enter a valid email address")
        }else if (USERNAME != inputUserName || PASSWORD != inputPassword){
            self.showAlert(title: "Error", message: "Your username or password is incorrect")
        }else if (USERNAME == inputUserName && PASSWORD == inputPassword){
            let storyBoard = UIStoryboard(name: "Main", bundle: .main)
            guard let productListVC = storyBoard.instantiateViewController(withIdentifier: "main_tab_bar_vc") as? MainTabBarController else {
                return
            }
            self.navigationController?.pushViewController(productListVC, animated: true)
        }
    }
    
}
