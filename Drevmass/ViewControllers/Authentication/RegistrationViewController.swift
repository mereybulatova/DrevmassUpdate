//
//  Registration.swift
//  Drevmass
//
//  Created by Мерей Булатова on 11.04.2024.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    //MARK: - UI Elements
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация"
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
    
    private lazy var personTextField: TextFieldWithPadding = {
        let textField = TextFieldWithPadding()
        textField.font = .sfProDisplay(ofSize: 17, weight: .semibold)
        textField.textColor = UIColor(red: 0.09, green: 0.09, blue: 0.08, alpha: 1.00)
        textField.attributedPlaceholder = NSAttributedString(string: "Ваше имя", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.63, green: 0.63, blue: 0.63, alpha: 1.00)])

        return textField
    }()
    
    private lazy var personImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Login/person")
        return iv
    }()
    
    private lazy var personGrayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1.00)
        return view
    }()
    
    private lazy var personRemoveButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.setImage(UIImage(named: "Login/remove"), for: .normal)
        button.addTarget(self, action: #selector(personRemoveButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var emailTextField: TextFieldWithPadding = {
        let textField = TextFieldWithPadding()
        textField.font = .sfProDisplay(ofSize: 17, weight: .semibold)
        textField.textColor = UIColor(red: 0.09, green: 0.09, blue: 0.08, alpha: 1.00)
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
    
    private lazy var phoneNumberTextField: TextFieldWithPadding = {
        let textField = TextFieldWithPadding()
        textField.font = .sfProDisplay(ofSize: 17, weight: .semibold)
        textField.keyboardType = .numberPad
        textField.textColor = UIColor(red: 0.09, green: 0.09, blue: 0.08, alpha: 1.00)
        textField.attributedPlaceholder = NSAttributedString(string: "Номер телефона", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.63, green: 0.63, blue: 0.63, alpha: 1.00)])
        return textField
    }()
    
    private lazy var phoneNumberImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Login/phoneNumber")
        return iv
    }()
    
    private lazy var phoneNumberGrayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1.00)
        return view
    }()
    
    private lazy var phoneNumberRemoveButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.setImage(UIImage(named: "Login/remove"), for: .normal)
        button.addTarget(self, action: #selector(phoneRemoveButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var passwordTextField: TextFieldWithPadding = {
        let textField = TextFieldWithPadding()
        textField.font = .sfProDisplay(ofSize: 17, weight: .semibold)
        textField.isSecureTextEntry = true
        textField.textColor = UIColor(red: 0.09, green: 0.09, blue: 0.08, alpha: 1.00)
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
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Продолжить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .sfProDisplay(ofSize: 17, weight: .semibold)
        button.backgroundColor = UIColor(red: 0.83, green: 0.78, blue: 0.70, alpha: 1.00)
        button.layer.cornerRadius = 30
        return button
    }()
    
    private lazy var loginStackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 4
        sv.addArrangedSubview(signInLabel)
        sv.addArrangedSubview(signInButton)
        return sv
    }()
    
    private lazy var signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Уже есть аккаунт?"
        label.font = .sfProDisplay(ofSize: 15, weight: .semibold)
        label.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1.00)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(UIColor(red: 0.71, green: 0.64, blue: 0.50, alpha: 1.00), for: .normal)
        button.titleLabel?.font = .sfProDisplay(ofSize: 15, weight: .semibold)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var removeButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.setImage(UIImage(named: "Login/remove"), for: .normal)
        return button
    }()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        textFieldDelegate()
        hideKeyboardWhenTappedAround()
        keyboardOpen()
    }
}

extension RegistrationViewController {
    
    //MARK: - Add Views & Constraints
    
    func setupViews() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = UIColor(red: 0.71, green: 0.64, blue: 0.50, alpha: 1.00)
        navigationItem.title = ""
        
        view.addSubviews(titleLabel, subtitleLabel, personTextField, personImageView, personGrayView, personRemoveButton, emailTextField, emailImageView, emailGrayView, emailRemoveButton, phoneNumberTextField, phoneNumberGrayView, phoneNumberImageView, phoneNumberRemoveButton, passwordTextField, passwordImageView, passwordGrayView, showPasswordButton, signUpButton, loginStackView)
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
        
        personTextField.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(16)
            make.right.left.equalToSuperview().inset(32)
            make.height.equalTo(48)
        }
        
        personImageView.snp.makeConstraints { make in
            make.left.equalTo(personTextField.snp.left)
            make.centerY.equalTo(personTextField)
            make.size.equalTo(CGSize(width: 24, height: 24))
        }
        
        personGrayView.snp.makeConstraints { make in
            make.top.equalTo(personTextField.snp.bottom)
            make.right.left.equalToSuperview().inset(32)
            make.height.equalTo(1)
        }
        
        personRemoveButton.snp.makeConstraints { make in
            make.centerY.equalTo(personTextField)
            make.right.equalTo(personTextField.snp.right).inset(6)
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(personGrayView.snp.bottom).offset(12)
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
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
        
        phoneNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(emailGrayView.snp.bottom).offset(12)
            make.right.left.equalToSuperview().inset(32)
            make.height.equalTo(48)
        }
        
        phoneNumberImageView.snp.makeConstraints { make in
            make.left.equalTo(phoneNumberTextField.snp.left)
            make.centerY.equalTo(phoneNumberTextField)
            make.size.equalTo(CGSize(width: 24, height: 24))
        }
        
        phoneNumberGrayView.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberTextField.snp.bottom)
            make.right.left.equalToSuperview().inset(32)
            make.height.equalTo(1)
        }
        
        phoneNumberRemoveButton.snp.makeConstraints { make in
            make.centerY.equalTo(phoneNumberTextField)
            make.right.equalTo(phoneNumberTextField.snp.right).inset(6)
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberGrayView.snp.bottom).offset(12)
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
        
        signUpButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(69)
            make.right.left.equalToSuperview().inset(32)
            make.height.equalTo(56)
        }
        
        loginStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
    }
}

//MARK: - Actions
extension RegistrationViewController {
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
    func loginButtonTapped() {
        guard let navigationController = navigationController else { return }
        for viewController in navigationController.viewControllers {
            if viewController is LoginViewController {
                navigationController.popToViewController(viewController, animated: true)
                return
            }
        }
        
        let loginVC = LoginViewController()
        navigationController.pushViewController(loginVC, animated: true)
    }
    
    @objc
    func emailRemoveButtonTapped() {
        emailGrayView.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1.00)
        emailTextField.text = ""
        emailRemoveButton.isHidden = true
        emailTextField.placeholder = "Email"
    }
    
    @objc
    func personRemoveButtonTapped() {
        personGrayView.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1.00)
        personTextField.text = ""
        personRemoveButton.isHidden = true
        personTextField.placeholder = "Ваше имя"
    }
    
    @objc
    func phoneRemoveButtonTapped() {
        phoneNumberGrayView.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1.00)
        phoneNumberTextField.text = ""
        phoneNumberRemoveButton.isHidden = true
        phoneNumberTextField.placeholder = "Номер телефона"
    }
    
    func textFieldDelegate() {
        emailTextField.delegate = self
        personTextField.delegate = self
        passwordTextField.delegate = self
        phoneNumberTextField.delegate = self
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
        signUpButton.snp.updateConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(keyboardHeight - 16)
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

    @objc 
    func keyboardWillHide(_ notification: Notification) {
        signUpButton.snp.updateConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(68)
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}

//MARK: - UITextFieldDelegate
extension RegistrationViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let emailText = emailTextField.text ?? ""
        let passwordText = passwordTextField.text ?? ""
        let personText = personTextField.text ?? ""
        let phoneNumberText = phoneNumberTextField.text ?? ""
        
        if emailText.isEmpty || passwordText.isEmpty || personText.isEmpty || phoneNumberText.isEmpty {
            signUpButton.isEnabled = false
            signUpButton.backgroundColor = UIColor(red: 0.83, green: 0.78, blue: 0.70, alpha: 1.00)
        } else {
            signInButton.isEnabled = true
            signUpButton.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.50, alpha: 1.00)
        }
        
        if textField == phoneNumberTextField {
            var updatedText = (textField.text ?? "") as NSString
            updatedText = updatedText.replacingCharacters(in: range, with: string) as NSString
            
            if !updatedText.hasPrefix("+7 ") {
                updatedText = "+7 " + (updatedText as String) as NSString
                textField.text = updatedText as String
                return false
            }
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextField.placeholder = ""
            emailGrayView.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.50, alpha: 1.00)
            emailRemoveButton.isHidden = false
        } else if textField == personTextField {
            personTextField.placeholder = ""
            personGrayView.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.50, alpha: 1.00)
            personRemoveButton.isHidden = false
        } else if textField == passwordTextField {
            passwordTextField.placeholder = ""
            passwordGrayView.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.50, alpha: 1.00)
        } else if textField == phoneNumberTextField {
            phoneNumberTextField.placeholder = ""
            phoneNumberGrayView.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.50, alpha: 1.00)
            phoneNumberRemoveButton.isHidden = false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextField.placeholder = "Email"
            emailGrayView.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1.00)
            emailRemoveButton.isHidden = true
        } else if textField == personTextField {
            personTextField.placeholder = "Ваше имя"
            personGrayView.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1.00)
            personRemoveButton.isHidden = true
        } else if textField == passwordTextField {
            passwordTextField.placeholder = "Придумайте пароль"
            passwordGrayView.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1.00)
        } else if textField == phoneNumberTextField {
            phoneNumberTextField.placeholder = "Номер телефона"
            phoneNumberGrayView.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1.00)
            phoneNumberRemoveButton.isHidden = true
        }
    }
}
