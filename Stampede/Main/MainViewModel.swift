//
//  MainViewModel.swift
//  Stampede
//
//  Created by David House on 4/26/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation

protocol MainViewModelDelegate: class {
}

protocol MainViewModelConsumer {
    var viewModel: MainViewModel { get set }
    var delegate: MainViewModelDelegate? { get set }

    func sidebarMenuViewController() -> SidebarMenuViewController?
    func contentContainerViewController() -> ContentViewController?
}

struct MainViewModel {

    static let emptyViewModel = {
        return MainViewModel()
    }()
}
