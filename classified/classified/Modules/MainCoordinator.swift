//
//  MainCoordinator.swift
//  classified
//
//  Created by Nikhil Nangia on 28/11/21.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
class MainCoordinator: Coordinator {
    // MARK: We are not using it here it is always Empty
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let vc = ListingViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    func showDetail(viewModel: ItemListingViewModel) {
        let vc = ProductDetailViewController(viewModel: viewModel)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
