//
//  HomeController.swift
//  Shifty-iOS
//
//  Created by mac on 02/09/2021.
//

import UIKit

class WelcomeMobileController: UIViewController {
    
    //  MARK: - Properties
    
    private lazy var topContainer: CustomTitleView = {
        return CustomTitleView(label: [titleLabel, descriptionLabel], spacing: 6)
    }()
    
    private let titleLabel = UILabel(font: .boldSystemFont(ofSize: 35), text: "Welcome")
    private let descriptionLabel = UILabel(font: .systemFont(ofSize: 24), text: "Enter your phone number to get started.")

    
    private lazy var mobileInputView: CustomMobileTextfieldView = {
        return CustomMobileTextfieldView(textfield1: countryTextfield, textfield2: phoneNumberTextfield)
    }()
    
    private lazy var countryTextfield = createTextfield()
    private lazy var phoneNumberTextfield = createTextfield()
    
    private let privacyLabel: UILabel = {
       let lbl = UILabel()
        lbl.text = "Privacy and agreements"
        lbl.font = .boldSystemFont(ofSize: 14)
        lbl.textAlignment = .center
        return lbl
    }()
    
    private lazy var continueButton = createNavigationButton(title: "Continue")

    //  MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavBar()
        configureUI()
        navigationController?.navigationBar.isHidden = false
    }
    
    //  MARK: - Selectors
    
    @objc func handleContinue() {
        guard let text = phoneNumberTextfield.text, !text.isEmpty else { return }
        
        let vc = OTPVerificationController()
        vc.phoneNumberText = text
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
        
        phoneNumberTextfield.text = ""
    }
    
    //  MARK: - Helpers
    
    func createTextfield() -> UITextField {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 14)
        tf.clipsToBounds = true
        return tf
    }
    
    fileprivate func configureTextfields() {
        countryTextfield.text = "United States(+1)"
        countryTextfield.isEnabled = false
        phoneNumberTextfield.placeholder = "Phone number"
        phoneNumberTextfield.keyboardType = .numberPad
        phoneNumberTextfield.delegate = self
    }
    
    func configureUI() {
        descriptionLabel.textColor = .secondaryLabel
        
        view.addSubview(topContainer)
        topContainer.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 20)
        topContainer.centerX(inView: view)
        
        view.addSubview(mobileInputView)
        mobileInputView.anchor(top: topContainer.bottomAnchor, paddingTop: 29)
        mobileInputView.centerX(inView: view)
        
        configureTextfields()
        
        continueButton.addTarget(self, action: #selector(handleContinue), for: .touchUpInside)
        
        let bottomStack = UIStackView(arrangedSubviews: [privacyLabel, continueButton])
        view.addSubview(bottomStack)
        bottomStack.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 40, paddingBottom: 30, paddingRight: 40)
        bottomStack.axis = .vertical
        bottomStack.spacing = 17
    }
}
extension WelcomeMobileController: UITextFieldDelegate {
    func textField(_ textField: UITextField,
      shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
      let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
      return (string.rangeOfCharacter(from: invalidCharacters) == nil)
    }
}
