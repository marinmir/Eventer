//
//  FeedsInteractorInput.swift
//  Eventer
//
//  Created by Miroshnichenko Marina on 18/07/2020.
//  Copyright © 2020 marinmir. All rights reserved.
//

import Foundation

protocol FeedsInteractorInput {
    func loadEvents()
    func getSearchResults(for searchText: String)
    
}
