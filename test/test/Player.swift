//
//  Player.swift
//  test
//
//  Created by Artem Chernousov on 10.02.2022.
//

import AVFoundation

class Player: AVQueuePlayer {
  var isStarted: Bool = false

  var isPlaying: Bool {
    return rate != 0 && error == nil
  }

  override func seek(
    to time: CMTime, toleranceBefore: CMTime, toleranceAfter: CMTime,
    completionHandler: @escaping (Bool) -> Void
  ) {

    print("<<<DEV>>> player seek with time \(time)")

    super.seek(
      to: time, toleranceBefore: toleranceBefore, toleranceAfter: toleranceAfter,
      completionHandler: completionHandler)
  }
}
