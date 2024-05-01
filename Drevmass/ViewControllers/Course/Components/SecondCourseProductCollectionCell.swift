//
//  SecondCourseProductCollectionCell.swift
//  Drevmass
//
//  Created by Мерей Булатова on 01.05.2024.
//

import UIKit

class SecondCourseProductCollectionCell: UICollectionViewCell {
    
    let identifier = "SecondCourseDetailProductCell"
    
    private lazy var productImageView: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "productInUse")
        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true
        return iv
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "12 900 ₽"
        label.textColor = UIColor(named: "TextPrimary")
        label.font = .sfProDisplay(ofSize: 15, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "6-ти роликовый массажёр"
        label.textColor = UIColor(named: "TextPrimary")
        label.font = .sfProDisplay(ofSize: 15, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var toCartButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "toCartButton"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SecondCourseProductCollectionCell {
    
    func setupViews() {
        contentView.backgroundColor = .white
        contentView.addSubviews(productImageView, titleLabel, subtitleLabel, toCartButton)
    }
    
    func setupConstraints() {
        
        productImageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(12)
            make.left.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.bottom.equalToSuperview().inset(4)
            make.left.equalToSuperview()
            make.right.equalTo(toCartButton.snp.left).offset(12)
        }
        
        toCartButton.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(12)
            make.right.equalToSuperview()
            make.size.equalTo(CGSize(width: 36, height: 36))
            make.bottom.equalToSuperview().inset(32)
        }
    }
}
