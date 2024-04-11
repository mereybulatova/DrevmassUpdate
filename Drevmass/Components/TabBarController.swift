//
//  TabBarController.swift
//  Drevmass
//
//  Created by Мерей Булатова on 08.04.2024.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    func setupTabs() {
        let courseVC = CourseViewController()
        let catalogVC = CatalogViewController()
        let basketVC = BasketViewController()
        let profileVC = ProfileViewController()
        
        sozdikqorVC.tabBarItem = UITabBarItem(title: "Sozdikqor", image: .TabBar.sozdikqor, selectedImage: .TabBar.Active.sozdikqor)
        qazgrammaVC.tabBarItem = UITabBarItem(title: "Qazgramma", image: .TabBar.qazgramma, selectedImage: .TabBar.Active.qazgramma)
        qazlatynVC.tabBarItem = UITabBarItem(title: "Qazlatyn", image: .TabBar.qazlatyn, selectedImage: .TabBar.Active.qazlatyn)
        text2speechVC.tabBarItem = UITabBarItem(title: "Text2Speech", image: .TabBar.text2Speech, selectedImage: .TabBar.Active.text2Speech)

        let viewControllers = [sozdikqorVC, qazgrammaVC, qazlatynVC, text2speechVC].map { vc in
            vc.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -10)
            vc.tabBarItem.setTitleTextAttributes([
                .font: UIFont.inter(ofSize: 12, weight: .medium),
                .foregroundColor: UIColor.TabBar.item
            ], for: .normal)
            vc.tabBarItem.setTitleTextAttributes([
                .font: UIFont.inter(ofSize: 12, weight: .medium),
                .foregroundColor: UIColor.TabBar.activeItem
            ], for: .selected)

            return TQNavigationController(rootViewController: vc)
        }

        self.setViewControllers(viewControllers, animated: false)
    }
}
