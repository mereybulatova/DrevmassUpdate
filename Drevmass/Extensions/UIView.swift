//
//  UIView.swift
//  Drevmass
//
//  Created by Мерей Булатова on 08.04.2024.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach(self.addSubview)
    }
}
