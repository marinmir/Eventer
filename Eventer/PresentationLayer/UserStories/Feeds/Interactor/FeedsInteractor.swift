//
//  FeedsInteractor.swift
//  Eventer
//
//  Created by Miroshnichenko Marina on 18/07/2020.
//  Copyright © 2020 marinmir. All rights reserved.
//

import Foundation

class FeedsInteractor {
    // MARK: - Properties
    weak var output: FeedsInteractorOutput!
    
    let eventsLoader: EventsLoader
    
    // MARK: - Public methods
    init(eventsLoader: EventsLoader) {
        self.eventsLoader = eventsLoader
    }
    
}

// MARK: - FeedsInteractirInput
extension FeedsInteractor: FeedsInteractorInput {
    func getSearchResults(for searchText: String) {
        eventsLoader.loadSearchResults(searchText: searchText) { results in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.output.didLoadSearchResults(with: results)
            }
        }
    }
    
    func loadEvents() {
        eventsLoader.loadEvents { events in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.output.didLoadEvents(events)
            }
        }
    }
    
}
