//
//  FeedsAssembly.swift
//  Eventer
//
//  Created by Miroshnichenko Marina on 18/07/2020.
//  Copyright © 2020 marinmir. All rights reserved.
//

import UIKit

class FeedsAssembly {
    static func createModule() -> UIViewController  {
        let router = FeedsRouter()

        let presenter = FeedsPresenter()
        let viewController = FeedsViewController()
        presenter.view = viewController
        presenter.router = router
        
        let eventsLoader = EventsLoaderMock()
        let interactor = FeedsInteractor(eventsLoader: eventsLoader)
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        
        return UINavigationController(rootViewController: viewController)
    }
    
}
