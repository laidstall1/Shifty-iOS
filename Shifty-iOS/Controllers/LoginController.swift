//
//  HomeController.swift
//  Shifty-iOS
//
//  Created by mac on 02/09/2021.
//

import UIKit

class LoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavBar()
        navigationController?.navigationItem.title = "Login"
        if Core.shared.isNewUser() {
            let vc = OnboardingController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
}
