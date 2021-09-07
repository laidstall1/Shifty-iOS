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

extension UILabel {
    convenience init(font: UIFont, text: String) {
        self.init()
        self.font = font
        self.text = text
        numberOfLines = 0
    }
}

extension UILabel {
    convenience init(text: String, appendedText: String) {
        self.init()
        let attributedTitle = NSMutableAttributedString(string: text, attributes: [.font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor: UIColor.secondaryLabel ])
            attributedTitle.append(NSAttributedString(string: appendedText, attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.secondaryLabel]))
        textAlignment = .center
        attributedText = attributedTitle
        
    }
}

extension UIButton {
    convenience init(buttonType: UIButton.ButtonType = .system, text: String, appendedText: String) {
        self.init()
        let attributedTitle = NSMutableAttributedString(string: text, attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.secondaryLabel ])
        attributedTitle.append(NSAttributedString(string: appendedText, attributes: [.font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor: UIColor.orange ]))
        setAttributedTitle(attributedTitle, for: .normal)
    }
}

extension UILabel {
    convenience init(text: String, size: CGFloat, appendedText: String) {
        self.init()
        let attributedTitle = NSMutableAttributedString(string: text, attributes: [.font: UIFont.systemFont(ofSize: size), .foregroundColor: UIColor.secondaryLabel])
            attributedTitle.append(NSAttributedString(string: appendedText, attributes: [.font: UIFont.boldSystemFont(ofSize: size), .foregroundColor: UIColor.orange]))
        textAlignment = .left
        numberOfLines = 0
        attributedText = attributedTitle
    }
}

extension UIViewController {
    func configureNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles =  false
        navigationItem.backButtonTitle = ""
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.overrideUserInterfaceStyle = .dark
    }
    
    func createAttributedButton(text: String, appendedText: String) -> UIButton {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: text, attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.secondaryLabel ])
        attributedTitle.append(NSAttributedString(string: appendedText, attributes: [.font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor: UIColor.orange ]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }
    
    func createNavigationButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.4196078431, blue: 0.1333333333, alpha: 1)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.setHeight(height: 56)
        button.layer.cornerRadius = 16
        
        return button
    }
}



