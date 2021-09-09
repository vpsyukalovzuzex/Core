//
// Translation.swift
//

import Foundation
import RealmSwift

public class Translation: Object {
    
    // MARK: - Public var
    
    public var id: String {
        get {
            return _id.uuidString
        }
    }
    
    public var fromLanguageId: String {
        get {
            return _fromLanguageId
        }
        set {
            try! Realm().safeWrite { _fromLanguageId = newValue }
        }
    }
    
    public var toLanguageId: String {
        get {
            return _toLanguageId
        }
        set {
            try! Realm().safeWrite { _toLanguageId = newValue }
        }
    }
    
    public var result: String {
        get {
            return _result
        }
        set {
            try! Realm().safeWrite { _result = newValue }
        }
    }
    
    public var source: String {
        get {
            return _source
        }
        set {
            try! Realm().safeWrite { _source = newValue }
        }
    }
    
    public var resultTransliteration: String? {
        get {
            return _resultTransliteration
        }
        set {
            try! Realm().safeWrite { _resultTransliteration = newValue }
        }
    }
    
    public var sourceTransliteration: String? {
        get {
            return _sourceTransliteration
        }
        set {
            try! Realm().safeWrite { _sourceTransliteration = newValue }
        }
    }
    
    // MARK: - @Persisted var
    
    @Persisted(primaryKey: true) var _id: UUID
    
    @Persisted var _fromLanguageId: String
    @Persisted var _toLanguageId: String
    @Persisted var _result: String
    @Persisted var _source: String
    @Persisted var _resultTransliteration: String?
    @Persisted var _sourceTransliteration: String?
    
    // MARK: - Public init
    
    public override init() {
        super.init()
    }
    
    public init(
        fromLanguageId: String,
        toLanguageId: String,
        result: String,
        source: String,
        resultTransliteration: String?,
        sourceTransliteration: String?
    ) {
        super.init()
        _fromLanguageId = fromLanguageId
        _toLanguageId = toLanguageId
        _result = result
        _source = source
        _resultTransliteration = resultTransliteration
        _sourceTransliteration = sourceTransliteration
    }
}
