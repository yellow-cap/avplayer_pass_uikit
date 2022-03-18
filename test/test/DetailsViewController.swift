//
//  DetailsViewController.swift
//  test
//
//  Created by Artem Chernousov on 10.02.2022.
//

import AVFoundation
import AVKit
import Foundation
import UIKit

class DetailsViewController: UIViewController {
  let playerVc: AVPlayerViewController

  init(playerVc: AVPlayerViewController) {
    self.playerVc = playerVc

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

    guard let playerView = playerVc.view else { return }
    playerView.translatesAutoresizingMaskIntoConstraints = false

    view.addSubview(playerView)

    NSLayoutConstraint.activate([
      playerView.topAnchor.constraint(equalTo: view.topAnchor),
      playerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      playerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      playerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])

    guard let player = playerVc.player as? Player else { return }
    if player.isStarted { return }

    player.play()

    player.isStarted = true
  }
}
