//
//  PipViewController.swift
//  test
//
//  Created by Artem Chernousov on 10.02.2022.
//

import UIKit
import AVKit

class PipViewController: UIViewController {
    weak var router: Router?
    
    let playerVc: AVPlayerViewController
    var playerView: UIView = {
        let v = UIView()

        return v
    }()

    private let playerLayer: AVPlayerLayer = {
        let l = AVPlayerLayer()
        l.backgroundColor = UIColor.clear.cgColor
        l.videoGravity = .resizeAspectFill

        return l
    }()

    init(playerVc: AVPlayerViewController) {
        self.playerVc = playerVc

        super.init(nibName: nil, bundle: nil)
    }

    deinit {
        print("<<<DEV>>> PipViewController deinit")
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let playerView = playerVc.view else { return }
        playerView.translatesAutoresizingMaskIntoConstraints = false

        setupRecognizer()
        view.addSubview(playerView)

        NSLayoutConstraint.activate([
            playerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            playerView.widthAnchor.constraint(equalToConstant: 900),
            playerView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }

    private func setupRecognizer() {
        let recognizer = UITapGestureRecognizer()
        recognizer.allowedPressTypes = [NSNumber(value: UIPress.PressType.menu.rawValue)]

        recognizer.addTarget(self, action: #selector(onMenuPressed))

        view.addGestureRecognizer(recognizer)
    }

    @objc private func onMenuPressed() {
        router?.backToSplit(playerVc: playerVc)
    }
}
