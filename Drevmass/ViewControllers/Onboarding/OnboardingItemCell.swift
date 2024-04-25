//
//  OnboardingItemCell.swift
//  Drevmass
//
//  Created by Мерей Булатова on 09.04.2024.
//

import UIKit
import SnapKit

class OnboardingItemCell: UICollectionViewCell {
    
    let identifier = "OnboardingItemCell"
    
    //MARK: - UI Elements
    lazy var backgroundImageView: UIImageView = {
        let iv = UIImageView()
        
        return iv
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .sfProDisplay(ofSize: 28, weight: .bold)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0.09, green: 0.09, blue: 0.08, alpha: 1.00)
        
        return label
    }()

    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .sfProDisplay(ofSize: 17, weight: .regular)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1.00)
        
        return label
    }()

    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setData(withItem item: OnboardingItem) {
        self.backgroundImageView.image = item.backgroundImage
        self.titleLabel.text = item.title
        self.descriptionLabel.text = item.description
    }
}

private extension OnboardingItemCell {
    func setupView() {
        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true
        contentView.addSubviews(backgroundImageView, titleLabel, descriptionLabel)
    }

    func setupConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).inset(30)
            make.left.right.equalToSuperview().inset(24)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(24)
        }
    }
}
