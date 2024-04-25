//
//  UIFont + Extensions.swift
//  Drevmass
//
//  Created by Мерей Булатова on 08.04.2024.
//

import UIKit

extension UIFont {
    enum SFProDisplayWeight: String {
        case regular = "Regular"
        case bold = "Bold"
        case semibold = "Semibold"
    }

    static func sfProDisplay(ofSize size: Double, weight: SFProDisplayWeight) -> UIFont {
        return getFont(withName: "SFProDisplay-\(weight.rawValue)", size: size)
    }

    private static func getFont(withName name: String, size: Double) -> UIFont {
        guard let font = UIFont(name: name, size: size) else {
            fatalError("Font with name \(name) not found!")
        }

        return font
    }
}
