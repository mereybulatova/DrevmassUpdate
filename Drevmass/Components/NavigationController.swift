//
//  NavigationController.swift
//  Drevmass
//
//  Created by Мерей Булатова on 08.04.2024.
//

import UIKit

final class NavigationController: UINavigationController {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
}

// MARK: - UIGestureRecognizerDelegate
extension NavigationController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
