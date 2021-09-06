//
//  HomeController.swift
//  Shifty-iOS
//
//  Created by mac on 02/09/2021.
//

import UIKit

class WelcomeMobileController: UIViewController {
    
    //  MARK: - Properties
    
    private lazy var topContainer: CustomMobileTitleView = {
        return CustomMobileTitleView(label: [titleLabel, descriptionLabel])
    }()
    
    private lazy var titleLabel = createTextLabel(font: .boldSystemFont(ofSize: 35), text: "Welcome")
    private lazy var descriptionLabel = createTextLabel(font: .systemFont(ofSize: 28), text: "Enter your phone number to get started.")

    
    private lazy var mobileInputView: CustomLoginTextfieldView = {
        return CustomLoginTextfieldView(textfield1: countryTextfield, textfield2: phoneNumberTextfield)
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
    
    private let continueButton = UIButton(buttonType: .system, title: "Continue")

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
        
    }
    
    //  MARK: - Helpers
    
    func createTextfield() -> UITextField {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 14)
        tf.clipsToBounds = true
        return tf
    }
    
    func createTextLabel(font: UIFont, text: String) -> UILabel {
        let lbl = UILabel()
        lbl.font = font
        lbl.clipsToBounds = true
        lbl.text = text
        lbl.numberOfLines = 0
        return lbl
    }
    
    func configureUI() {
        descriptionLabel.textColor = .secondaryLabel
        
        view.addSubview(topContainer)
        topContainer.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 20)
        topContainer.centerX(inView: view)
        
        view.addSubview(mobileInputView)
        mobileInputView.anchor(top: topContainer.bottomAnchor, paddingTop: 29)
        mobileInputView.centerX(inView: view)
        
        countryTextfield.text = "United States(+1)"
        countryTextfield.isEnabled = false
        phoneNumberTextfield.placeholder = "Phone number"
        
        continueButton.addTarget(self, action: #selector(handleContinue), for: .touchUpInside)
        
        let bottomStack = UIStackView(arrangedSubviews: [privacyLabel, continueButton])
        view.addSubview(bottomStack)
        bottomStack.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 40, paddingBottom: 30, paddingRight: 40)
        bottomStack.axis = .vertical
        bottomStack.spacing = 17
    }
}
