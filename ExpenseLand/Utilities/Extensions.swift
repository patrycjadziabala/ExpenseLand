//
//  Extensions.swift
//  ExpenseLand
//
//  Created by Patka on 24/08/2023.
//

import Foundation
import UIKit
import SwiftUI

extension DateFormatter {
    static let allNumeric: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YYYY"
        
        return formatter
    }()
}

extension Date {
    func toString() -> String {
        DateFormatter.allNumeric.string(from: self)
    }
}

extension UIColor {
    private func makeColor(componentDelta: CGFloat) -> UIColor {
        var red: CGFloat = 0
        var blue: CGFloat = 0
        var green: CGFloat = 0
        var alpha: CGFloat = 0
        
        // Extract r,g,b,a components from the
        // current UIColor
        getRed(
            &red,
            green: &green,
            blue: &blue,
            alpha: &alpha
        )
        
        // Create a new UIColor modifying each component
        // by componentDelta, making the new UIColor either
        // lighter or darker.
        return UIColor(
            red: add(componentDelta, toComponent: red),
            green: add(componentDelta, toComponent: green),
            blue: add(componentDelta, toComponent: blue),
            alpha: alpha
        )
    }
}

extension UIColor {
    // Add value to component ensuring the result is
    // between 0 and 1
    private func add(_ value: CGFloat, toComponent: CGFloat) -> CGFloat {
        return max(0, min(1, toComponent + value))
    }
}

extension UIColor {
    func lighter(componentDelta: CGFloat = 0.1) -> UIColor {
        return makeColor(componentDelta: componentDelta)
    }
    
    func darker(componentDelta: CGFloat = 0.1) -> UIColor {
        return makeColor(componentDelta: -1*componentDelta)
    }
}

extension Color {
    static let customBlue = Color("CustomBlue")
    static let customLightBlue = Color("CustomLightBlue")
    static let customFadedGreen = Color("CustomFadedGreen")
    static let customLightGreen = Color("CustomLightGreen")
    static let customLightPink = Color("CustomLightPink")
    static let customLightPurple = Color("CustomLightPurple")
    static let customLightYellow = Color("CustomLightYellow")
    static let customOrange = Color("CustomOrange")
    static let customRed = Color("CustomRed")
}
