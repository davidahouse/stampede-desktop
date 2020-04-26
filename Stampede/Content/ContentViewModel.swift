//
//  ContextViewModel.swift
//  Stampede
//
//  Created by David House on 4/26/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation

protocol ContentViewCoordinator: class {
}

protocol ContentViewModelConsumer {
    var viewModel: ContentViewModel { get set }
    var delegate: ContentViewCoordinator? { get set }
}

struct ContentViewModel {

    let selectedContent: SidebarMenuItem?

    static func empty() -> ContentViewModel {
        ContentViewModel(selectedContent: nil)
    }
}
