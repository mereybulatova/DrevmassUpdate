//
//  saveLessonViewController.swift
//  Drevmass
//
//  Created by Мерей Булатова on 26.04.2024.
//

import UIKit
import SnapKit

class SaveLessonViewController: UIViewController {
    
    //MARK: - UI Elements
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Мои закладки"
        label.font = .sfProDisplay(ofSize: 28, weight: .bold)
        label.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1.00)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var emptyView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var emptyImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "emptySaveLessonIV")
        return iv
    }()
    
    private lazy var emptyTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "В закладках пока ничего нет"
        label.font = .sfProDisplay(ofSize: 17, weight: .semibold)
        label.textColor = UIColor(red: 0.09, green: 0.09, blue: 0.08, alpha: 1.00)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var emptySubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Смотрите курсы и сохраняйте полезные уроки здесь"
        label.font = .sfProDisplay(ofSize: 16, weight: .regular)
        label.textColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
}

extension SaveLessonViewController {
    
    //MARK: - Add Views & Constraints
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubviews(titleLabel, emptyView)
        emptyView.addSubviews(emptyImageView, emptyTitleLabel, emptySubtitleLabel)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(92)
            make.right.left.equalToSuperview().inset(16)
        }
        
        emptyView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(143)
            make.right.left.equalToSuperview().inset(16)
            make.height.equalTo(208)
        }
        
        emptyImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.size.equalTo(CGSize(width: 112, height: 112))
            make.centerX.equalToSuperview()
        }
        
        emptyTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(emptyImageView.snp.bottom).offset(24)
            make.right.left.equalToSuperview()
        }
        
        emptySubtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(emptyTitleLabel.snp.bottom).offset(4)
            make.right.left.bottom.equalToSuperview()
        }
    }
}
