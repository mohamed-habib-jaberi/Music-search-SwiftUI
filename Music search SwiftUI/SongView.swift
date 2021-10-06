//
//  SongView.swift
//  Music search SwiftUI
//
//  Created by eidd5180 on 06/10/2021.
//

import SwiftUI

struct SongView: View {

  @ObservedObject var song: SongViewModel

  var body: some View {
    HStack {
      ArtworkView(image: song.artwork)
        .padding(.trailing)
        VStack(alignment: .leading) {
        Text(song.trackName)
        Text(song.artistName)
          .font(.footnote)
          .foregroundColor(.gray)
        }
    }
    .padding()

  }
}

struct SongView_Previews: PreviewProvider {
    static var previews: some View {
        SongView(song: SongViewModel(song: Song(id: 2, trackName: "Paradise", artistName: "Coldplay", artworkUrl: "https://is3-ssl.mzstatic.com/image/thumb/Music128/v4/02/e5/1f/02e51fa7-63a0-1369-1409-8da64b851f5d/source/30x30bb.jpg")))
    }
}
