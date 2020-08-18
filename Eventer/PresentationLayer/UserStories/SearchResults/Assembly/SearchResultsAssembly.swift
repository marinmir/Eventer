//
//  SearchResultsAssembly.swift
//  Eventer
//
//  Created by Miroshnichenko Marina on 15/08/2020.
//  Copyright © 2020 marinmir. All rights reserved.
//

import UIKit

class SearchResultsAssembly {

    static func createModule() -> UIViewController  {
        let router = SearchResultsRouter()

        let presenter = SearchResultsPresenter()
        let viewController = SearchResultsViewController()
        presenter.view = viewController
        presenter.router = router

        let interactor = SearchResultsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        
        return viewController
    }
}
