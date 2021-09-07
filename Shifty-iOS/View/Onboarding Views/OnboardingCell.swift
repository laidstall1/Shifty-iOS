//
//  OnboardingCell.swift
//  Shifty-iOS
//
//  Created by mac on 02/09/2021.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    //    MARK: - Properties
    private lazy var topContainerView: TopContainerView = {
        return TopContainerView(imageView: imageView)
    }()
    
    private let imageView: UIImageView = {
       let iv = UIImageView()
        iv.backgroundColor = .clear
        return iv
    }()
    
    private let largeTitleLabel = CustomOnboardingLabel(text: "Easy Process", font: .boldSystemFont(ofSize: 36), true)
    private let descriptionLabel =  CustomOnboardingLabel(text: "Find all your house needs in one place. We provide every service to make your home experience smooth.", font: .systemFont(ofSize: 16), false)
    
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
        
        let stack = UIStackView(arrangedSubviews: [largeTitleLabel, descriptionLabel])
        stack.axis = .vertical
        stack.spacing = 10
        
        addSubview(stack)
        stack.centerX(inView: self)
        stack.anchor(top: topContainerView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 49, paddingLeft: 37, paddingRight: 37)
    }
    
    func configure(with model: OnboardingSlide) {
        largeTitleLabel.text = model.title
        descriptionLabel.text = model.description
        imageView.image = UIImage(named: model.image)
    }
}
