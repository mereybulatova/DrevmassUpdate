//
//  FirstCourseCollectionViewCell.swift
//  Drevmass
//
//  Created by Мерей Булатова on 29.04.2024.
//

import UIKit

class FirstCourseCollectionViewCell: UICollectionViewCell {
    
    let identifier = "FirstCourseCollectionViewCell"
    
    //MARK: - UI Elements
    
    private lazy var previewImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "previewImage")
        iv.layer.cornerRadius = 20
        iv.layer.masksToBounds = true
        return iv
    }()
    
    private lazy var playLessonImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "playButtonImage")
        return iv
    }()
    
    private lazy var saveLessonButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "unsaveLessonButton"), for: .normal)
        return button
    }()
    
    private lazy var titleLessonLabel: UILabel = {
        let label = UILabel()
        label.text = "1 урок · 10 мин"
        label.font = .sfProDisplay(ofSize: 13, weight: .semibold)
        label.textColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var detailLessonLabel: UILabel = {
        let label = UILabel()
        label.text = "Деревянный роликовый тренажер-массажер для спины Древмасс. Полная комплектация и сборка массажера"
        label.font = .sfProDisplay(ofSize: 17, weight: .semibold)
        label.textColor = UIColor(red: 0.09, green: 0.09, blue: 0.08, alpha: 1.00)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FirstCourseCollectionViewCell {
    
    //MARK: - Add Views & Constraints
    
    func commonInit() {
        layer.cornerRadius = 25
        layer.borderWidth = 2
        layer.borderColor = UIColor(red: 0.95, green: 0.95, blue: 0.94, alpha: 1.00).cgColor
    }
    
    func setupViews() {
        contentView.backgroundColor = .white
        contentView.addSubviews(previewImageView, playLessonImageView, saveLessonButton, titleLessonLabel, detailLessonLabel)
    }
    
    func setupConstraints() {
        previewImageView.snp.makeConstraints { make in
            make.top.right.left.equalToSuperview().inset(8)
            make.height.equalTo(185)
        }
        
        playLessonImageView.snp.makeConstraints { make in
            make.center.equalTo(previewImageView)
            make.size.equalTo(CGSize(width: 44, height: 44))
        }
        
        saveLessonButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 24, height: 24))
            make.top.equalTo(previewImageView.snp.top).inset(12)
            make.right.equalTo(previewImageView.snp.right).inset(12)
        }
        
        titleLessonLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(previewImageView.snp.bottom).offset(8)
            make.height.equalTo(15)
        }
        
        detailLessonLabel.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview().inset(16)
            make.top.equalTo(titleLessonLabel.snp.bottom).offset(8)
        }
    }
}
