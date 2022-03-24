//
//  DictionaryWordView.swift
//  ElsaClient
//
//  Created by Daniel Caris on 24-03-22.
//

import SwiftUI

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

struct DictionaryWordView_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryWordView(dictionaryWord: DictionaryWord.examples[0])
    }
}
