//
// Core.swift
//

import Foundation
import Api
import PromiseKit
import RealmSwift

public class Core {
    
    public static func setupLanguages() -> Promise<Void> {
        return Promise { seal in
            Api.getLanguages().done { response in
                let languages = response.result.map { $0.language }
                let realm = try! Realm()
                try! realm.safeWrite {
                    realm.add(languages)
                }
            }.catch { error in
                // TODO: Create from local file.
            }.finally {
                seal.fulfill_()
            }
        }
    }
    
    public static func translate(
        string: String,
        fromLanguage: Language,
        toLanguage: Language
    ) -> Promise<Translation> {
        return Promise { seal in
            Api.translate(
                string,
                fromLanguage.fullCode,
                toLanguage.fullCode,
                true
            ).done { response in
                let translation = Translation(
                    fromLanguageId: fromLanguage.id,
                    toLanguageId: toLanguage.id,
                    result: response.result,
                    source: response.source,
                    resultTransliteration: response.targetTransliteration,
                    sourceTransliteration: response.sourceTransliteration
                )
                let realm = try! Realm()
                try! realm.safeWrite {
                    realm.add(translation)
                }
                seal.fulfill(translation)
            }.catch { error in
                seal.reject(error)
            }
        }
    }
}
