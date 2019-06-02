//
//  UserDefaultUtil.swift
//  FirstPractice
//
//  Created by 유현재 on 21/04/2019.
//  Copyright © 2019 유현재. All rights reserved.
//

import Foundation

class UserDefaultUtil {
    enum Key: String {
        case width
        case height
    }
    
    static func userDefault() -> UserDefaults {
        return UserDefaults(suiteName: "FirstPractice")!
    }
    
    static func setViewWidthFrame(saveWidth: Int) {
        let userDefaults = self.userDefault()
        userDefaults.set(saveWidth, forKey: Key.width.rawValue)
        userDefaults.synchronize()
    }
    
    static func setViewWidthFrame(saveHeight: Int) {
        let userDefaults = self.userDefault()
        userDefaults.set(saveHeight, forKey: Key.height.rawValue)
        userDefaults.synchronize()
    }
    
    static func getWidthFrame() -> Int {
         return userDefault().integer(forKey: Key.width.rawValue)
    }
    
    static func getHeightFrame() -> Int {
        return userDefault().integer(forKey: Key.height.rawValue)
    }
}
