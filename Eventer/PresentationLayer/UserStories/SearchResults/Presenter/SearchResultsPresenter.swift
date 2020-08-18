//
//  SearchResultsPresenter.swift
//  Eventer
//
//  Created by Miroshnichenko Marina on 15/08/2020.
//  Copyright © 2020 marinmir. All rights reserved.
//

class SearchResultsPresenter {

    weak var view: SearchResultsViewInput!
    var interactor: SearchResultsInteractorInput!
    var router: SearchResultsRouterInput!
}

extension SearchResultsPresenter: SearchResultsInteractorOutput {
	
}

extension SearchResultsPresenter: SearchResultsViewOutput {
	func onViewDidLoad() {

    }
}