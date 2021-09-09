//
// LanguageResponse+Common.swift
//

import Foundation
import Api

extension LanguageResponse {
    
    var language: Language {
        var modes = Language.Modes()
        let names = Set(
            [
                "Translation",
                "Speech recognition",
                "Speech synthesis",
                "Image recognition",
                "Image object recognition",
                "Voice IP telephony",
                "Phrase book",
                "Translate web site",
                "Translation document"
            ]
        )
        let dictionary: [String: Language.Modes] = [
            "Translation": .translation,
            "Speech recognition": .speechRecognition,
            "Speech synthesis": .speechSynthesis,
            "Image recognition": .imageRecognition,
            "Image object recognition": .imageObjectRecognition,
            "Phrase book": .phraseBook,
            "Translate web site": .translateWebSite,
            "Translation document": .translateDocument
        ]
        for mode in self.modes {
            let name = mode.name
            if names.contains(name) && mode.value {
                if let value = dictionary[name] {
                    modes.insert(value)
                }
            }
        }
        return Language(
            fullCode: fullCode,
            codeAlpha1: codeAlpha1,
            englishName: englishName,
            codeName: codeName,
            flagPath: flagPath,
            testWordForSyntezis: testWordForSyntezis,
            rtl: rtl,
            modes: .all
        )
    }
}
