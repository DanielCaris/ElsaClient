//
//  ContentView.swift
//  Shared
//
//  Created by Daniel Caris on 03-03-22.
//

import SwiftUI

struct Definition: Decodable, Identifiable {
    var id = UUID()
    let definition: String
    let example: String
}


struct Transcript: Decodable, Identifiable {
    var id = UUID()
    let transcript_ipa: String
    let text: String
    let spelling: String
    let trans: [String]
}

struct DictionaryWord: Decodable, Identifiable {
    var id = UUID()
    let definition: [Definition]
    let transcript: [Transcript]
    let sentence: String
    let tts_url: String
    
    static let examples = [
        DictionaryWord(
            definition: [
                Definition(
                    definition: "in, at, or to this place or position",
                    example: "they have lived here most of their lives"
                ),
                Definition(
                    definition: "used when introducing something or someone",
                    example: "here's a dish that is simple and quick to make"
                ),
                Definition(
                    definition: "used when indicating a time, point, or situation that has arrived or is happening",
                    example: "here is your opportunity"
                ),
            ],
            transcript: [
                Transcript(transcript_ipa: "hir", text: "Here", spelling: "OK", trans: ["-"])
            ],
            sentence: "Here",
            tts_url: "https://tts.elsanow.co/aa3b17600d88d3161605db8389b5bf03d4e94debcc8eeb74dca27aed95a154ab_female_v8.mp3"
        )
    ]
}

struct DictionaryWordView: View {
    @State var dictionaryWord: DictionaryWord
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack {
                Text(dictionaryWord.sentence)
                    .font(.largeTitle)
                Text("/\(dictionaryWord.transcript[0].transcript_ipa)/")
                    .font(.headline)
            }
            
            Text("Definitions")
                .font(.title)
            ForEach(dictionaryWord.definition) { definition in
                VStack(alignment: .leading) {
                    Text("definition")
                        .font(.headline)
                    Text(definition.definition)
                    
                    
                    Text("example")
                            .font(.headline)
                    Text(definition.example)
                }
            }
            
        }
        
    }
}



struct ContentView: View {
    @State var dictionaryWord: DictionaryWord?
    
    var body: some View {
        VStack {
            Text("Dictionary")
                .font(.largeTitle)
            
            if ((dictionaryWord) != nil) {
                DictionaryWordView(dictionaryWord: dictionaryWord!)
            }
        }.padding()
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(dictionaryWord: DictionaryWord.examples[0])
    }
}
