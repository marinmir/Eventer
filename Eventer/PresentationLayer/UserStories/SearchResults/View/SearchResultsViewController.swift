//
//  SearchResultsViewController.swift
//  Eventer
//
//  Created by Miroshnichenko Marina on 15/08/2020.
//  Copyright © 2020 marinmir. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController {
    // MARK: - Properties
    var output: SearchResultsViewOutput!
    
    private var results: [Event] = []
    
    private var _view: SearchResultsView {
        get {
            return view as! SearchResultsView
        }
    }
    
    // MARK: Public methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.onViewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        
        view = SearchResultsView(viewController: self)
    }
}

// MARK: - SearchResultsViewInput
extension SearchResultsViewController: SearchResultsViewInput {
    func showResults(_ results: [Event]) {
        self.results = results
        _view.reloadData()
    }
    
}


// MARK: - UITableViewDelegate, UITableViewDataSource
extension SearchResultsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultCell.cellReuseIdentifier, for: indexPath) as? SearchResultCell else {
            fatalError("Unable to dequeue cell with identifier \(SearchResultCell.cellReuseIdentifier)")
        }
        cell.configure(with: results[indexPath.row])
        return cell
        
    }
    
}
