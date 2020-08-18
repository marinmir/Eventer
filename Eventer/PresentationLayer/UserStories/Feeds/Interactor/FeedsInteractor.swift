//
//  FeedsInteractor.swift
//  Eventer
//
//  Created by Miroshnichenko Marina on 18/07/2020.
//  Copyright © 2020 marinmir. All rights reserved.
//

class FeedsInteractor {
    // MARK: - Properties
    weak var output: FeedsInteractorOutput!
    
    var eventsLoader: EventsLoader!
}

// MARK: - FeedsInteractirInput
extension FeedsInteractor: FeedsInteractorInput {
    func getSearchResults(for searchText: String) {
        eventsLoader.loadSearchResults(searchText: searchText) { [weak self] results in
            guard let self = self else { return }
            self.output.showSearchResults(with: results)
        }
    }
    
    func loadEvents() {
        eventsLoader.loadEvents { [weak self] events in
            guard let self = self else { return }
            self.output.didLoadEvents(events)
        }
    }
    
}
