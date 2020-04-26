//
//  SidebarMenuViewController.swift
//  Stampede
//
//  Created by David House on 3/29/20.
//  Copyright © 2020 David House. All rights reserved.
//

import AppKit

class SidebarMenuViewController: NSViewController, SidebarMenuViewModelConsumer {

    @IBOutlet var outlineView: NSOutlineView!

    var viewModel: SidebarMenuViewModel = SidebarMenuViewModel.empty() {
        didSet {
            self.outlineView.reloadData()
            self.outlineView.expandItem(nil, expandChildren: true)
            self.outlineView.selectRowIndexes(IndexSet(integer: 1), byExtendingSelection: false)
        }
    }
    weak var delegate: SidebarMenuViewCoordinator?

    func selectItem(_ title: String) {

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        outlineView.expandItem(nil, expandChildren: true)
    }
}

extension SidebarMenuViewController: NSOutlineViewDataSource {

    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {

        if let item = item as? SidebarMenuGroup {
            switch item {
            case .repositories(let menuItems):
                return menuItems[index]
            case .monitor(let menuItems):
                return menuItems[index]
            case .history(let menuItems):
                return menuItems[index]
            case .admin(let menuItems):
                return menuItems[index]
            }
        } else {
            return viewModel.groups[index]
        }
    }

    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {

        switch item {
        case let item as SidebarMenuGroup:
            switch item {
            case .repositories(let menuItems):
                return menuItems.count
            case .monitor(let menuItems):
                return menuItems.count
            case .history(let menuItems):
                return menuItems.count
            case .admin(let menuItems):
                return menuItems.count
            }
        case is SidebarMenuItem:
            return 0
        default:
            return viewModel.groups.count
        }
    }

    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {

        let cellIdentifier: NSUserInterfaceItemIdentifier = {
            switch item {
            case _ as SidebarMenuGroup:
                return NSUserInterfaceItemIdentifier(rawValue: "HeaderCell")
            case _ as SidebarMenuItem:
                return NSUserInterfaceItemIdentifier(rawValue: "DataCell")
            default:
                return NSUserInterfaceItemIdentifier(rawValue: "DataCell")
            }
        }()

        if let view = outlineView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView {
            switch item {
            case let item as SidebarMenuGroup:
                view.textField?.stringValue = item.title
            case let item as SidebarMenuItem:
                view.textField?.stringValue = item.title
            default:
                break
            }
            view.imageView?.image = nil
            /*
             Turn on `translatesAutoresizingMaskIntoConstraints` so the outline view
             can manage the size and position of the views, specifically when the
             'Sidebar Icon Size' changes. With this on, the source nib must not be
             adding any runtime constraints to these views.
             */
            view.textField?.translatesAutoresizingMaskIntoConstraints = true
            view.imageView?.translatesAutoresizingMaskIntoConstraints = true
            return view
        } else {
            return nil
        }
    }

    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {

        switch item {
        case _ as SidebarMenuGroup:
            return true
        default:
            return false
        }
    }

    func outlineView(_ outlineView: NSOutlineView, isGroupItem item: Any) -> Bool {

        switch item {
        case _ as SidebarMenuGroup:
            return true
        default:
            return false
        }
    }

    func outlineView(_ outlineView: NSOutlineView, shouldSelectItem item: Any) -> Bool {

        switch item {
        case _ as SidebarMenuGroup:
            return false
        case _ as SidebarMenuItem:
            return true
        default:
            return false
        }
    }

    func outlineView(_ outlineView: NSOutlineView, shouldExpandItem item: Any) -> Bool {
        return true
    }
}

extension SidebarMenuViewController: NSOutlineViewDelegate {

    func outlineViewSelectionDidChange(_ notification: Notification) {

        guard outlineView == notification.object as? NSOutlineView else { return }
        if let selectedRow = outlineView.selectedRowIndexes.first, let item = outlineView.item(atRow: selectedRow) {

            switch item {
            case let item as SidebarMenuItem:
                delegate?.menuSelected(item)
            default:
                break
            }
        }
    }
}
