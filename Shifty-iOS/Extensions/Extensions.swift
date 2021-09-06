//
//  Extensions.swift
//  Shifty-iOS
//
//  Created by mac on 01/09/2021.
//

import UIKit

extension UIButton {
    convenience init(bgColor: UIColor) {
        self.init()
        setTitle("Skip", for: .normal)
        layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1).cgColor
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        setWidth(width: 69)
        setHeight(height: 41)
        alpha = 0.8
        layer.cornerRadius = 41 / 2
    }
}

extension UIButton {
    convenience init(buttonType: ButtonType, title: String) {
        self.init()
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.4196078431, blue: 0.1333333333, alpha: 1)
        titleLabel?.font = .boldSystemFont(ofSize: 14)
        setHeight(height: 56)
        layer.cornerRadius = 16
    }
}

extension UIViewController {
    
    func configureNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles =  true
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.overrideUserInterfaceStyle = .dark
    }
}



