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
    func didLoadSearchResults(with results: [Event]) {
        view.showSearchResults(results)
    }
    
    func didLoadEvents(_ events: [EventType: [Event]]) {
        view.showEvents(events)
    }
    
}

// MARK: - FeedsViewOutput
extension FeedsPresenter: FeedsViewOutput {
    func onSearchQueryChanged(for searchText: String) {
        interactor.getSearchResults(for: searchText)
    }
    
    func onRefreshFeeds() {
        interactor.loadEvents()
    }
    
    func onViewDidLoad() {
        interactor.loadEvents()
    }
    
}
