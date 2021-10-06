//
//  SongListViewModel.swift
//  Music search SwiftUI
//
//  Created by eidd5180 on 06/10/2021.
//

import Foundation
import Combine
import SwiftUI


class SongListViewModel: ObservableObject {
  @Published var searchTerm: String = "love"
    //view should be able to read this list but shouldn't able to modify this list
  @Published public private(set) var songs: [SongViewModel] = []

  private let dataModel: DataModelManager = DataModelManager()
  private let artworkLoader: ArtworkLoader = ArtworkLoader()
  private var disposables = Set<AnyCancellable>()

  init() {
    $searchTerm
      .sink(receiveValue: loadSongs(searchTerm:))
      .store(in: &disposables)
  }

  private func loadSongs(searchTerm: String) {
    songs.removeAll()
    artworkLoader.reset()

    dataModel.loadSongs(searchTerm: searchTerm) { songs in
      songs.forEach { self.appendSong(song: $0) }
    }
  }

  private func appendSong(song: Song) {
    let songViewModel = SongViewModel(song: song)
    DispatchQueue.main.async {
      self.songs.append(songViewModel)
    }

    artworkLoader.loadArtwork(forSong: song) { image in
      DispatchQueue.main.async {
        songViewModel.artwork = image
      }
    }
  }
}
