//
//  SidebarMenuCoordinator.swift
//  Stampede
//
//  Created by David House on 4/26/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation

class SidebarMenuCoordinator: StampedeCoordinator {

    var sidebarMenuViewController: SidebarMenuViewModelConsumer?

    func configure(viewController: SidebarMenuViewModelConsumer) {
        self.sidebarMenuViewController = viewController
        self.sidebarMenuViewController?.delegate = self
        refreshSidebar()
    }

    func refreshSidebar() {

    }

    override func handle(event: CoordinatorEvent) -> Bool {
        switch event {
        default:
            break
        }
        return false
    }
}

extension SidebarMenuCoordinator: SidebarMenuViewCoordinator {

    func menuSelected(_ item: SidebarMenuItem) {
        send(event: .selectContent(item))
    }
}
