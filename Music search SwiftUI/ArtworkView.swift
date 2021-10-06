//
//  ArtworkView.swift
//  Music search SwiftUI
//
//  Created by eidd5180 on 06/10/2021.
//

import SwiftUI

struct ArtworkView: View {
    
    let image: Image?
    
    var body: some View {
        
        ZStack{
            if image != nil{
                image
            }else{
                Image(systemName: "music.note")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }.frame(width: 50.0, height: 50.0)
            .shadow(radius: 5)
            .padding(.trailing, 5)
    }
}

struct ArtworkView_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkView(image: Image(systemName: "music.note"))
        
    }
}
