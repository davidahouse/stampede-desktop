//
//  MainWindowController.swift
//  Stampede
//
//  Created by David House on 3/29/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    var coordinator: MainCoordinator?

    override func windowDidLoad() {
        super.windowDidLoad()

        if NSClassFromString("XCTest.XCTestCase") != nil {
            return
        }

        if let contentViewController = contentViewController as? MainViewController, let window = window {
            let dependencies = CoordinatorDependencies(window: window)
            coordinator = MainCoordinator(dependencies: dependencies)
            coordinator?.configure(viewController: contentViewController)
            if let frame = NSScreen.main?.frame {
                window.setFrame(frame, display: true)
            }
        }
    }

    override func shouldPerformSegue(withIdentifier identifier: NSStoryboardSegue.Identifier, sender: Any?) -> Bool {

        if NSClassFromString("XCTest.XCTestCase") != nil {
            return false
        }
        return true
    }
}
