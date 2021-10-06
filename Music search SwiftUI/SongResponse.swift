//
//  SongResponse.swift
//  Music search SwiftUI
//
//  Created by eidd5180 on 06/10/2021.
//

import Foundation

struct SongResponse: Decodable {
  let songs: [Song]

  enum CodingKeys: String, CodingKey {
    case songs = "results"
  }
}

struct Song: Decodable {
  let id: Int
  let trackName: String
  let artistName: String
  let artworkUrl: String

  enum CodingKeys: String, CodingKey {
    case id = "trackId"
    case trackName
    case artistName
    case artworkUrl = "artworkUrl60"
  }
}
