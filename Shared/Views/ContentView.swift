//
//  ContentView.swift
//  Shared
//
//  Created by Daniel Caris on 03-03-22.
//

import SwiftUI



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
