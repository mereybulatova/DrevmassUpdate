//
//  OnboardingModel.swift
//  Drevmass
//
//  Created by Мерей Булатова on 08.04.2024.
//

import UIKit

class OnboardingModel {
    private var items: [OnboardingItem] = [
        OnboardingItem(
            title: "Избавьтесь от боли в спине раз и навсегда!",
            description: "Здоровье спины – это один из основных показателей комфорта жизни",
            backgroundImage: UIImage(named: "OnboardingSlides/firstSlide")!
        ),
        OnboardingItem(
            title: "Наша цель",
            description: "Здоровье спины – это один из основных показателей комфорта жизни",
            backgroundImage: UIImage(named: "OnboardingSlides/secondSlide")!
        ),
        OnboardingItem(
            title: "Спина требует ежедневного ухода!",
            description: "Здоровье спины – это один из основных показателей комфорта жизни",
            backgroundImage: UIImage(named: "OnboardingSlides/thirdSlide")!
        )
    ]

    func getItemsCount() -> Int {
        return self.items.count
    }

    func getItems() -> [OnboardingItem] {
        return self.items
    }

    func getItem(at index: Int) -> OnboardingItem {
        return self.items[index]
    }
}
