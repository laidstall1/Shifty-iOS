//
//  OTPVerificationController.swift
//  Shifty-iOS
//
//  Created by mac on 07/09/2021.
//

import UIKit

class OTPVerificationController: UIViewController {
    //  MARK: - Properties
    
    private lazy var authTitleView =  CustomTitleContainerView(label: [authCodeTitleLabel, phoneNumberLabel], height: 48, width: 300)
    
    private lazy var authCodeTitleLabel = createTextLabel(font: .systemFont(ofSize: 14), text: "An Authentication code has been sent to", textColor: UIColor.secondaryLabel)
    private lazy var phoneNumberLabel = createTextLabel(font: .boldSystemFont(ofSize: 14), text: "((+1) 999 999 999)", textColor: #colorLiteral(red: 0.9940780997, green: 0.4181196392, blue: 0.1347227097, alpha: 1))
    
    var phoneNumberText = String()
    
    private lazy var otpTextfield1 = createTextField()
    private lazy var otpTextfield2 = createTextField()
    private lazy var otpTextfield3 = createTextField()
    private lazy var otpTextfield4 = createTextField()
    
    private lazy var submitButton = createNavigationButton(title: "Submit")
    private let codeSentResendCodeLabel = UILabel(text: "Code Sent. ", appendedText: "Resend Code in")
    
    //  MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNavBar()
        phoneNumberLabel.text = phoneNumberText
    }
        
    //  MARK: - Selectors
    
    @objc func handleSubmit() {
        let vc = RegisterController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    //  MARK: - Helpers
    
    func createTextLabel(font: UIFont, text: String, textColor: UIColor) -> UILabel {
        let lbl = UILabel()
        lbl.font = font
        lbl.clipsToBounds = true
        lbl.text = text
        lbl.numberOfLines = 0
        lbl.textColor = textColor
        lbl.textAlignment = .center
        return lbl
    }
    
    func createTextField() -> UITextField {
        let tf = UITextField()
        tf.setDimensions(height: 62, width: 48)
        tf.layer.borderColor = #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 8
        tf.font = UIFont.boldSystemFont(ofSize: 36)
        tf.textAlignment = .center
        tf.textColor = .black
        tf.keyboardType = .numberPad
        tf.delegate = self
        return tf
    }
    
    func configureUI() {
        view.backgroundColor = .white
        title = "OTP Verification"
        
        view.addSubview(authTitleView)
        authTitleView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 20)
        authTitleView.centerX(inView: view)
        
        let otpStack = UIStackView(arrangedSubviews: [CustomOTPView(textfield: otpTextfield1), CustomOTPView(textfield: otpTextfield2), CustomOTPView(textfield: otpTextfield3), CustomOTPView(textfield: otpTextfield4)])
        otpStack.axis = .horizontal
        otpStack.spacing = 13
        
        view.addSubview(otpStack)
        otpStack.centerX(inView: view)
        otpStack.anchor(top: authTitleView.bottomAnchor, paddingTop: 34)
    
        submitButton.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
        
        let bottomStack = UIStackView(arrangedSubviews: [submitButton, codeSentResendCodeLabel])
        
        view.addSubview(bottomStack)
        bottomStack.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 40, paddingBottom: 30, paddingRight: 40)
        bottomStack.axis = .vertical
        bottomStack.spacing = 17
        
    }
}

extension OTPVerificationController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
        let result = string.rangeOfCharacter(from: invalidCharacters) == nil
        
        let maxLength = 1
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
           return newString.length <= maxLength && result
    }
}


