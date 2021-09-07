//
//  CustomLoginTextfield.swift
//  Shifty-iOS
//
//  Created by mac on 06/09/2021.
//

import UIKit

class CustomMobileTextfieldView: UIView {
    init(textfield1: UITextField, textfield2: UITextField) {
        super.init(frame: .zero)
        
        setDimensions(height: 115, width: 295)
        layer.borderWidth = 1
        layer.borderColor = UIColor(white: 0.6, alpha: 0.3).cgColor
        layer.cornerRadius = 15
        
        let dividerView = UIView()
        dividerView.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        dividerView.setHeight(height: 0.75)
        
        let textView1 = UIView()
        textView1.addSubview(textfield1)
        textfield1.anchor(top: textView1.topAnchor, left: textView1.leftAnchor, bottom: textView1.bottomAnchor, right: textView1.rightAnchor, paddingTop: 15, paddingLeft: 24, paddingBottom: 15, paddingRight: 24)
        
        let textView2 = UIView()
        textView2.addSubview(textfield2)
        textfield2.anchor(top: textView2.topAnchor, left: textView2.leftAnchor, bottom: textView2.bottomAnchor, right: textView2.rightAnchor, paddingTop: 15, paddingLeft: 24, paddingBottom: 15, paddingRight: 24)
        
        let stack = UIStackView(arrangedSubviews: [textView1, dividerView, textView2])
        stack.axis = .vertical
        stack.spacing = 0
        stack.distribution = .fillProportionally
        
        addSubview(stack)
        stack.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


