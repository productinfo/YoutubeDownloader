//
//  Color+Extension.swift
//  YoutubeDownloader
//
//  Created by khoa on 20/03/2019.
//  Copyright © 2019 Fantageek. All rights reserved.
//

import AppKit

extension NSColor {
  /// Constructing color from hex string
  ///
  /// - Parameter hex: A hex string, can either contain # or not
  convenience init(hex string: String) {
    var hex = string.hasPrefix("#")
      ? String(string.dropFirst())
      : string
    guard hex.count == 3 || hex.count == 6
      else {
        self.init(white: 1.0, alpha: 0.0)
        return
    }
    if hex.count == 3 {
      for (index, char) in hex.enumerated() {
        hex.insert(char, at: hex.index(hex.startIndex, offsetBy: index * 2))
      }
    }
    
    guard let intCode = Int(hex, radix: 16) else {
      self.init(white: 1.0, alpha: 0.0)
      return
    }
    
    self.init(
      red:   CGFloat((intCode >> 16) & 0xFF) / 255.0,
      green: CGFloat((intCode >> 8) & 0xFF) / 255.0,
      blue:  CGFloat((intCode) & 0xFF) / 255.0, alpha: 1.0)
  }
}
