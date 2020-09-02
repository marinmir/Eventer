//
//  FeedsInteractorOutput.swift
//  Eventer
//
//  Created by Miroshnichenko Marina on 18/07/2020.
//  Copyright © 2020 marinmir. All rights reserved.
//

import Foundation

protocol FeedsInteractorOutput: AnyObject {
    func didLoadEvents(_ events: [EventType: [Event]])
    func didLoadSearchResults(with results: [Event])
    
}
