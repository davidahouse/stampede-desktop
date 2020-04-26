//
//  MainCoordinator.swift
//  Stampede
//
//  Created by David House on 4/26/20.
//  Copyright © 2020 David House. All rights reserved.
//
import Foundation

class MainCoordinator: StampedeCoordinator {

    var viewController: MainViewModelConsumer?

    func configure(viewController: MainViewModelConsumer) {
        self.viewController = viewController
        self.viewController?.delegate = self
        self.viewController?.viewModel = MainViewModel.emptyViewModel

        if let contentViewController = viewController.contentContainerViewController() {
            let coordinator = ContentCoordinator(parent: self, dependencies: dependencies)
            coordinator.configure(viewController: contentViewController)
            addChild(coordinator: coordinator)
        }

        if let sidebarMenuViewController = viewController.sidebarMenuViewController() {
            let coordinator = SidebarMenuCoordinator(parent: self, dependencies: dependencies)
            coordinator.configure(viewController: sidebarMenuViewController)
            addChild(coordinator: coordinator)
        }
    }

    override func handle(event: CoordinatorEvent) -> Bool {
        switch event {
        default:
            break
        }
        return false
    }
}

extension MainCoordinator: MainViewModelDelegate {

}
