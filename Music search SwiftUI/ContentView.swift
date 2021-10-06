//
//  ContentView.swift
//  Music search SwiftUI
//
//  Created by eidd5180 on 06/10/2021.
//

import SwiftUI

struct ContentView: View {

  @ObservedObject var viewModel: SongListViewModel

  var body: some View {
    NavigationView {
      VStack {
        SearchBar(searchTerm: $viewModel.searchTerm)
        if viewModel.songs.isEmpty {
          EmptyStateView()
        } else {
          List(viewModel.songs) { song in
            SongView(song: song)
          }
          .listStyle(PlainListStyle())
        }
      }
      .navigationBarTitle("Music Search")
    }
  }
}

struct SearchBar: UIViewRepresentable {
  typealias UIViewType = UISearchBar

  @Binding var searchTerm: String

  func makeUIView(context: Context) -> UISearchBar {
    let searchBar = UISearchBar(frame: .zero)
    searchBar.delegate = context.coordinator
    searchBar.searchBarStyle = .minimal
    searchBar.placeholder = "Type a song, artist, or album name..."
    return searchBar
  }

  func updateUIView(_ uiView: UISearchBar, context: Context) {
  }

  func makeCoordinator() -> SearchBarCoordinator {
    return SearchBarCoordinator(searchTerm: $searchTerm)
  }

    //internal class
  class SearchBarCoordinator: NSObject, UISearchBarDelegate {
    @Binding var searchTerm: String

    init(searchTerm: Binding<String>) {
      self._searchTerm = searchTerm
    }

      // the search reload when click on search button on clavier
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
      searchTerm = searchBar.text ?? ""
      UIApplication.shared.windows.first { $0.isKeyWindow }?.endEditing(true)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView(viewModel: SongListViewModel())
    }
}
