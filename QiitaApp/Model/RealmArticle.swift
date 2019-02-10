//
//  RealmArticle.swift
//  QiitaApp
//
//  Created by 川内翔一朗 on 2019/02/10.
//  Copyright © 2019 SampleApp. All rights reserved.
//

import Foundation
import RealmSwift

class RealmArticle: Object {
    @objc dynamic var title = ""
    @objc dynamic var user = ""
    @objc dynamic var date = ""
    @objc dynamic var imageUrl = ""
    @objc dynamic var body = ""


    override static func primaryKey() -> String? {
        return "title" //titleプロパティをプライマリーキーに指定
    }

}
