//
//  Builder.swift
//  mvp_tst
//
//  Created by Игорь Козлов on 02.05.2021.
//

import UIKit

protocol BuilderProtocol {
    static func createMainModule() -> UIViewController
}

class Builder: BuilderProtocol { // Создаёт зависимости
    static func createMainModule() -> UIViewController {
        let person = Person(name: "Igor", surname: "Kozlov")
        let vc = ViewController()
        let presenter = MainPresenter(view: vc, person: person)
        
        vc.presenter = presenter
        
        return vc
    }
}
