//
//  SecondCourseDetailViewController.swift
//  Drevmass
//
//  Created by Мерей Булатова on 01.05.2024.
//

import Foundation
import UIKit

class SecondCourseDetailViewController: UIViewController {
    
    //MARK: - UI Elements
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.bounces = false
        sv.contentInsetAdjustmentBehavior = .never
        sv.showsVerticalScrollIndicator = false
        sv.showsHorizontalScrollIndicator = false
        sv.frame = view.bounds
        sv.backgroundColor = .clear
        return sv
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var previewImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "previewImage")
        iv.layer.cornerRadius = 12
        iv.layer.masksToBounds = true
        return iv
    }()
    
    private lazy var playButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "playButtonImage"), for: .normal)
        return button
    }()
    
    private lazy var oneLessonTime: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "oneLessonTime")
        return iv
    }()
    
    private lazy var oneLessonTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "10 мин"
        label.font = .sfProDisplay(ofSize: 13, weight: .regular)
        label.textColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
        return label
    }()
    
    private lazy var saveLessonButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "saveLesson"), for: .normal)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Деревянный роликовый тренажер-массажер для спины Древмасс. Полная комплектация и сборка массажера"
        label.textColor = UIColor(named: "TextPrimary")
        label.font = .sfProDisplay(ofSize: 22, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Полная комплектация массажера Древмасс включает в себя: инструкцию, гарантийный талон, набор креплений, фиксатор для вертикального хранения, медицинский массажер Су Джок, воск для смазки осей, браслет на руку, тряпочка для протирки. \n\nНаша цель – обеспечить людей доступным инструментом для поддержания здоровья позвоночника. Дать понимание, что здоровье спины это один из основных показателей комфорта жизни после 55. Чем раньше начать, тем комфортнее будет потом. Жить без боли просто с Древмасс»."
        label.textColor = UIColor(named: "GraySubtitle")
        label.font = .sfProDisplay(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var productsInUseLabel: UILabel = {
        let label = UILabel()
        label.text = "Товары используемые на видео"
        label.textColor = UIColor(named: "TextSecondary")
        label.font = .sfProDisplay(ofSize: 20, weight: .semibold)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var productInUseCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 165, height: 180)
        layout.minimumLineSpacing = 12
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SecondCourseProductCollectionCell.self, forCellWithReuseIdentifier: "SecondCourseDetailProductCell")
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        productInUseCollectionView.delegate = self
        productInUseCollectionView.dataSource = self
    }
}

extension SecondCourseDetailViewController {
    
    func setupViews() {
        view.backgroundColor = .white
        
        navigationItem.title = "Урок 1"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "beigeShareCourse"), style: .done, target: self, action: #selector(shareButtonTapped))
        
        view.addSubviews(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(previewImageView, playButton, oneLessonTime, oneLessonTimeLabel, saveLessonButton, titleLabel, subtitleLabel, productsInUseLabel, productInUseCollectionView)
    }
    
    func setupConstraints() {
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(view)
            make.height.equalTo(1050)
        }
        
        previewImageView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().inset(92)
            make.height.equalTo(212)
        }
        
        playButton.snp.makeConstraints { make in
            make.center.equalTo(previewImageView)
            make.size.equalTo(CGSize(width: 44, height: 44))
        }
        
        oneLessonTime.snp.makeConstraints { make in
            make.top.equalTo(previewImageView.snp.bottom).offset(22)
            make.left.equalToSuperview().inset(16)
            make.size.equalTo(CGSize(width: 12, height: 12))
        }
        
        oneLessonTimeLabel.snp.makeConstraints { make in
            make.left.equalTo(oneLessonTime.snp.right).offset(6)
            make.centerY.equalTo(oneLessonTime)
        }
        
        saveLessonButton.snp.makeConstraints { make in
            make.top.equalTo(previewImageView.snp.bottom).offset(16)
            make.right.equalToSuperview().inset(16)
            make.size.equalTo(CGSize(width: 24, height: 24))
        }
        
        titleLabel.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(16)
            make.top.equalTo(saveLessonButton.snp.bottom).offset(8)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.right.left.equalToSuperview().inset(16)
        }
        
        productsInUseLabel.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(32)
            make.right.left.equalToSuperview().inset(16)       
            make.height.equalTo(24)
        }
        
        productInUseCollectionView.snp.makeConstraints { make in
            make.top.equalTo(productsInUseLabel.snp.bottom).offset(16)
            make.right.left.equalToSuperview().inset(16)
            make.height.equalTo(180)
        }
    }
}

extension SecondCourseDetailViewController {
   
    @objc
    func shareButtonTapped() {
        
    }
}

extension SecondCourseDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCourseDetailProductCell", for: indexPath) as! SecondCourseProductCollectionCell
        
        return cell
    }
}
