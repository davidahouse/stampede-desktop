//
//  MainViewController.swift
//  Stampede
//
//  Created by David House on 3/28/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import AppKit

class MainViewController: NSSplitViewController, MainViewModelConsumer {

    // MARK: - Outlets
    @IBOutlet var sidebarSplitItem: NSSplitViewItem!
    @IBOutlet var contentContainerSplitItem: NSSplitViewItem!

    // MARK: - Properties
    var viewModel: MainViewModel = MainViewModel.emptyViewModel {
        didSet {
            // Update menus here
        }
    }
    weak var delegate: MainViewModelDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        splitView.setPosition(150, ofDividerAt: 0)
    }

    func sidebarMenuViewController() -> SidebarMenuViewController? {
        return sidebarSplitItem.viewController as? SidebarMenuViewController
    }

    func contentContainerViewController() -> ContentViewController? {
        return contentContainerSplitItem.viewController as? ContentViewController
    }
}
