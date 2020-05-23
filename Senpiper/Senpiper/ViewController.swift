//
//  ViewController.swift
//  Senpiper
//
//  Created by Pavan Kalyan Jonnadula on 22/05/20.
//  Copyright © 2020 Pavan Kalyan Jonnadula. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBAction func secureTextAction(_ sender: Any) {
        if pwdTextField.isSecureTextEntry{
            pwdTextField.isSecureTextEntry = false
        }
        else{
            pwdTextField.isSecureTextEntry = true

        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setPropetsToVeiw()
        emailTextField.delegate = self
        pwdTextField.delegate = self
    }
    func setPropetsToVeiw(){
        loginView.layer.shadowColor = UIColor.black.cgColor
        loginView.layer.shadowRadius = 10
        loginView.layer.shadowOpacity = 0.2
        loginView.layer.cornerRadius = 0.5
        loginView.layer.shadowOffset = .zero
        loginView.isHidden = false
        viewSlideInFromLeftToRight(views: loginView)
        pwdTextField.text = "Abc00011"
        emailTextField.text = "abc@xyz.text"
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func viewSlideInFromLeftToRight(views: UIView) {
        var transition: CATransition? = nil
        transition = CATransition()
        transition!.duration = 1.5
        transition!.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition!.type = CATransitionType.push
        transition!.subtype = CATransitionSubtype.fromLeft
        transition!.delegate = self as? CAAnimationDelegate
        views.layer.add(transition!, forKey: nil)
    }
    @IBAction func signinBtnAction(_ sender: Any) {
        
        let backgroudView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        backgroudView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        
        let jeremyGif = UIImage.gifImageWithName("correct-check-animation")
        let imageView = UIImageView(image: jeremyGif)
        imageView.frame = CGRect(x: 40, y: 0, width: self.view.frame.size.width - 80, height: self.view.frame.size.height)
        imageView.contentMode = .scaleAspectFit
        backgroudView.addSubview(imageView)
        backgroudView.bringSubviewToFront(imageView)
        self.view.addSubview(backgroudView)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.navigateToUsers()
        }
    }
    
    func navigateToUsers(){
            let usersVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "UsersViewController") as! UsersViewController
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            self.navigationController?.pushViewController(usersVC, animated: true)
    }
}
