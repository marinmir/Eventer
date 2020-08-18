//
//  FeedsPresenter.swift
//  Eventer
//
//  Created by Miroshnichenko Marina on 18/07/2020.
//  Copyright © 2020 marinmir. All rights reserved.
//

import Foundation

class FeedsPresenter {
    // MARK: - Properties
    weak var view: FeedsViewInput!
    var interactor: FeedsInteractorInput!
    var router: FeedsRouterInput!
    
}

// MARK: - FeedsInteractorOutput
extension FeedsPresenter: FeedsInteractorOutput {
    func showSearchResults(with results: [Event]) {
        DispatchQueue.main.async { [unowned self] in
            self.view.showSearchResults(results)
        }
    }
    
    func didLoadEvents(_ events: [EventTypes: [Event]]) {
        DispatchQueue.main.async {
            self.view.showEvents(events)
        }
    }
    
}

// MARK: - FeedsViewOutput
extension FeedsPresenter: FeedsViewOutput {
    func getSearchResults(for searchText: String) {
        DispatchQueue.global(qos: .background).async {
            self.interactor.getSearchResults(for: searchText)
        }
    }
    
    func fetchEvents() {
        DispatchQueue.global(qos: .background).async {
            self.interactor.loadEvents()
        }
    }
    
	func onViewDidLoad() {
        DispatchQueue.global(qos: .background).async {
            self.interactor.loadEvents()
        }
    }
    
    
}
