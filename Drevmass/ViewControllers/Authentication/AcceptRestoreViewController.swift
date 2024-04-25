//
//  AcceptRestoreViewController.swift
//  Drevmass
//
//  Created by Мерей Булатова on 11.04.2024.
//

import UIKit

class AcceptRestoreViewController: UIViewController {
    
    //MARK: - UI Elements
    
    private lazy var grayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1.00)
        view.layer.cornerRadius = 2
        return view
    }()
    
    private lazy var acceptView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 25
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()
    
    private lazy var resetPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Сбросить пароль"
        label.font = .sfProDisplay(ofSize: 22, weight: .bold)
        label.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1.00)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var emailPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "На почту kate.shel@mail.ru мы отправили инструкцию для сброса пароля."
        label.font = .sfProDisplay(ofSize: 16, weight: .regular)
        label.textColor = UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1.00)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private lazy var acceptButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.50, alpha: 1.00)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Понятно", for: .normal)
        button.titleLabel?.font = .sfProDisplay(ofSize: 17, weight: .semibold)
        button.layer.cornerRadius = 28
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
}

extension AcceptRestoreViewController {
    
    //MARK: - Add Views & Constraints
    
    func setupViews() {
        view.backgroundColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 0.65)
        view.addSubviews(acceptView)
        acceptView.addSubviews(grayView, resetPasswordLabel, emailPasswordLabel, acceptButton)
    }
    
    func setupConstraints() {
        acceptView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(253)
        }
        
        grayView.snp.makeConstraints { make in
            make.bottom.equalTo(acceptView.snp.top).offset(-8)
            make.size.equalTo(CGSize(width: 32, height: 4))
            make.centerX.equalToSuperview()
        }
        
        resetPasswordLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.left.right.equalToSuperview().inset(24)
        }
        
        emailPasswordLabel.snp.makeConstraints { make in
            make.top.equalTo(resetPasswordLabel.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(24)
        }
        
        acceptButton.snp.makeConstraints { make in
            make.top.equalTo(emailPasswordLabel.snp.bottom).offset(24)
            make.right.left.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
    }
}
