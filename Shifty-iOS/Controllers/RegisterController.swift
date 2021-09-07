//
//  RegisterController.swift
//  Shifty-iOS
//
//  Created by mac on 07/09/2021.
//

import UIKit

class RegisterController: UIViewController {
    //  MARK: - Properties
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 80)
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.backgroundColor = .white
        view.frame = self.view.bounds
        view.contentSize = contentViewSize
        view.autoresizingMask = .flexibleHeight
        view.bounces = true
        return view
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.frame.size = contentViewSize
        return view
    }()
     
    private lazy var topContainer: CustomTitleView = {
        return CustomTitleView(label: [titleLabel, descriptionLabel], spacing: 16)
    }()
    
    private let titleLabel = UILabel(font: .boldSystemFont(ofSize: 35), text: "Getting Started")
    private let descriptionLabel = UILabel(font: .systemFont(ofSize: 24), text: "Seems you are new here, Let’s set up your profile.")
    
    private lazy var fullnameContainerView = FormInputContainerView(fullnameTextfield, "Full Name", labelContainerWidth: 69)
    private let fullnameTextfield = CustomTextField()
    
    private lazy var emailContainerView = FormInputContainerView(emailTextfield, "Email Address", labelContainerWidth: 92)
    private let emailTextfield = CustomTextField()
    
    private lazy var addressContainerView = FormInputContainerView(addressTextfield, "Current Address", labelContainerWidth: 105)
    private let addressTextfield = CustomTextField()
    
    private lazy var zipcodeContainerView = FormInputContainerView(zipcodeTextfield, "Zip Code", labelContainerWidth: 65)
    private let zipcodeTextfield = CustomTextField()
    
    private lazy var stateContainerView = FormInputContainerView(stateTextfield, "State", labelContainerWidth: 45)
    private let stateTextfield = CustomTextField()
    
    private lazy var passwordContainerView = FormInputContainerView(passwordTextfield, "Password", labelContainerWidth: 68)
    private let passwordTextfield = CustomTextField()
    
    private lazy var passwordConfirmContainerView = FormInputContainerView(passwordConfirmTextfield, "Confirm Password", labelContainerWidth: 114)
    private let passwordConfirmTextfield = CustomTextField()
    
    private lazy var termView: UIView = {
        let view = UIView()
        view.setHeight(height: 40)
        
        checkbox.setDimensions(height: 14, width: 16)
        
        let stack = UIStackView(arrangedSubviews: [checkbox, termAndConditionsLabel])
        
        view.addSubview(stack)
        stack.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
        stack.distribution = .fillProportionally
        stack.alignment = .leading
        stack.spacing = 17
        return view
    }()
    
    private let checkbox: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.fill"), for: .normal)
        button.addTarget(self, action: #selector(handleCheckbox), for: .touchUpInside)
        button.tintColor = #colorLiteral(red: 0.9568627451, green: 0.9607843137, blue: 0.968627451, alpha: 1)
        return button
    }()
    
    private let termAndConditionsLabel = UILabel(text: "By creating an account, you agree to our", size: 12, appendedText: "\nTerm and Conditions")
    
    private lazy var continueButton = createNavigationButton(title: "Continue")

    lazy var alreadyHaveAnAccount = createAttributedButton(text: "Already have an account ?  ", appendedText: "Login")

    //  MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Register"
        configureUI()
        configureNavBar()
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
    
    @objc func handleShowContinue() {
        let vc = LoginController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handleShowLogin() {
        let vc = LoginController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //  MARK: - Helpers

    func configureUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        view.backgroundColor = .white
        descriptionLabel.textColor = UIColor(white: 0, alpha: 0.5)
        
        containerView.addSubview(topContainer)
        topContainer.anchor(top: containerView.safeAreaLayoutGuide.topAnchor, paddingTop: 20)
        topContainer.centerX(inView: containerView)
        
        let subStack = UIStackView(arrangedSubviews: [zipcodeContainerView, stateContainerView])
        subStack.spacing = 15
        subStack.axis = .horizontal
        subStack.distribution = .fillEqually
        
        let stack = UIStackView(arrangedSubviews: [fullnameContainerView, emailContainerView, addressContainerView, subStack, passwordContainerView, passwordConfirmContainerView])
        stack.axis = .vertical
        stack.spacing = 31
        
        containerView.addSubview(stack)
        stack.anchor(top: topContainer.bottomAnchor, left: containerView.leftAnchor, right: containerView.rightAnchor, paddingTop: 31, paddingLeft: 40, paddingRight: 40)
        
        containerView.addSubview(termView)
        termView.centerX(inView: view)
        termView.anchor(top: stack.bottomAnchor, left: stack.leftAnchor, right: stack.rightAnchor, paddingTop: 23)
        
        continueButton.addTarget(self, action: #selector(handleShowContinue), for: .touchUpInside)
        alreadyHaveAnAccount.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        
        let bottomStack = UIStackView(arrangedSubviews: [continueButton, alreadyHaveAnAccount])
        
        containerView.addSubview(bottomStack)
        bottomStack.anchor(top: termView.bottomAnchor, left: containerView.leftAnchor, right: containerView.rightAnchor, paddingTop: 21, paddingLeft: 40, paddingRight: 40)
        bottomStack.axis = .vertical
        bottomStack.spacing = 21
        
    
    }
}
