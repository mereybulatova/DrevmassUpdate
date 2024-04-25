//
//  ViewController.swift
//  Drevmass
//
//  Created by Мерей Булатова on 04.04.2024.
//

import UIKit

class CourseViewController: UIViewController {
    
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
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.94, alpha: 1.00)
        return view
    }()
    
    private lazy var navBarTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Курсы"
        label.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1.00)
        label.font = .sfProDisplay(ofSize: 28, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var secondMainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 28
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()
    
    private lazy var saveLessonButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor(red: 0.95, green: 0.95, blue: 0.94, alpha: 1.00).cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 20
        return button
    }()
    
    private lazy var saveLessonImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "saveLessonImageView")
        return iv
    }()
    
    private lazy var saveLessonLabel: UILabel = {
        let label = UILabel()
        label.text = "Мои закладки"
        label.font = .sfProDisplay(ofSize: 17, weight: .semibold)
        label.textColor = UIColor(red: 0.09, green: 0.09, blue: 0.08, alpha: 1.00)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var saveLessonArrowImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "saveLessonArrow")
        return iv
    }()
    
    private lazy var bonusButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "bonusImageView")
        button.setBackgroundImage(image, for: .normal)
        button.contentMode = .scaleAspectFill
        button.layer.cornerRadius = 24
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(bonusButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var bonusTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Получайте бонусы за прохождение курсов"
        label.font = .sfProDisplay(ofSize: 17, weight: .semibold)
        label.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1.00)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var bonusSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Начислим до 1500 ₽ бонусами..."
        label.font = .sfProDisplay(ofSize: 15, weight: .regular)
        label.textColor = UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1.00)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var firstCourseButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor(red: 0.95, green: 0.95, blue: 0.94, alpha: 1.00).cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 24
        return button
    }()
    
    private lazy var firstCourseImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "firstCourseImageView")
        return iv
    }()
    
    private lazy var firstCourseTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Авторская методика Древмасс"
        label.font = .sfProDisplay(ofSize: 17, weight: .semibold)
        label.textColor = UIColor(red: 0.09, green: 0.09, blue: 0.08, alpha: 1.00)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var firstCourseSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "8 уроков · 134 мин"
        label.font = .sfProDisplay(ofSize: 13, weight: .regular)
        label.textColor = UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1.00)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var firstCourseBonusView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.94, green: 0.92, blue: 0.91, alpha: 1.00)
        view.layer.cornerRadius = 13
        return view
    }()
    
    private lazy var firstCourseBonusLabel: UILabel = {
        let label = UILabel()
        label.text = "+500"
        label.font = .sfProDisplay(ofSize: 13, weight: .bold)
        label.textColor = UIColor(red: 0.09, green: 0.09, blue: 0.08, alpha: 1.00)
        return label
    }()
    
    private lazy var firstCourseBonusImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "firstCourseBonusImageView")
        return view
    }()
    
    private lazy var secondCourseButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor(red: 0.95, green: 0.95, blue: 0.94, alpha: 1.00).cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 24
        return button
    }()
    
    private lazy var secondCourseImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "secondCourseImageView")
        return iv
    }()
    
    private lazy var secondCourseTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Внедрение занятий на Древмасс за 21 день"
        label.font = .sfProDisplay(ofSize: 17, weight: .semibold)
        label.textColor = UIColor(red: 0.09, green: 0.09, blue: 0.08, alpha: 1.00)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var secondCourseSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "21 урок · 87 мин"
        label.font = .sfProDisplay(ofSize: 13, weight: .regular)
        label.textColor = UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1.00)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var secondCourseBonusView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.94, green: 0.92, blue: 0.91, alpha: 1.00)
        view.layer.cornerRadius = 15
        return view
    }()
    
    private lazy var secondCourseBonusLabel: UILabel = {
        let label = UILabel()
        label.text = "+1000"
        label.font = .sfProDisplay(ofSize: 13, weight: .bold)
        label.textColor = UIColor(red: 0.09, green: 0.09, blue: 0.08, alpha: 1.00)
        return label
    }()
    
    private lazy var secondCourseBonusImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "firstCourseBonusImageView")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
}

extension CourseViewController {
    
    //MARK: - Add Views & Constraints
    
    func setupViews() {
        view.backgroundColor = .white
        navigationItem.title = "Курсы"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "saveLessonImageView"), style: .done, target: self, action: #selector(saveNavigationButtonTapped))
        navigationController?.navigationBar.isHidden = true
        scrollView.delegate = self
        
        view.addSubview(scrollView)
        scrollView.addSubviews(mainView)
        mainView.addSubviews(navBarTitleLabel, secondMainView)
        secondMainView.addSubviews(saveLessonButton, saveLessonImageView, saveLessonLabel, saveLessonArrowImageView, bonusButton, bonusTitleLabel, bonusSubtitleLabel, firstCourseButton, firstCourseImageView, firstCourseTitleLabel, firstCourseSubtitleLabel, firstCourseBonusView, firstCourseBonusLabel, firstCourseBonusImageView, secondCourseButton, secondCourseImageView, secondCourseTitleLabel, secondCourseSubtitleLabel, secondCourseBonusView, secondCourseBonusLabel, secondCourseBonusImageView)
    }
    
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(view)
            make.height.equalTo(900)
        }
        
        navBarTitleLabel.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(92)
        }
//        
        secondMainView.snp.makeConstraints { make in
            make.top.equalTo(navBarTitleLabel.snp.bottom).offset(24)
            make.right.left.equalToSuperview()
            make.height.equalTo(900)
        }
        
        saveLessonButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(24)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(64)
        }
        
        saveLessonImageView.snp.makeConstraints { make in
            make.centerY.equalTo(saveLessonButton)
            make.left.equalTo(saveLessonButton.snp.left).inset(16)
        }
        
        saveLessonLabel.snp.makeConstraints { make in
            make.centerY.equalTo(saveLessonButton)
            make.left.equalTo(saveLessonImageView.snp.right).offset(12)
        }
        
        saveLessonArrowImageView.snp.makeConstraints { make in
            make.centerY.equalTo(saveLessonButton)
            make.right.equalTo(saveLessonButton.snp.right).inset(16)
        }
        
        bonusButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(saveLessonButton.snp.bottom).offset(24)
            make.height.equalTo(128)
        }
        
        bonusTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(bonusButton.snp.top).inset(20)
            make.left.equalTo(bonusButton.snp.left).inset(20)
            make.right.equalTo(bonusButton.snp.right).inset(128)
        }
        
        bonusSubtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(bonusTitleLabel.snp.bottom).offset(4)
            make.left.equalTo(bonusButton.snp.left).inset(20)
            make.right.equalTo(bonusButton.snp.right).inset(128)
        }
        
        firstCourseButton.snp.makeConstraints { make in
            make.top.equalTo(bonusButton.snp.bottom).offset(24)
            make.right.left.equalToSuperview().inset(16)
            make.height.equalTo(124)
        }
        
        firstCourseImageView.snp.makeConstraints { make in
            make.top.equalTo(firstCourseButton.snp.top).inset(8)
            make.bottom.equalTo(firstCourseButton.snp.bottom).inset(8)
            make.left.equalTo(firstCourseButton.snp.left).inset(8)
        }
        
        firstCourseSubtitleLabel.snp.makeConstraints { make in
            make.left.equalTo(firstCourseImageView.snp.right).offset(12)
            make.top.equalTo(firstCourseButton.snp.top).inset(11)
            make.right.equalTo(firstCourseButton.snp.right).inset(8)
        }
        
        firstCourseTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(firstCourseSubtitleLabel.snp.bottom).offset(4)
            make.left.equalTo(firstCourseImageView.snp.right).offset(12)
            make.right.equalTo(firstCourseButton.snp.right).inset(8)
            make.bottom.equalTo(firstCourseButton.snp.bottom).inset(48)
        }
        
        firstCourseBonusView.snp.makeConstraints { make in
            make.right.equalTo(firstCourseButton.snp.right).inset(8)
            make.top.equalTo(firstCourseButton.snp.top).inset(8)
            make.height.equalTo(24)
        }
        
        firstCourseBonusLabel.snp.makeConstraints { make in
            make.centerY.equalTo(firstCourseBonusView)
            make.left.equalTo(firstCourseBonusView.snp.left).inset(8)
        }
        
        firstCourseBonusImageView.snp.makeConstraints { make in
            make.centerY.equalTo(firstCourseBonusView)
            make.left.equalTo(firstCourseBonusLabel.snp.right).offset(4)
            make.right.equalTo(firstCourseBonusView.snp.right).inset(2)
            make.size.equalTo(CGSize(width: 20, height: 18))
        }
        
        secondCourseButton.snp.makeConstraints { make in
            make.top.equalTo(firstCourseButton.snp.bottom).offset(12)
            make.right.left.equalToSuperview().inset(16)
            make.height.equalTo(124)
        }
        
        secondCourseImageView.snp.makeConstraints { make in
            make.top.equalTo(secondCourseButton.snp.top).inset(8)
            make.bottom.equalTo(secondCourseButton.snp.bottom).inset(8)
            make.left.equalTo(secondCourseButton.snp.left).inset(8)
        }
        
        secondCourseSubtitleLabel.snp.makeConstraints { make in
            make.left.equalTo(secondCourseImageView.snp.right).offset(12)
            make.top.equalTo(secondCourseButton.snp.top).inset(11)
            make.right.equalTo(secondCourseButton.snp.right).inset(8)
        }
        
        secondCourseTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(secondCourseSubtitleLabel.snp.bottom).offset(4)
            make.left.equalTo(secondCourseImageView.snp.right).offset(12)
            make.right.equalTo(secondCourseButton.snp.right).inset(8)
            make.bottom.equalTo(secondCourseButton.snp.bottom).inset(48)
        }
        
        secondCourseBonusView.snp.makeConstraints { make in
            make.right.equalTo(secondCourseButton.snp.right).inset(8)
            make.top.equalTo(secondCourseButton.snp.top).inset(8)
            make.height.equalTo(24)
        }
        
        secondCourseBonusLabel.snp.makeConstraints { make in
            make.centerY.equalTo(secondCourseBonusView)
            make.left.equalTo(secondCourseBonusView.snp.left).inset(8)
        }
        
        secondCourseBonusImageView.snp.makeConstraints { make in
            make.centerY.equalTo(secondCourseBonusView)
            make.left.equalTo(secondCourseBonusLabel.snp.right).offset(4)
            make.right.equalTo(secondCourseBonusView.snp.right).inset(2)
            make.size.equalTo(CGSize(width: 20, height: 18))
        }
    }
}

extension CourseViewController {
    
    //MARK: - Actions
    
    @objc
    func saveNavigationButtonTapped() {
        
    }
    
    @objc
    func bonusButtonTapped() {
        let bonusVC = BonusViewController()
        
        let bonusViewC = UINavigationController(rootViewController: bonusVC)

        self.present(bonusViewC, animated: true, completion: nil)
    }
}

extension CourseViewController: UIScrollViewDelegate {
    
    //MARK: - Scroll View Delegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            navigationController?.navigationBar.isHidden = false
        } else {
            navigationController?.navigationBar.isHidden = true
        }
    }
}
