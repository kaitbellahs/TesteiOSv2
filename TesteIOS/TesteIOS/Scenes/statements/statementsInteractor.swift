//
//  statementsInteractor.swift
//  TesteIOS
//
//  Created by khalid ait bellahs on 21/01/19.
//  Copyright (c) 2019 ti alto nivel. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol statementsBusinessLogic {
    func updateStatmentsList()
}

protocol statementsDataStore {
    // var name: String { get set }
}

class statementsInteractor: statementsBusinessLogic, statementsDataStore {
    var presenter: statementsPresentationLogic?
    var worker: statementsWorker?
    var repository: UserRepository?
    // var name: String = ""

    // MARK: Do something

    func updateStatmentsList() {
        worker = statementsWorker()

        repository?.getUser {
            userAccount in
            let request = statements.get.Request(userAccount: userAccount)
            self.worker?.getStatments(request: request) {
                response in
                let response = statements.get.Response(userAccount: userAccount, statments: response?.statments)
                self.presenter?.presentUpdateStatmentsList(response: response)
            }
        }
    }
}
