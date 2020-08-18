//
//  FeedsViewOutput.swift
//  Eventer
//
//  Created by Miroshnichenko Marina on 18/07/2020.
//  Copyright © 2020 marinmir. All rights reserved.
//

protocol FeedsViewOutput {
    func onViewDidLoad()
    func fetchEvents()
    func getSearchResults(for searchText: String)
    
}
