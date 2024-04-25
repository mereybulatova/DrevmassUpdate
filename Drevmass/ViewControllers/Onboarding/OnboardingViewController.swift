//
//  OnboardingViewController.swift
//  Drevmass
//
//  Created by Мерей Булатова on 08.04.2024.
//

import UIKit

class OnboardingViewController: UIViewController {
    //MARK: - Properties
    private let model: OnboardingModel
    
    //MARK: - UI Elements
    private lazy var collectionView = {
        let layout = UICollectionViewFlowLayout()

        layout.scrollDirection = .horizontal
        layout.sectionInset = .zero
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = view.bounds.size

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.bounces = false
        collectionView.layer.cornerRadius = 16
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.register(OnboardingItemCell.self, forCellWithReuseIdentifier: "OnboardingItemCell")

        return collectionView
    }()
    
    private lazy var progressBar: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.setProgress(15, animated: true)
        progressView.trackTintColor = .gray
        progressView.progressTintColor = .brown
        return progressView
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let sv = UIStackView()
        sv.alignment = .center
        sv.spacing = 8
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.addArrangedSubview(loginButton)
        sv.addArrangedSubview(registrationButton)
        return sv
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .custom)

        button.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.50, alpha: 1.00)
        button.setTitle("Вход", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .sfProDisplay(ofSize: 17, weight: .semibold)
        button.contentHorizontalAlignment = .center
        button.layer.cornerRadius = 28
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)

        return button
    }()

    private lazy var registrationButton: UIButton = {
        let button = UIButton(type: .custom)

        button.setTitle("Регистрация", for: .normal)
        button.setTitleColor(UIColor(red: 0.71, green: 0.64, blue: 0.50, alpha: 1.00), for: .normal)
        button.titleLabel?.font = .sfProDisplay(ofSize: 17, weight: .semibold)
        button.contentHorizontalAlignment = .center
        button.backgroundColor = .white
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(red: 0.71, green: 0.64, blue: 0.50, alpha: 1.00).cgColor
        button.layer.cornerRadius = 28
        button.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)

        return button
    }()

    init() {
        self.model = OnboardingModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = collectionView.bounds.size
        }
    }
}

extension OnboardingViewController {
    func setupView() {
        view.backgroundColor = .white
        view.addSubviews(collectionView, progressBar, buttonStackView)
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.left.right.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(88)
        }
        
        progressBar.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.top).inset(8)
            make.right.left.equalToSuperview().inset(16)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
        loginButton.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.bottom.equalToSuperview()
        }
        
        registrationButton.snp.makeConstraints { make in
            make.height.equalTo(56)
        }
    }
}

// MARK: - Actions
extension OnboardingViewController {
    @objc
    func loginButtonTapped() {
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
        navigationItem.title = ""
    }
    
    @objc
    func registrationButtonTapped() {
        let registrationVC = RegistrationViewController()
        navigationController?.pushViewController(registrationVC, animated: true)
        navigationItem.title = ""
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.getItemsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingItemCell", for: indexPath) as! OnboardingItemCell
        
        cell.setData(withItem: model.getItem(at: indexPath.row))
        
        return cell
    }
    
    
}
