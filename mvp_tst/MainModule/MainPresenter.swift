//
//  MainPresenter.swift
//  mvp_tst
//
//  Created by Игорь Козлов on 01.05.2021.
//

import Foundation

protocol MainViewProtocol: class {
    func setGreeting(greeting:String)
}

protocol MainViewPresenterProtocol: class {
    init(view: MainViewProtocol, person: Person)
    func showGreeting()
}

class MainPresenter: MainViewPresenterProtocol {
    weak var view: MainViewProtocol?
    let person: Person
    
    required init(view: MainViewProtocol, person: Person) {//Правильно прокидывать зависимости ч.з. инициализатор(Инекция зависимостей)
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = "Hello, " + person.name + " " + person.surname + "!!!"
        view?.setGreeting(greeting: greeting)
    }
}
