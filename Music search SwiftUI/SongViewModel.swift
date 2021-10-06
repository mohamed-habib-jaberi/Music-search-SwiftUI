//
//  SongViewModel.swift
//  Music search SwiftUI
//
//  Created by eidd5180 on 06/10/2021.
//

import Combine
import Foundation
import SwiftUI

class SongViewModel: Identifiable, ObservableObject {
  let id: Int
  let trackName: String
  let artistName: String
  @Published var artwork: Image?

  init(song: Song) {
    self.id = song.id
    self.trackName = song.trackName
    self.artistName = song.artistName
  }
}
