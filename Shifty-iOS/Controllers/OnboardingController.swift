//
//  ViewController.swift
//  Shifty-iOS
//
//  Created by mac on 01/09/2021.
//

import UIKit

class OnboardingController: UIViewController {

    //    MARK: - Properties
    
    private let topContainer = topContainerView(image: "topContainer")
    
    
    //    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }

    //    MARK: - Selectors
    
    
    //    MARK: - Helpers
    func configureUI() {
        view.addSubview(topContainer)
        topContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topContainer.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
    }
}

