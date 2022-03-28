//
//  ContentView.swift
//  Shared
//
//  Created by Daniel Caris on 03-03-22.
//

import SwiftUI

struct DictionarySentence: Encodable {
    let sentence: String
    let user_lang: String
}

struct ContentView: View {
    @State var dictionaryWord: DictionaryWord?
    @State var searchWord: String = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search...", text: $searchWord)
                    .onSubmit {
                        Task {
                            await searchWord()
                        }
                    }
                
                Button("Search") {
                    Task {
                        await searchWord()
                    }
                }
            }
            
            DictionaryWordView(dictionaryWord: $dictionaryWord)
            
            Spacer()
            
        }
        .padding()
        
    }
    
    func searchWord() async -> Void {
        print("Search \(searchWord)")
        
        let dictionarySentence = DictionarySentence(sentence: searchWord, user_lang: "en")
        
        guard let encoded = try? JSONEncoder().encode(dictionarySentence) else {
            print("Failed to encode dictionary body")
            return
        }
        
        
        let url = URL(string: "https://pool.elsanow.io/api/compute_dictionary")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let word = try JSONDecoder().decode(DictionaryWord.self, from: data)
            print(word)
            dictionaryWord = word
            
        } catch let err {
            print(err)
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(dictionaryWord: DictionaryWord.examples[0])
    }
}
