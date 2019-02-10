//
//  JSONDataParser.swift
//  QiitaApp
//
//  Created by 川内翔一朗 on 2019/02/10.
//  Copyright © 2019 SampleApp. All rights reserved.
//

import APIKit


final class JSONDataParser: DataParser {
    var contentType: String? {
        return "application/json"
    }

    func parse(data: Data) throws -> Any {
        // ここではデコードせずにそのまま返す
        return data
    }
}
