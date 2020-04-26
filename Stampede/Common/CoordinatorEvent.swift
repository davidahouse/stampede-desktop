//
//  CoordinatorEvent.swift
//  Stampede
//
//  Created by David House on 4/26/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation

enum CoordinatorEvent {
    // Top level navigation
    case selectContent(_ content: SidebarMenuItem)

    // General events
    case refresh
}
