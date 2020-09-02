//
//  FeedsViewOutput.swift
//  Eventer
//
//  Created by Miroshnichenko Marina on 18/07/2020.
//  Copyright © 2020 marinmir. All rights reserved.
//

protocol FeedsViewOutput {
    func onViewDidLoad()
    func onRefreshFeeds()
    func onSearchQueryChanged(for searchText: String)
    
}
