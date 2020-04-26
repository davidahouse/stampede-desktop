//
//  ContextViewController.swift
//  Stampede
//
//  Created by David House on 3/29/20.
//  Copyright © 2020 David House. All rights reserved.
//

import AppKit

class ContentViewController: NSViewController, ContentViewModelConsumer {

    var viewModel: ContentViewModel = .empty() {
        didSet {
            // change our content view to a new view
        }
    }

    weak var delegate: ContentViewCoordinator?
}
