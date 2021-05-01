//
//  ViewController.swift
//  mvp_tst
//
//  Created by Игорь Козлов on 01.05.2021.
//

import UIKit

class ViewController: UIViewController {
    var label: UILabel!
    var button: UIButton!
    
    var presenter: MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupLabel()
        setupButton()
    }
}
//MARK: - LAYOUT
extension ViewController {
    enum Layout {
        enum Label {
            static var height: CGFloat = 40
            static var width: CGFloat = 200
        }
        
        enum Button {
            static var height: CGFloat = 40
            static var width: CGFloat = 100
            static var topInsetFromLabel: CGFloat = 100
        }
    }
}
//MARK: - Setup UI
extension ViewController {
    func setupLabel() {
        label = UILabel()
        label.frame = CGRect(origin: CGPoint(x: view.center.x - Layout.Label.width / 2,
                                             y: view.center.y - Layout.Label.height / 2),
                             size: CGSize(width: Layout.Label.width, height: Layout.Label.height))
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .center
        label.textColor = .black
        view.addSubview(label)
    }
    
    func setupButton() {
        button = UIButton()
        button.frame = CGRect(x: view.center.x - Layout.Button.width / 2,
                              y: view.center.y - Layout.Button.height + Layout.Button.topInsetFromLabel,
                              width: Layout.Button.width, height: Layout.Button.height)
        button.setTitle("Show", for: .normal)
        button.setTitleColor(.black, for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonDidTap(sender:)), for: .touchUpInside)
        
    }
}

//MARK: - objc selectors
extension ViewController {
    @objc func buttonDidTap(sender: UIButton) {
        if sender === button {
            presenter.showGreeting()
        }
    }
}

//MARK: - Binging
extension ViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        label.text = greeting
    }
}
