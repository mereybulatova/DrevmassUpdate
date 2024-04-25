//
//  SignInViewController.swift
//  Drevmass
//
//  Created by Мерей Булатова on 11.04.2024.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    //MARK: - UI Elements
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "С возвращением!"
        label.font = .sfProDisplay(ofSize: 28, weight: .bold)
        label.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1.00)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Мы с вами научимся заниматься на тренажере-массажере для спины Древмасс."
        label.font = .sfProDisplay(ofSize: 15, weight: .regular)
        label.textColor = UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1.00)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var emailTextField: TextFieldWithPadding = {
        let textField = TextFieldWithPadding()
        textField.font = .sfProDisplay(ofSize: 17, weight: .semibold)
        textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.63, green: 0.63, blue: 0.63, alpha: 1.00)])
        return textField
    }()
    
    private lazy var emailImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Login/email")
        return iv
    }()
    
    private lazy var emailGrayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1.00)
        return view
    }()
    
    private lazy var emailRemoveButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.setImage(UIImage(named: "Login/remove"), for: .normal)
        button.addTarget(self, action: #selector(emailRemoveButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var passwordTextField: TextFieldWithPadding = {
        let textField = TextFieldWithPadding()
        textField.font = .sfProDisplay(ofSize: 17, weight: .semibold)
        textField.isSecureTextEntry = true
        textField.attributedPlaceholder = NSAttributedString(string: "Пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.63, green: 0.63, blue: 0.63, alpha: 1.00)])
        return textField
    }()
    
    private lazy var passwordImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Login/password")
        return iv
    }()
    
    private lazy var passwordGrayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1.00)
        return view
    }()
    
    private lazy var showPasswordButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Login/lookPassword"), for: .normal)
        button.addTarget(self, action: #selector(showPasswordButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var forgetPasswordButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Забыли пароль?", for: .normal)
        button.setTitleColor(UIColor(red: 0.71, green: 0.64, blue: 0.50, alpha: 1.00), for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = .sfProDisplay(ofSize: 15, weight: .semibold)
        button.addTarget(self, action: #selector(forgetPassButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .sfProDisplay(ofSize: 17, weight: .semibold)
        button.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.50, alpha: 1.00)
        button.layer.cornerRadius = 30
        return button
    }()
    
    private lazy var registrationStackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 4
        sv.addArrangedSubview(signUpLabel)
        sv.addArrangedSubview(signUpButton)
        return sv
    }()
    
    private lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Еще нет аккаунта?"
        label.font = .sfProDisplay(ofSize: 15, weight: .semibold)
        label.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1.00)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Регистрация", for: .normal)
        button.setTitleColor(UIColor(red: 0.71, green: 0.64, blue: 0.50, alpha: 1.00), for: .normal)
        button.titleLabel?.font = .sfProDisplay(ofSize: 15, weight: .semibold)
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        hideKeyboardWhenTappedAround()
        keyboardOpen()
        textFieldDelegate()
    }
}

private extension LoginViewController {
    
    // MARK: - Add Views & Constraints
    
    func setupViews() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = UIColor(red: 0.71, green: 0.64, blue: 0.50, alpha: 1.00)
        navigationItem.title = ""
        
        view.addSubviews(titleLabel, subtitleLabel, emailTextField, emailImageView, emailGrayView, emailRemoveButton, passwordTextField, passwordImageView, passwordGrayView, showPasswordButton, forgetPasswordButton, signInButton, registrationStackView)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(12)
            make.right.left.equalToSuperview().inset(32)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.right.left.equalToSuperview().inset(32)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(16)
            make.right.left.equalToSuperview().inset(32)
            make.height.equalTo(48)
        }
        
        emailImageView.snp.makeConstraints { make in
            make.left.equalTo(emailTextField.snp.left)
            make.centerY.equalTo(emailTextField)
            make.size.equalTo(CGSize(width: 24, height: 24))
        }
        
        emailGrayView.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom)
            make.right.left.equalToSuperview().inset(32)
            make.height.equalTo(1)
        }
        
        emailRemoveButton.snp.makeConstraints { make in
            make.centerY.equalTo(emailTextField)
            make.right.equalTo(emailTextField.snp.right).inset(6)
            make.size.equalTo(CGSize(width: 24, height: 24))
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailGrayView.snp.bottom).offset(12)
            make.right.left.equalToSuperview().inset(32)
            make.height.equalTo(48)
        }
        
        passwordImageView.snp.makeConstraints { make in
            make.left.equalTo(passwordTextField.snp.left)
            make.centerY.equalTo(passwordTextField)
            make.size.equalTo(CGSize(width: 24, height: 24))
        }
        
        passwordGrayView.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom)
            make.right.left.equalToSuperview().inset(32)
            make.height.equalTo(1)
        }
        
        showPasswordButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextField)
            make.right.equalTo(passwordTextField.snp.right)
            make.size.equalTo(CGSize(width: 24, height: 24))
        }
        
        forgetPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordGrayView.snp.bottom).offset(12)
            make.right.left.equalToSuperview().inset(32)
        }
        
        signInButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(69)
            make.right.left.equalToSuperview().inset(32)
            make.height.equalTo(56)
        }
        
        registrationStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
    }
}

//MARK: - Actions
extension LoginViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc
    func showPasswordButtonTapped() {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        if passwordTextField.isSecureTextEntry ==  false {
            showPasswordButton.setImage(UIImage(named: "Login/lookPasswordShow"), for: .normal)
        } else {
            showPasswordButton.setImage(UIImage(named: "Login/lookPassword"), for: .normal)
        }
    }
    
    @objc
    func registerButtonTapped() {
            guard let navigationController = navigationController else { return }
            for viewController in navigationController.viewControllers {
                if viewController is RegistrationViewController {
                    navigationController.popToViewController(viewController, animated: true)
                    return
                }
            }

            let registrationVC = RegistrationViewController()
            navigationController.pushViewController(registrationVC, animated: true)
        }
    
    @objc
    func forgetPassButtonTapped() {
        let forgetPassVC = ForgetPasswordViewController()
        
        let forgetPasswordVC = UINavigationController(rootViewController: forgetPassVC)

        self.present(forgetPasswordVC, animated: true, completion: nil)
    }
    
    @objc
    func emailRemoveButtonTapped() {
        emailGrayView.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1.00)
        emailTextField.text = ""
        emailRemoveButton.isHidden = true
        emailTextField.placeholder = "Email"
    }
    
    func textFieldDelegate() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
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
        signInButton.snp.updateConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(keyboardHeight - 16)
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

    @objc
    func keyboardWillHide(_ notification: Notification) {
        signInButton.snp.updateConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(68)
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let emailText = emailTextField.text ?? ""
        let passwordText = passwordTextField.text ?? ""
        
        if emailText.isEmpty || passwordText.isEmpty {
            signInButton.isEnabled = false
            signInButton.backgroundColor = UIColor(red: 0.83, green: 0.78, blue: 0.70, alpha: 1.00)
        } else {
            signInButton.isEnabled = true
            signInButton.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.50, alpha: 1.00)
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextField.placeholder = ""
            emailGrayView.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.50, alpha: 1.00)
            emailRemoveButton.isHidden = false
        } else if textField == passwordTextField {
            passwordTextField.placeholder = ""
            passwordGrayView.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.50, alpha: 1.00)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextField.placeholder = "Email"
            emailGrayView.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1.00)
            emailRemoveButton.isHidden = true
        } else if textField == passwordTextField {
            passwordTextField.placeholder = "Придумайте пароль"
            passwordGrayView.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1.00)
        } 
    }
}
