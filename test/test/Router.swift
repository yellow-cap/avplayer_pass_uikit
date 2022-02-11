//
//  Router.swift
//  test
//
//  Created by Artem Chernousov on 10.02.2022.
//

import UIKit
import AVKit

class Router {
    private weak var rootNavController: UINavigationController?

    private var splitVc: UISplitViewController!
    private var splitNav: UINavigationController!

    init(rootNavController: UINavigationController) {
        self.rootNavController = rootNavController
    }

    func pushSplitVc() {
        let player = setupPlayer()

        let sidebarVc = SidebarViewController(player: player)
        sidebarVc.router = self

        let detailsVc = DetailsViewController(player: player)

        splitVc = SplitViewController(style: .doubleColumn)
        splitNav = UINavigationController(rootViewController: splitVc!)

        splitVc.setViewController(sidebarVc, for: .primary)
        splitVc.setViewController(detailsVc, for: .secondary)

        rootNavController?.present(splitNav!, animated: true)
    }

    func popDetails() {
        let nav = splitVc.viewControllers[1] as? UINavigationController
        nav?.popToRootViewController(animated: true)
    }

    func pushDetails() {
        let vc = UIViewController()
        vc.view.backgroundColor = .lightGray

        let nav = splitVc.viewControllers[1] as? UINavigationController
        nav?.pushViewController(vc, animated: true)
    }

    func pushPip(player: Player) {
        let vc = PipViewController(player: player)
        vc.router = self

        splitVc.setViewController(nil, for: .secondary)

        splitNav.pushViewController(vc, animated: true)
    }

    func backToSplit(player: Player) {
        splitNav.popViewController(animated: true)

        let detailsVc = DetailsViewController(player: player)
        splitVc.setViewController(detailsVc, for: .secondary)
    }

    private func setupPlayer() -> Player {
        let asset = AVAsset(url: URL(string: "https://vdqvcus.akamaized.net/6267182477001.m3u8")!)
        let player = Player(items: [
            AVPlayerItem(asset: asset)
        ])

        return player
    }
}
