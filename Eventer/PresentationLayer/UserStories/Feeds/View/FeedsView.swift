//
//  FeedsView.swift
//  Eventer
//
//  Created by Мирошниченко Марина on 18.07.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class FeedsView: UIView {
    // MARK: - Properties
    let eventsList = UITableView(frame: CGRect.zero, style: .grouped)
    private weak var vc: FeedsViewController?
    private let refreshControl = UIRefreshControl()
    
    // MARK: - Public methods
    init(viewController vc: FeedsViewController) {
        self.vc = vc
        
        super.init(frame: CGRect.zero)
        
        setAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func stopRefreshingIfNeeded() {
        if refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        }
    }
    
    // MARK: - Private methods
    private func setAppearance() {
        backgroundColor = Colors.white
        
        eventsList.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshEvents), for: .valueChanged)
        refreshControl.tintColor = Colors.lightLavender
        refreshControl.attributedTitle = NSAttributedString(string: "Getting new events...", attributes: [NSAttributedString.Key.foregroundColor: Colors.darkViolet])
        
        eventsList.translatesAutoresizingMaskIntoConstraints = false
        eventsList.backgroundColor = Colors.white
        eventsList.separatorStyle = .none
        eventsList.dataSource = vc
        eventsList.delegate = vc
        eventsList.allowsSelection = false
        eventsList.register(EventListCell.self, forCellReuseIdentifier: EventListCell.cellReuseIdentifier)
        eventsList.register(TagsCell.self, forCellReuseIdentifier: TagsCell.cellReuseIdentifier)
        addSubview(eventsList)
        
        NSLayoutConstraint.activate([
            eventsList.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            eventsList.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            eventsList.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            eventsList.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - Private methods
    @objc private func refreshEvents() {
        vc?.output.fetchEvents()
    }
    
}
