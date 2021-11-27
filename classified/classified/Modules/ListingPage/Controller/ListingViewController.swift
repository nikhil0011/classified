//
//  ListingViewController.swift
//  classified
//
//  Created by Nikhil Nangia on 26/11/21.
//

import UIKit

class ListingViewController: UIViewController {
    enum SectionType {
        case products
    }
    var viewModel: ListingViewModel = ListingViewModel()
    var dataSource: ListingDataSource?
    lazy var listingView: ListingView = ListingView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = LColor.surface
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Classified Daily"
        self.view.addSubview(listingView)
        listingView.fillSuperview()
        fetchAPIData()
//        setupDataSource()
    }
    fileprivate func navigateToDetailPage(_ indexPath: IndexPath) {
        if let itemViewModel = self.dataSource?.item(at: indexPath) {
            let vc = ProductDetailViewController(viewModel: itemViewModel)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func fetchAPIData() {
        ActivityIndicator.shared.showProgressView(self.view)
        viewModel.loadData()
        observeBindable()
    }
    func observeBindable() {
        viewModel.bindableListingData.bind { [weak self] data, error in
            ActivityIndicator.shared.hideProgressView()
            guard let weakSelf = self else { return }
            if error != nil {
                Logger.log(msg: "Api Failed \(String(describing: error))")
            }
            guard let result = data else { return }
            weakSelf.viewModel = ListingViewModel(products: result.results)
            weakSelf.setupDataSource()
        }
    }
    func setupDataSource() {
        var itemViewModelList: [ItemListingViewModel] = [ItemListingViewModel]()
        for item in viewModel.products ?? [] {
            let itemViewModel = ItemListingViewModel(product: item, section: .products)
            itemViewModelList.append(itemViewModel)
        }
        dataSource = ListingDataSource(collectionView: listingView.collectionView, array: itemViewModelList)
        dataSource?.collectionItemSelectionHandler = { [weak self] (indexPath) in
            self?.navigateToDetailPage(indexPath)
        }
        self.listingView.collectionView.reloadData()
    }
}
