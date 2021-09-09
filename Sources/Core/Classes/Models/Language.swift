//
// Language.swift
//

import Foundation
import Api
import RealmSwift

public class Language: Object {
    
    public struct Modes: OptionSet {
        
        // MARK: - Public let
        
        static let translation            = Modes(rawValue: 1 << 0)
        static let speechSynthesis        = Modes(rawValue: 1 << 1)
        static let imageRecognition       = Modes(rawValue: 1 << 2)
        static let imageObjectRecognition = Modes(rawValue: 1 << 3)
        // static let parseWebPage           = Modes(rawValue: 1 << 4)
        // static let parseVoice             = Modes(rawValue: 1 << 5)
        // static let produceVoice           = Modes(rawValue: 1 << 6)
        // static let offlineTranslate       = Modes(rawValue: 1 << 7)
        static let phraseBook             = Modes(rawValue: 1 << 8)
        // static let wordNetDictionary      = Modes(rawValue: 1 << 9)
        static let translateWebSite       = Modes(rawValue: 1 << 10)
        static let translateDocument      = Modes(rawValue: 1 << 11)
        static let speechRecognition      = Modes(rawValue: 1 << 12)
        
        static let all: Modes = [
            .translation,
            .speechSynthesis,
            .imageRecognition,
            .imageObjectRecognition,
            // .parseWebPage,
            // .parseVoice,
            // .produceVoice,
            // .offlineTranslate,
            .phraseBook,
            // .wordNetDictionary,
            .translateWebSite,
            .translateDocument,
            .speechRecognition
        ]
        
        // MARK: - OptionSet
        
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
    
    // MARK: - Public var
    
    public var id: String {
        get {
            return _id.uuidString
        }
    }
    
    public var fullCode: String {
        get {
            return _fullCode
        }
        set {
            try! Realm().safeWrite { _fullCode = newValue }
        }
    }
    
    public var codeAlpha1: String {
        get {
            return _codeAlpha1
        }
        set {
            try! Realm().safeWrite { _codeAlpha1 = newValue }
        }
    }
    
    public var englishName: String {
        get {
            return _englishName
        }
        set {
            try! Realm().safeWrite { _englishName = newValue }
        }
    }
    
    public var codeName: String {
        get {
            return _codeName
        }
        set {
            try! Realm().safeWrite { _codeName = newValue }
        }
    }
    
    public var flagPath: String {
        get {
            return _flagPath
        }
        set {
            try! Realm().safeWrite { _flagPath = newValue }
        }
    }
    
    public var testWordForSyntezis: String {
        get {
            return _testWordForSyntezis
        }
        set {
            try! Realm().safeWrite { _testWordForSyntezis = newValue }
        }
    }
    
    public var rtl: Bool {
        get {
            return _rtl
        }
        set {
            try! Realm().safeWrite { _rtl = newValue }
            
        }
    }
    
    public var modes: Modes {
        get {
            return Modes(rawValue: _modes)
        }
        set {
            try! Realm().safeWrite { _modes = newValue.rawValue }
        }
    }
    
    // MARK: - @Persisted var
    
    @Persisted(primaryKey: true) var _id: UUID
    
    @Persisted var _fullCode: String
    @Persisted var _codeAlpha1: String
    @Persisted var _englishName: String
    @Persisted var _codeName: String
    @Persisted var _flagPath: String
    @Persisted var _testWordForSyntezis: String
    
    @Persisted var _rtl: Bool
    
    @Persisted var _modes: Int
    
    // MARK: - Public init
    
    public override init() {
        super.init()
    }
    
    public init(
        fullCode: String,
        codeAlpha1: String,
        englishName: String,
        codeName: String,
        flagPath: String,
        testWordForSyntezis: String,
        rtl: Bool,
        modes: Modes
    ) {
        super.init()
        _fullCode = fullCode
        _codeAlpha1 = codeAlpha1
        _englishName = englishName
        _codeName = codeName
        _flagPath = flagPath
        _testWordForSyntezis = testWordForSyntezis
        _rtl = rtl
        _modes = modes.rawValue
    }
}
