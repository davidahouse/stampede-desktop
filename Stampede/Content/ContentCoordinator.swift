//
//  ContextCoordinator.swift
//  Stampede
//
//  Created by David House on 4/26/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation

class ContentCoordinator: StampedeCoordinator {

    var viewController: ContentViewModelConsumer?

    func configure(viewController: ContentViewModelConsumer) {
        self.viewController = viewController
        self.viewController?.delegate = self
    }

    override func handle(event: CoordinatorEvent) -> Bool {
        switch event {
        case .selectContent(let content):
            print("Coordinator received selectContent event, now handling it")
        default:
            break
        }
        return false
    }
}

extension ContentCoordinator: ContentViewCoordinator {

}
