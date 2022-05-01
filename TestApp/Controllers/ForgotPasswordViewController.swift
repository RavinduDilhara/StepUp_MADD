//
//  ForgotPasswordViewController.swift
//  Assignment03
//
//  Created by Ravidu Dilhara on 2022-04-29.
//

import UIKit

class ForgotPasswordViewController: BaseViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var topNavigationBarView: TopNavigationView!
    @IBOutlet weak var sendResetLinkButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topNavigationBarView.backButton.addTarget(self, action: #selector(self.goToBack(_:)), for: .touchUpInside)
        sendResetLinkButton.layer.cornerRadius = 8
        
    }

    @IBAction func resendPasswordAction(_ sender: Any) {
        let emailInput = emailTextField.text
        
        if (!isValidEmail(emailInput!)){
            showAlert(title: "Error", message: "Please enter a valid email address")
        }else{
            let alertController = UIAlertController(title: "Password reset link sent to your inbox", message: "Please login to your mail and click on the reset link to password reset", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: .default) { (UIAlertAction) in
                let storyBoard = UIStoryboard(name: "Main", bundle: .main)
                guard let resetPasswordVC = storyBoard.instantiateViewController(withIdentifier: "reset_password_vc") as? ResetPasswordViewController else {
                    return
                }
                self.navigationController?.pushViewController(resetPasswordVC, animated: true)
            }
            alertController.addAction(closeAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
