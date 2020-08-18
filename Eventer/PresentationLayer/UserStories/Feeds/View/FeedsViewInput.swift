//
//  FeedsViewInput.swift
//  Eventer
//
//  Created by Miroshnichenko Marina on 18/07/2020.
//  Copyright © 2020 marinmir. All rights reserved.
//

protocol FeedsViewInput: class {
    func showEvents(_ events: [EventTypes: [Event]])
    func showSearchResults(_ results: [Event])
    
}
