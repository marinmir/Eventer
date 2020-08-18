//
//  FeedsViewController.swift
//  Eventer
//
//  Created by Miroshnichenko Marina on 18/07/2020.
//  Copyright © 2020 marinmir. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift

class FeedsViewController: UIViewController {
    // MARK: - Properties
    var output: FeedsViewOutput!
    //var results =
    
    private var events: [EventTypes:[Event]] = [.promoted:[], .popular:[], .thisWeek:[]]
    private var sectionsCount: Int = 0
    private var indicesMap: [Int: EventTypes] = [:]
    private var searchResultsController: SearchResultsViewController = SearchResultsAssembly.createModule() as! SearchResultsViewController
    private let disposeBag = DisposeBag()
    
    private var _view: FeedsView {
        get {
            return view as! FeedsView
        }
    }
    
    private var searchController: UISearchController! = nil
    
    // MARK: - Public Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        searchController = UISearchController(searchResultsController: searchResultsController)
        setupSearchController()
        setupFilter()
        
        output.onViewDidLoad()
    }
    
    
    override func loadView() {
        super.loadView()
        
        view = FeedsView(viewController: self)
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0 {
          navigationController?.setNavigationBarHidden(true, animated: true)
       } else {
          navigationController?.setNavigationBarHidden(false, animated: true)
       }
    }
    
    // MARK: - Private methods
    private func setupSearchController() {
        //searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = NSLocalizedString("Search for...", comment: "")
        searchController.searchBar.tintColor = Colors.darkViolet

        searchController.searchBar.rx
            .text
            .orEmpty
            .debounce(.milliseconds(500), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext: { [unowned self] query in // Here we will be notified of every new value
                self.output.getSearchResults(for: query)
            })
            .disposed(by: disposeBag)
        
        navigationItem.titleView = searchController.searchBar
        
        searchController.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
    }
    
    private func setupFilter() {
        searchController.searchBar.showsBookmarkButton = true
        searchController.searchBar.setImage(UIImage(named: "Filter"), for: .bookmark, state: .normal)
        
        //searchController.searchBar.delegate = self
    }
}

// MARK: - FeedsViewInput
extension FeedsViewController: FeedsViewInput {
    func showSearchResults(_ results: [Event]) {
        searchResultsController.showResults(results)
    }
    
    func showEvents(_ events: [EventTypes:[Event]]) {
        updateTableMetadata(events)
        
        _view.eventsList.reloadData()
        
        _view.stopRefreshingIfNeeded()
    }
    
    private func updateTableMetadata(_ events: [EventTypes:[Event]]) {
        self.events = events
        
        sectionsCount = 1 // at least 1 for tags
        sectionsCount += events.count
        
        if (events[.promoted] != nil) {
            indicesMap[1] = .promoted
            if (events[.popular] != nil) {
                indicesMap[2] = .popular
                if (events[.thisWeek] != nil) {
                    indicesMap[3] = .thisWeek
                }
            }
            else if (events[.thisWeek] != nil) {
                indicesMap[2] = .thisWeek
            }
        }
        else if (events[.popular] != nil) {
            indicesMap[1] = .popular
            if (events[.thisWeek] != nil) {
                indicesMap[2] = .thisWeek
            }
        }
        else if (events[.thisWeek] != nil) {
            indicesMap[1] = .thisWeek
        }
    }
	
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension FeedsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TagsCell.cellReuseIdentifier, for: indexPath) as? TagsCell else {
                fatalError("Unable to dequeue cell with identifier \(TagsCell.cellReuseIdentifier)")
            }
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: EventListCell.cellReuseIdentifier, for: indexPath) as? EventListCell else {
                fatalError("Unable to dequeue cell with identifier \(EventListCell.cellReuseIdentifier)")
            }
            
            if let categoryEvents = events[indicesMap[indexPath.section]!] {
                cell.configure(with: categoryEvents)
            }
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch indicesMap[section] {
        case .promoted:
            return PromotedView()
        case .popular:
            return PopularView()
        case .thisWeek:
            return ThisWeekView()
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return CGFloat(60)
        default:
            return CGFloat(250)
        }
    }
}

//// MARK: - UISearchResultsUpdating
//extension FeedsViewController: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        //TODO
//    }
//
//}
//
//// MARK: - UISearchBarDelegate
//extension FeedsViewController: UISearchBarDelegate {
//    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
//        print("bla")
//    }
//}
