//
//  Player.swift
//  test
//
//  Created by Artem Chernousov on 10.02.2022.
//

import AVFoundation

class Player: AVQueuePlayer {
    var isStarted: Bool = false

    override func seek(to time: CMTime) {
        print("<<<DEV>>> seek(to time: CMTime)")

        print("<<<DEV>>> time \(time)")
    }

    override func seek(to time: CMTime, toleranceBefore: CMTime, toleranceAfter: CMTime, completionHandler: @escaping (Bool) -> Void) {

        print("<<<DEV>>> seek(to time: CMTime, toleranceBefore: CMTime, toleranceAfter: CMTime, completionHandler: @escaping (Bool) -> Void)")

        print("<<<DEV>>> time \(time)")
    }
}
