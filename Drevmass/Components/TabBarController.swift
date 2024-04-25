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
        setupTabBar()
    }
}

extension TabBarController {
    
    func setupTabBar() {
        tabBar.isTranslucent = false
        tabBar.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
        
        tabBar.layer.borderColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00).cgColor
        tabBar.layer.borderWidth = 1.0
    }
    
    func setupTabs() {
        let courseVC = CourseViewController()
        let catalogVC = CatalogViewController()
        let basketVC = BasketViewController()
        let profileVC = ProfileViewController()
        
        courseVC.tabBarItem = UITabBarItem(title: "Курсы", image: UIImage(named: "course") , selectedImage: UIImage(named: "courseActive"))
        catalogVC.tabBarItem = UITabBarItem(title: "Каталог", image: UIImage(named: "catalog") , selectedImage: UIImage(named: "catalogActive"))
        basketVC.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(named: "basket"), selectedImage: UIImage(named: "basketActive"))
        profileVC.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "profile"), selectedImage: UIImage(named: "profileActive"))

        let viewControllers = [courseVC, catalogVC, basketVC, profileVC].map { vc in
                vc.tabBarItem.setTitleTextAttributes([
                    .font: UIFont.sfProDisplay(ofSize: 10, weight: .semibold),
                    .foregroundColor: UIColor(red: 0.63, green: 0.63, blue: 0.63, alpha: 1.00)
                ], for: .normal)
                vc.tabBarItem.setTitleTextAttributes([
                    .font: UIFont.sfProDisplay(ofSize: 10, weight: .semibold),
                    .foregroundColor: UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1.00)
                ], for: .selected)
                
            return NavigationController(rootViewController: vc)
        }

        self.setViewControllers(viewControllers, animated: false)
    }
}
