//
//  DetailsViewController.swift
//  test
//
//  Created by Artem Chernousov on 10.02.2022.
//

import Foundation
import UIKit
import AVFoundation
import AVKit

class DetailsViewController: UIViewController {
    let player: Player
    let playerViewController = AVPlayerViewController()


    init(player: Player) {
        self.player = player
        playerViewController.player = player

        super.init(nibName: nil, bundle: nil)
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        print("<<<DEV>>> DetailsViewController deinit")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange

        playerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        guard let playerView = playerViewController.view else { return }

        view.addSubview(playerView)

        NSLayoutConstraint.activate([
            playerView.topAnchor.constraint(equalTo: view.topAnchor),
            playerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            playerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            playerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        if player.isStarted { return }
        
        player.play()

        player.isStarted = true
    }
}
