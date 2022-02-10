//
//  SidebarViewController.swift
//  test
//
//  Created by Artem Chernousov on 10.02.2022.
//

import UIKit
import AVKit

class SidebarViewController: UIViewController {
    weak var router: Router?

    let player: Player

    init(player: Player) {
        self.player = player

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var pushButton: UIButton = {
        let b = UIButton()
        b.setTitle("push details", for: .normal)
        b.backgroundColor = .orange
        b.addTarget(self, action: #selector(pushHandler), for: .primaryActionTriggered)

        return b
    }()

    private var popButton: UIButton = {
        let b = UIButton()
        b.setTitle("pop details", for: .normal)
        b.backgroundColor = .orange
        b.addTarget(self, action: #selector(popHandler), for: .primaryActionTriggered)

        return b
    }()

    private var pushPipButton: UIButton = {
        let b = UIButton()
        b.setTitle("push pip", for: .normal)
        b.backgroundColor = .systemMint
        b.addTarget(self, action: #selector(pushPipHandler), for: .primaryActionTriggered)

        return b
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue

        view.addSubview(pushButton)
        view.addSubview(popButton)
        view.addSubview(pushPipButton)

        pushButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pushButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 12),
            pushButton.heightAnchor.constraint(equalToConstant: 70),
            pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12)
        ])

        popButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popButton.topAnchor.constraint(equalTo: pushButton.bottomAnchor, constant: 12),
            popButton.heightAnchor.constraint(equalToConstant: 70),
            popButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            popButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12)
        ])

        pushPipButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pushPipButton.topAnchor.constraint(equalTo: popButton.bottomAnchor, constant: 12),
            pushPipButton.heightAnchor.constraint(equalToConstant: 70),
            pushPipButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            pushPipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12)
        ])
    }

    @objc private func pushHandler(sender: AnyObject) {
        router?.pushDetails()
    }

    @objc private func popHandler(sender: AnyObject) {
        router?.popDetails()
    }

    @objc private func pushPipHandler(sender: AnyObject) {
        router?.pushPip(player: player)
    }
}

extension UIButton {
    override open func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if context.nextFocusedView == self {
            self.backgroundColor = .yellow
        } else {
            self.backgroundColor = .orange
        }
    }
}
