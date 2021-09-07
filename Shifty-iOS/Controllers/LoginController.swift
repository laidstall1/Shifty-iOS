//
//  LoginController.swift
//  Shifty-iOS
//
//  Created by mac on 07/09/2021.
//

import UIKit

class LoginController: UIViewController {

    //  MARK: - Properties
    
    private lazy var topContainer: CustomTitleView = {
        return CustomTitleView(label: [titleLabel, descriptionLabel], spacing: 6)
    }()
    
    private let titleLabel = UILabel(font: .boldSystemFont(ofSize: 35), text: "Let's Sign You In")
    private let descriptionLabel = UILabel(font: .systemFont(ofSize: 24), text: "Welcome back, you’ve been missed!")
    
    private lazy var emailContainerView = FormInputContainerView(emailTextfield, "Email Address", labelContainerWidth: 92)
    private let emailTextfield = CustomTextField()
    
    private lazy var passwordContainerView = FormInputContainerView(passwordTextfield, "Password", labelContainerWidth: 68)
    private let passwordTextfield = CustomTextField()
    
    private let checkbox: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.fill"), for: .normal)
        button.setDimensions(height: 14, width: 16)
        button.addTarget(self, action: #selector(handleCheckbox), for: .touchUpInside)
        button.tintColor = #colorLiteral(red: 0.9568627451, green: 0.9607843137, blue: 0.968627451, alpha: 1)
        return button
    }()
    
    private lazy var rememberMeLabel = UILabel(text: "Remember Me", appendedText: "")
    private lazy var forgotPasswordButton = createUIButton(text: "Forgot Password?")
    
    private lazy var loginButton = createNavigationButton(title: "Login")
    private let orLabel = UILabel(font: .boldSystemFont(ofSize: 12), text: "OR")
    private lazy var continueWithGoogleButton = createNavigationButton(title: "Continue with Google")
    private lazy var dontHaveAnAccountsignUpButton = createAttributedButton(text: "Don't have an account? ", appendedText: "Sign Up")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNavBar()
        title = ""
    }

    //  MARK: - Selectors
    
    @objc func handleCheckbox() {
         checkbox.image(for: .normal) == UIImage(systemName: "square.fill") ? showSupplementaryImage() : showButtonImage()
    }
    
    func showSupplementaryImage() {
        checkbox.tintColor = #colorLiteral(red: 0.9940780997, green: 0.4181196392, blue: 0.1347227097, alpha: 1)
        checkbox.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
    }
    
    func showButtonImage() {
        checkbox.tintColor = #colorLiteral(red: 0.9568627451, green: 0.9607843137, blue: 0.968627451, alpha: 1)
        checkbox.setImage(UIImage(systemName: "square.fill"), for: .normal)
    }
    
    @objc func handleShowSignup() {
        let vc = RegisterController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //  MARK: - Helpers
    
    func createUIButton(text: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(text, for: .normal)
        button.tintColor = .orange
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        return button
    }
    
    func configureUI() {
        view.backgroundColor = .white
        descriptionLabel.textColor = .secondaryLabel
        
        view.addSubview(topContainer)
        topContainer.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 20)
        topContainer.centerX(inView: view)
        
        let stack = UIStackView(arrangedSubviews: [ emailContainerView, passwordContainerView])
        stack.axis = .vertical
        stack.spacing = 32
        
        view.addSubview(stack)
        stack.anchor(top: topContainer.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 31, paddingLeft: 40, paddingRight: 40)
        
        let passStack = UIStackView(arrangedSubviews: [checkbox, rememberMeLabel])
        
        passStack.distribution = .fill
        passStack.spacing = 17
        
        let horizontalStack = UIStackView(arrangedSubviews: [passStack, forgotPasswordButton])
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = .equalSpacing
        
        view.addSubview(horizontalStack)
        horizontalStack.anchor(top: stack.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 24, paddingLeft: 40, paddingRight: 40)
        
        orLabel.textAlignment = .center
        orLabel.textColor = #colorLiteral(red: 0.5607843137, green: 0.5725490196, blue: 0.631372549, alpha: 1)
        
        continueWithGoogleButton.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9647058824, blue: 0.9725490196, alpha: 1)
        continueWithGoogleButton.setTitleColor(#colorLiteral(red: 0.09019607843, green: 0.09019607843, blue: 0.09019607843, alpha: 1), for: .normal)
        
        dontHaveAnAccountsignUpButton.addTarget(self, action: #selector(handleShowSignup), for: .touchUpInside)
        
        let bottomStack = UIStackView(arrangedSubviews: [loginButton, orLabel, continueWithGoogleButton, dontHaveAnAccountsignUpButton])
        
        view.addSubview(bottomStack)
        bottomStack.anchor(top: horizontalStack.bottomAnchor, left: horizontalStack.leftAnchor, right: horizontalStack.rightAnchor, paddingTop: 24)
        bottomStack.axis = .vertical
        bottomStack.spacing = 16
    }
}

