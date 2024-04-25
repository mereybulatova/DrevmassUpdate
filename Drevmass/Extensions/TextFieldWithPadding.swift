//
//  TextFieldWithPadding.swift
//  Drevmass
//
//  Created by Мерей Булатова on 11.04.2024.
//

import Foundation
import UIKit

class TextFieldWithPadding: UITextField {
    
    var padding = UIEdgeInsets(top: 0, left: 36, bottom: 0, right: 0);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
