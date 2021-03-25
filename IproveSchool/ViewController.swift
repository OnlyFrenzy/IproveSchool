//
//  ViewController.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 17.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var loginTextfield: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var signInButton: CustomButton!
    @IBOutlet private weak var signUpButton: CustomButton!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGestureReconisers()
        setupTextField()
        keyBoardNotifications()
        
        // Do any additional setup after loading the view.
    }
    
    deinit {
        removeKeyBoardNotifications()
    }
    
    func keyBoardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyBoardNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height + 10, right: 0.0)
        
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        
    }
    
    func setupGestureReconisers() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    func setupButton () {
        signInButton.addTarget(self, action: #selector(didClickSignInButton), for: .touchUpInside)
    }
    
    func setupTextField () {
        self.loginTextfield.delegate = self
        self.passwordTextField.delegate = self
        self.scrollView.delegate = self
        loginTextfield.returnKeyType = .next
        passwordTextField.returnKeyType = .done
    }
    
    @objc
    func didClickSignInButton () {
        
    }
    
    @objc
    func hideKeyboard() {
        loginTextfield.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
}

//MARK: TextField Delegate

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchBasedNextTextField(textField)
        return true
        
    }
    
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case self.loginTextfield:
            self.passwordTextField.becomeFirstResponder()
        default:
            self.passwordTextField.resignFirstResponder()
        }
    }
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsets = scrollView.contentOffset.y
        var tmpFontSize = 36 - (contentOffsets)
        if tmpFontSize > 63 {
            tmpFontSize = 63
        }
        let fontSize = max(36, tmpFontSize)
        titleLabel.font = titleLabel.font.withSize(fontSize)
    }
}

