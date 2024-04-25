//
//  ForgetPasswordViewController.swift
//  Drevmass
//
//  Created by Мерей Булатова on 11.04.2024.
//

import UIKit

class ForgetPasswordViewController: UIViewController {
    
    //MARK: - UI Elements
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите email для сброса пароля."
        label.font = .sfProDisplay(ofSize: 15, weight: .regular)
        label.textColor = UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1.00)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.isHidden = true
        label.font = .sfProDisplay(ofSize: 13, weight: .semibold)
        label.textColor = UIColor(red: 0.71, green: 0.64, blue: 0.50, alpha: 1.00)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var emailTF: UITextField = {
        let tf = UITextField()
        tf.font = .sfProDisplay(ofSize: 17, weight: .semibold)
        tf.textColor = UIColor(red: 0.09, green: 0.09, blue: 0.08, alpha: 1.00)
        tf.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.63, green: 0.63, blue: 0.63, alpha: 1.00)])
        tf.addTarget(self, action: #selector(emailRemoveButtonTapped), for: .touchUpInside)
        return tf
    }()
    
    private lazy var tfView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.50, alpha: 1.00)
        return view
    }()
    
    private lazy var removeButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.setImage(UIImage(named: "Login/remove"), for: .normal)
        return button
    }()
    
    private lazy var arrowButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(named: "Login/arrow"), style: .plain, target: self, action: #selector(backToLoginVC))
        return button
    }()
    
    private lazy var sendPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сбросить пароль", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.83, green: 0.78, blue: 0.70, alpha: 1.00)
        button.layer.cornerRadius = 25
        button.titleLabel?.font = .sfProDisplay(ofSize: 15, weight: .semibold)
        button.addTarget(self, action: #selector(restorePasswordTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        hideKeyboardWhenTappedAround()
        keyboardOpen()
    }
}

extension ForgetPasswordViewController {
    
    //MARK: - Add Views & Constraints
    
    func setupViews() {
        navigationItem.title = "Сбросить пароль"
        view.backgroundColor = .white
        emailTF.delegate = self
        
        navigationItem.leftBarButtonItem = arrowButton
        view.addSubviews(subtitleLabel, emailLabel, emailTF, tfView, removeButton, sendPasswordButton)
    }
    
    func setupConstraints() {
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(64)
            make.right.left.equalToSuperview().inset(16)
        }
        
        emailTF.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(16)
            make.right.left.equalToSuperview().inset(16)
            make.height.equalTo(56)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTF.snp.top)
            make.left.equalTo(emailTF.snp.left)
            make.bottom.equalTo(emailTF.snp.bottom).inset(38)
        }
        
        tfView.snp.makeConstraints { make in
            make.top.equalTo(emailTF.snp.bottom)
            make.height.equalTo(1)
            make.right.left.equalToSuperview().inset(16)
        }
        
        removeButton.snp.makeConstraints { make in
            make.top.equalTo(emailTF.snp.top).inset(24)
            make.bottom.equalTo(emailTF.snp.bottom).inset(12)
            make.right.equalTo(emailTF.snp.right).inset(6)
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
        
        sendPasswordButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.right.left.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
    }
}

extension ForgetPasswordViewController {
    
    //MARK: - Actions
    
    @objc
    func restorePasswordTapped() {
        let acceptVC = AcceptRestoreViewController()
        acceptVC.modalPresentationStyle = .fullScreen
        self.present(acceptVC, animated: true, completion: nil)
    }
    
    @objc
    func backToLoginVC() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc
    func emailRemoveButtonTapped() {
        tfView.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1.00)
        removeButton.isHidden = true
        sendPasswordButton.backgroundColor = UIColor(red: 0.83, green: 0.78, blue: 0.70, alpha: 1.00)
        emailTF.placeholder = "Email"
        emailTF.text = ""
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func keyboardOpen() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc
    func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        let keyboardHeight = keyboardFrame.height
        sendPasswordButton.snp.updateConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(keyboardHeight - 16)
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

    @objc
    func keyboardWillHide(_ notification: Notification) {
        sendPasswordButton.snp.updateConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}

extension ForgetPasswordViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let emailTF = emailTF.text ?? ""
        
        if emailTF.isEmpty {
            sendPasswordButton.isEnabled = false
            sendPasswordButton.backgroundColor = UIColor(red: 0.83, green: 0.78, blue: 0.70, alpha: 1.00)
        } else {
            sendPasswordButton.isEnabled = true
            sendPasswordButton.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.50, alpha: 1.00)
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTF {
            emailTF.placeholder = ""
            tfView.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.50, alpha: 1.00)
            removeButton.isHidden = false
            emailLabel.isHidden = false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTF {
            emailTF.placeholder = "Email"
            tfView.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1.00)
            removeButton.isHidden = true
            emailLabel.isHidden = true
        }
    }
}
