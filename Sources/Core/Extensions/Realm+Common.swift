//
// Realm+Common.swift
//

import Foundation
import RealmSwift

extension Realm {
    
    func safeWrite(_ block: () -> Void) throws {
        if !isInWriteTransaction {
            beginWrite()
        }
        block()
        try commitWrite()
    }
}
