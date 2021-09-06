//
//  Core.swift
//  Shifty-iOS
//
//  Created by mac on 02/09/2021.
//

import UIKit

class Core {
    static let shared = Core()
    
    func isNewUser() -> Bool {
        return  !UserDefaults.standard.bool(forKey: "newUser")
    }
    
    func setIsNotNewUser() {
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
}
