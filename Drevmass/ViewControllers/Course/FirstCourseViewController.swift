//
//  FirstCourseViewController.swift
//  Drevmass
//
//  Created by Мерей Булатова on 26.04.2024.
//

import UIKit
import UIGradient

class FirstCourseViewController: UIViewController {
    
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
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var courseMainImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "firstCourseMainIV")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private lazy var gradientLayer: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 393, height: 420))
        view.backgroundColor = UIColor.fromGradientWithDirection(.topToBottom, frame: CGRect(x: 0, y: 0, width: 393, height: 420), colors: [UIColor.clear, UIColor(red: 0.09, green: 0.09, blue: 0.09, alpha: 0.9)], locations: [0.5, 1.0])
        return view
    }()
    
    private lazy var courseTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Авторская методика Древмасс"
        label.font = .sfProDisplay(ofSize: 28, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private lazy var playCourseImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "playCourseImageView")
        return iv
    }()
    
    private lazy var courseSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "12 уроков · 47 мин"
        label.font = .sfProDisplay(ofSize: 13, weight: .regular)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private lazy var courseStartButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Начать курс", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .sfProDisplay(ofSize: 15, weight: .semibold)
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.layer.cornerRadius = 20
        return button
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 28
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()
    
    private lazy var detailInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Курс \"Основы здорового позвоночника\" представляет собой комплекс упражнений по укреплению здоровья вашей спины"
        label.font = .sfProDisplay(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1.00)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var firstBonusImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "bonusViewImageView")
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 24
        iv.layer.masksToBounds = true
        return iv
    }()
    
    private lazy var bonusTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Начислим 500 бонусов за прохождение курса"
        label.font = .sfProDisplay(ofSize: 15, weight: .semibold)
        label.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1.00)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private lazy var secondBonusView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.94, green: 0.92, blue: 0.91, alpha: 1.00)
        view.layer.cornerRadius = 13
        return view
    }()
    
    private lazy var secondBonusLabel: UILabel = {
        let label = UILabel()
        label.text = "+500"
        label.font = .sfProDisplay(ofSize: 13, weight: .bold)
        label.textColor = UIColor(red: 0.09, green: 0.09, blue: 0.08, alpha: 1.00)
        return label
    }()
    
    private lazy var secondBonusImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "firstCourseBonusImageView")
        return view
    }()
    
    private lazy var chooseDayView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(red: 0.94, green: 0.92, blue: 0.91, alpha: 1.00).cgColor
        return view
    }()
    
    private lazy var chooseDayImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "chooseDayImage")
        return iv
    }()
    
    private lazy var chooseDayLabel: UILabel = {
        let label = UILabel()
        label.text = "Календарь занятий"
        label.font = .sfProDisplay(ofSize: 17, weight: .semibold)
        label.textColor = UIColor(red: 0.09, green: 0.09, blue: 0.08, alpha: 1.00)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var chooseDaySwitchButton: UISwitch = {
        let switchButton = UISwitch()
        switchButton.isOn = false
        switchButton.onTintColor = UIColor(red: 0.71, green: 0.64, blue: 0.50, alpha: 1.00)
        return switchButton
    }()
    
    private lazy var lessonsLabel: UILabel = {
        let label = UILabel()
        label.text = "Уроки"
        label.font = .sfProDisplay(ofSize: 22, weight: .bold)
        label.textColor = UIColor(red: 0.09, green: 0.09, blue: 0.08, alpha: 1.00)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var lessonsCollectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.itemSize = CGSize(width: 361, height: 315)
            layout.minimumLineSpacing = 12
            
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.register(FirstCourseCollectionViewCell.self, forCellWithReuseIdentifier: "FirstCourseCollectionViewCell")
            collectionView.backgroundColor = .white
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.showsVerticalScrollIndicator = false
            collectionView.isScrollEnabled = false
            return collectionView
    }()

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        
        lessonsCollectionView.delegate = self
        lessonsCollectionView.dataSource = self
        scrollView.delegate = self
    }
}

extension FirstCourseViewController {
    
    //MARK: - Add Views & Constraints
    
    func setupViews() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "shareCourseImageView"), style: .done, target: self, action: #selector(shareButtonTapped))
        
        view.addSubview(scrollView)
        scrollView.addSubview(mainView)
        mainView.addSubviews(courseMainImageView, gradientLayer, courseTitleLabel, playCourseImageView, courseSubtitleLabel, courseStartButton, contentView)
        contentView.addSubviews(detailInfoLabel, firstBonusImageView, bonusTitleLabel, secondBonusView, secondBonusLabel, secondBonusImageView, chooseDayView, chooseDayImageView, chooseDayLabel, chooseDaySwitchButton, lessonsLabel, lessonsCollectionView)
    }
    
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(view)
            make.height.equalTo(4000)
        }
        
        courseMainImageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(420)
        }
        
        gradientLayer.snp.makeConstraints { make in
            make.right.left.top.equalToSuperview()
            make.height.equalTo(420)
        }
        
        courseTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(200)
            make.right.left.equalToSuperview().inset(16)
        }
        
        playCourseImageView.snp.makeConstraints { make in
            make.top.equalTo(courseTitleLabel.snp.bottom).offset(12)
            make.left.equalToSuperview().inset(16)
            make.size.equalTo(CGSize(width: 12, height: 12))
        }
        
        courseSubtitleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(playCourseImageView)
            make.left.equalTo(playCourseImageView.snp.right).offset(6)
            make.right.equalToSuperview().inset(16)
        }
        
        courseStartButton.snp.makeConstraints { make in
            make.top.equalTo(courseSubtitleLabel.snp.bottom).offset(12)
            make.right.left.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(courseStartButton.snp.bottom).offset(16)
            make.bottom.left.right.equalToSuperview()
        }
        
        detailInfoLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(16)
        }
        
        firstBonusImageView.snp.makeConstraints { make in
            make.top.equalTo(detailInfoLabel.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(72)
        }
        
        bonusTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(firstBonusImageView.snp.top).inset(16)
            make.bottom.equalTo(firstBonusImageView.snp.bottom).inset(16)
            make.left.equalTo(firstBonusImageView.snp.left).inset(20)
            make.width.equalTo(229)
        }
        
        secondBonusView.snp.makeConstraints { make in
            make.right.equalTo(firstBonusImageView.snp.right).inset(20)
            make.top.equalTo(firstBonusImageView.snp.top).inset(16)
            make.height.equalTo(24)
            make.left.equalTo(bonusTitleLabel.snp.right).offset(24)
            make.bottom.equalTo(firstBonusImageView.snp.bottom).inset(32)
        }
        
        secondBonusLabel.snp.makeConstraints { make in
            make.centerY.equalTo(secondBonusView)
            make.left.equalTo(secondBonusView.snp.left).inset(8)
        }
        
        secondBonusImageView.snp.makeConstraints { make in
            make.centerY.equalTo(secondBonusView)
            make.left.equalTo(secondBonusLabel.snp.right).offset(4)
            make.right.equalTo(secondBonusView.snp.right).inset(2)
            make.size.equalTo(CGSize(width: 20, height: 18))
        }
        
        chooseDayView.snp.makeConstraints { make in
            make.top.equalTo(firstBonusImageView.snp.bottom).offset(24)
            make.right.left.equalToSuperview().inset(16)
            make.height.equalTo(63)
        }
        
        chooseDayImageView.snp.makeConstraints { make in
            make.centerY.equalTo(chooseDayView)
            make.left.equalTo(chooseDayView.snp.left).inset(16)
            make.height.equalTo(CGSize(width: 24, height: 24))
        }
        
        chooseDayLabel.snp.makeConstraints { make in
            make.centerY.equalTo(chooseDayView)
            make.left.equalTo(chooseDayImageView.snp.right).offset(12)
        }
        
        chooseDaySwitchButton.snp.makeConstraints { make in
            make.centerY.equalTo(chooseDayView)
            make.right.equalTo(chooseDayView.snp.right).inset(16)
        }
        
        lessonsLabel.snp.makeConstraints { make in
            make.top.equalTo(chooseDayView.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(16)
        }
        
        lessonsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(lessonsLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(30)
        }
    }
    
    @objc
    func shareButtonTapped() {
        
    }
}

extension FirstCourseViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCourseCollectionViewCell", for: indexPath) as! FirstCourseCollectionViewCell
        return cell
    }
}

extension FirstCourseViewController: UIScrollViewDelegate {
    
    //MARK: - Scroll View Delegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            navigationController?.navigationBar.tintColor = UIColor(red: 0.71, green: 0.64, blue: 0.50, alpha: 1.00)
            navigationItem.title = "Авторская методика Древмасс"
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "beigeShareCourse"), style: .done, target: self, action: #selector(shareButtonTapped))
        } else {
            navigationItem.title = ""
            navigationController?.navigationBar.tintColor = .white
        }
    }
}
