//
//  WordItem.swift
//  eng
//
//  Created by Aleksandr Bogdanov on 06.05.2023.
//

import Foundation
import RealmSwift

class WordItem: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var mainWord: String = ""
    @Persisted var translateWord: String = ""
    @Persisted var wight: Int = 0

    override class func primaryKey() -> String? {
        "id"
    }
}
