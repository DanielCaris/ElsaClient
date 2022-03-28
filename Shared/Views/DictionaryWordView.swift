//
//  DictionaryWordView.swift
//  ElsaClient
//
//  Created by Daniel Caris on 24-03-22.
//

import SwiftUI
import AVKit

struct DictionaryWordView: View {
    @Binding var dictionaryWord: DictionaryWord?
    
    @State var audioPlayer: AVPlayer!
    
    var body: some View {
        if (dictionaryWord != nil) {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Button(action: {
                        let urlString = dictionaryWord?.tts_url
                        
                        guard let url = URL(string: urlString!) else {return}
                        
                        let item = AVPlayerItem(url: url)
                        
                        let player = AVPlayer(playerItem: item)
                        
                        self.audioPlayer = player
                        self.audioPlayer.playImmediately(atRate: 1.0)
                        
                    }) {
                        Image(systemName: "play.circle.fill").resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(dictionaryWord?.sentence ?? "")
                            .font(.largeTitle)
                        Text("/\(dictionaryWord?.transcript[0].transcript_ipa ?? "")/")
                            .font(.headline)
                    }
                    
                    Spacer()
                    
                }
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Text("Definitions")
                            .font(.title)
                        
                        ForEach(dictionaryWord?.definitions ?? []) { definition in
                            VStack(alignment: .leading, spacing: 10) {
                                VStack(alignment: .leading) {
                                    Text("definition")
                                        .font(.headline)
                                    Text(definition.definition)
                                }
                                
                                
                                VStack(alignment: .leading) {
                                    Text("example")
                                        .font(.headline)
                                    Text(definition.example ?? "")
                                }
                            }
                        }
                    }
                }
                
            }
        }
    }
}

struct DictionaryWordView_Previews: PreviewProvider {
    @State static var dictionaryWord: DictionaryWord? = DictionaryWord.examples[0]
    
    static var previews: some View {
        DictionaryWordView(dictionaryWord: $dictionaryWord)
    }
}
