//
//  ViewController.swift
//  test
//
//  Created by Artem Chernousov on 04.02.2022.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    private var button: UIButton = {
        let b = UIButton()
        b.setTitle("button", for: .normal)
        b.backgroundColor = .red
        b.addTarget(self, action: #selector(handler), for: .primaryActionTriggered)

        return b
    }()

    private lazy var router: Router? = {
        guard let nav = self.navigationController else {
            print("<<<DEV>>> navigationController is nil")
            return nil
        }

        return Router(rootNavController: nav)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 12),
            button.heightAnchor.constraint(equalToConstant: 70),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12)
        ])
    }

    @objc private func handler(sender: AnyObject) {
        router?.pushSplitVc()
    }
}



