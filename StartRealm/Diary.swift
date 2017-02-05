//
//  Diary.swift
//  StartRealm
//
//  Created by Eunjoo on 2017. 2. 5..
//  Copyright © 2017년 Eunjoo. All rights reserved.
//

import Foundation
import RealmSwift

class Diary: Object {
    
    dynamic var id = 0
    dynamic var date = Date()
    dynamic var text = ""
    var pictures = List<Picture>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
