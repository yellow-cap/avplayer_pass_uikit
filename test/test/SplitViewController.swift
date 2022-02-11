//
//  SplitViewController.swift
//  test
//
//  Created by Artem Chernousov on 11.02.2022.
//

import UIKit

class SplitViewController: UISplitViewController {
    override func viewDidLoad() {
        setup()
    }

    private func setup() {
        preferredDisplayMode = .oneBesideSecondary
        preferredPrimaryColumnWidthFraction = 530 / 1920
    }

    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        guard let sidebarVc = viewControllers.first,
              let detailsVc = viewControllers.last else { return }

        if let nextFocusedView = context.nextFocusedView {
            if sidebarVc.contains(nextFocusedView) {
                if preferredDisplayMode == .secondaryOnly {
                    preferredDisplayMode = .oneBesideSecondary
                }
            } else if detailsVc.contains(nextFocusedView) {
                if preferredDisplayMode == .oneBesideSecondary {
                    preferredDisplayMode = .secondaryOnly
                }
            }
        }
    }
}
