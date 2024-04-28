//
//  BonusViewController.swift
//  Drevmass
//
//  Created by Мерей Булатова on 26.04.2024.
//

import UIKit

class BonusViewController: UIViewController {
    
    //MARK: - UI Elements
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Мы на рынке с 2012 года. С маленького цеха наше производство стало мини-заводом, а наш массажер стал входить в реестр медицинских изделий.\n\n За эти годы мы продали более 50000 массажеров и получили более 1000 отзывов. Когда мы начинали, то даже и представить не могли насколько полезную вещь мы делаем. Отзывы людей и истории выздоровлений нас очень вдохновляют.Мы уже сняли более 100 отзывов и интервью с нашими клиентами на нашем Ютуб канале. Каждый год растём и улучшаем продукт.\n\n «Мне хочется, чтобы каждый человек смог легко и просто избавиться от боли в спине. Избежать крупных трат и поддерживать здоровье своего позвоночника каждый день. Древмасс это один из простых способов. Это как основа и фундамент. Он позволяет сначала Вам избавится от боли, а потом начать применять другие методы оздоровления, тем самым внедряя в вашу жизнь культуру ухода за телом. Причина всех болезней кроется внутри нас самих, а основной причиной является банальная лень. За свой продукт и за то, что я делаю, я отвечаю своим именем.»"
        label.font = .sfProDisplay(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0.09, green: 0.09, blue: 0.08, alpha: 1.00)
        return label
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
}

extension BonusViewController {
    
    //MARK: - Add Views & Constraints
    
    func setupViews() {
        view.addSubview(textLabel)
        view.backgroundColor = .white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Login/arrow"), style: .plain, target: self, action: #selector(backToLoginVC))
        navigationItem.title = "Бонусная программа"
    }
    
    func setupConstraints() {
        textLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }
    
    //MARK: - Actions
    
    @objc
    func backToLoginVC() {
        dismiss(animated: true, completion: nil)
    }
}
