//
//  EmptyStateView.swift
//  Music search SwiftUI
//
//  Created by eidd5180 on 06/10/2021.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack{
            Spacer()
            Image(systemName: "music.note")
                .font(.system(size: 85))
                .padding(.bottom)
            
            Text("Start searching for music...")
                .font(.title)
            Spacer()
        }.padding()
            .foregroundColor(Color(.systemIndigo))
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView()
    }
}
