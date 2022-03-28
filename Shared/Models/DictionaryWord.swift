//
//  DictionaryWord.swift
//  ElsaClient
//
//  Created by Daniel Caris on 24-03-22.
//

import Foundation

struct Definition: Decodable, Identifiable {
    var id = UUID()
    let definition: String
    let example: String?
    
    enum CodingKeys: String, CodingKey {
        case definition
        case example
    }
}


struct Transcript: Decodable, Identifiable {
    var id = UUID()
    let transcript_ipa: String
    let text: String
    let spelling: String
    let trans: [String]
    
    enum CodingKeys: String, CodingKey {
        case transcript_ipa
        case text
        case spelling
        case trans
    }
}

struct DictionaryWord: Decodable, Identifiable {
    var id = UUID()
    let definitions: [Definition]
    let transcript: [Transcript]
    let sentence: String
    let tts_url: String
    
    enum CodingKeys: String, CodingKey {
        case definitions
        case transcript
        case sentence
        case tts_url
    }
    
    static let examples = [
        DictionaryWord(
            definitions: [
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
