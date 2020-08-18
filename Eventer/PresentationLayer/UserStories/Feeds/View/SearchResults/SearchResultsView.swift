//
//  SearchResultsView.swift
//  Eventer
//
//  Created by Мирошниченко Марина on 15.08.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class SearchResultsView: UIView {
    // MARK: - Properties
    let resultsList = UITableView(frame: CGRect.zero, style: .plain)
    private let notFoundView = SearchResultsNotFoundView()
    private weak var vc: SearchResultsViewController?
    
    // MARK: - Public methods
    init(viewController vc: SearchResultsViewController) {
        self.vc = vc
        
        super.init(frame: CGRect.zero)
        
        setAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func reloadData() {
        resultsList.reloadData()
        
        notFoundView.isHidden = resultsList.numberOfRows(inSection: 0) != 0
    }
    
    // MARK: - Private methods
    private func setAppearance() {
        backgroundColor = Colors.white
        
        resultsList.translatesAutoresizingMaskIntoConstraints = false
        resultsList.backgroundColor = Colors.white
        resultsList.rowHeight = 100
        resultsList.separatorStyle = .none
        resultsList.dataSource = vc
        resultsList.delegate = vc
        resultsList.allowsSelection = false
        resultsList.register(SearchResultCell.self, forCellReuseIdentifier: SearchResultCell.cellReuseIdentifier)
        addSubview(resultsList)
        
        notFoundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(notFoundView)
        
        NSLayoutConstraint.activate([
            resultsList.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            resultsList.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            resultsList.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            resultsList.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            notFoundView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            notFoundView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            notFoundView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            notFoundView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
