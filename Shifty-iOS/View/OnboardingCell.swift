//
//  OnboardingCell.swift
//  Shifty-iOS
//
//  Created by mac on 02/09/2021.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    //    MARK: - Properties
    private let topContainerView = TopContainerView(image: "topContainer")
    private let skipButton = UIButton(bgColor: #colorLiteral(red: 0.6296878457, green: 0.4354371428, blue: 0.9175583124, alpha: 1) )
    private let nextButton = UIButton(type: .system)
    private let largeTitleLabel = CustomLabel(text: "Easy Process", font: .boldSystemFont(ofSize: 36), true)
    private let descriptionLabel =  CustomLabel(text: "Find all your house needs in one place. We provide every service to make your home experience smooth.", font: .systemFont(ofSize: 16), false)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        addSubview(topContainerView)
        topContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topContainerView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
        
        topContainerView.addSubview(skipButton)
        skipButton.anchor(top: topContainerView.safeAreaLayoutGuide.topAnchor, right: topContainerView.rightAnchor, paddingTop: 52, paddingRight: 30)
        
        let stack = UIStackView(arrangedSubviews: [largeTitleLabel, descriptionLabel])
        stack.axis = .vertical
        stack.spacing = 10
        
        addSubview(stack)
        stack.centerX(inView: self)
        stack.anchor(top: topContainerView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 49, paddingLeft: 37, paddingRight: 37)
        
       addSubview(nextButton)
        nextButton.anchor(left: leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: rightAnchor, paddingLeft: 40, paddingBottom: 24, paddingRight: 40)
        nextButton.centerX(inView: self)
    }
}
