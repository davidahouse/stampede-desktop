//
//  SidebarMenuViewModel.swift
//  Stampede
//
//  Created by David House on 4/26/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation

enum SidebarMenuGroup {
    case repositories(menuItems: [SidebarMenuItem])
    case monitor(menuItems: [SidebarMenuItem])
    case history(menuItems: [SidebarMenuItem])
    case admin(menuItems: [SidebarMenuItem])

    var title: String {
        switch self {
        case .repositories:
            return "Repositories"
        case .monitor:
            return "Monitor"
        case .history:
            return "History"
        case .admin:
            return "Admin"
        }
    }
}

enum SidebarMenuItem {
    case repositories(owner: String)
    case monitorBuilds
    case monitorTasks
    case monitorWorkers
    case monitorQueues
    case buildHistory
    case buildSummary
    case taskHistory
    case taskSummary
    case dailySummary
    case adminTasks
    case adminDefaults
    case adminOverrides
    case adminQueues

    var title: String {
        switch self {

        case .repositories(let owner):
            return owner
        case .monitorBuilds:
            return "Active Builds"
        case .monitorTasks:
            return "Active Tasks"
        case .monitorWorkers:
            return "Workers"
        case .monitorQueues:
            return "Queues"
        case .buildHistory:
            return "Builds"
        case .buildSummary:
            return "Build Summary"
        case .taskHistory:
            return "Tasks"
        case .taskSummary:
            return "Task Summary"
        case .dailySummary:
            return "Daily Summary"
        case .adminTasks:
            return "Tasks"
        case .adminDefaults:
            return "Defaults"
        case .adminOverrides:
            return "Overrides"
        case .adminQueues:
            return "Queues"
        }
    }
}

protocol SidebarMenuViewCoordinator: class {
    func menuSelected(_ item: SidebarMenuItem)
}

protocol SidebarMenuViewModelConsumer {
    var viewModel: SidebarMenuViewModel { get set }
    var delegate: SidebarMenuViewCoordinator? { get set }
    func selectItem(_ title: String)
}

struct SidebarMenuViewModel {

    let groups: [SidebarMenuGroup]

    static func empty() -> SidebarMenuViewModel {
        return SidebarMenuViewModel(groups: [
            .monitor(menuItems: [.monitorBuilds, .monitorTasks, .monitorWorkers, .monitorQueues]),
            .history(menuItems: [.buildHistory, .buildSummary, .taskHistory, .taskSummary, .dailySummary]),
            .admin(menuItems: [.adminTasks, .adminDefaults, .adminOverrides, .adminQueues])
        ])
    }
}
