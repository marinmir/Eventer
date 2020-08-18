//
//  FeedsInteractorOutput.swift
//  Eventer
//
//  Created by Miroshnichenko Marina on 18/07/2020.
//  Copyright © 2020 marinmir. All rights reserved.
//

import Foundation

protocol FeedsInteractorOutput: class {
    func didLoadEvents(_ events: [EventTypes: [Event]])
    func showSearchResults(with results: [Event])
    
}
