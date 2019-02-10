//
//  GetArticlesRequest.swift
//  QiitaApp
//
//  Created by 川内翔一朗 on 2019/02/10.
//  Copyright © 2019 SampleApp. All rights reserved.
//

import Foundation
import APIKit

struct GetArticlesRequest: QiitaRequest {

    typealias Response = [Article]

    var method: HTTPMethod { return .get }
    var path: String { return "items" }
    var dataParser: DataParser {
        return JSONDataParser() as! DataParser
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> [Article] {
        let decoder: JSONDecoder = JSONDecoder()
        var articles: [Article] = []
        do {
            articles = try decoder.decode([Article].self, from: object as! Data)

        } catch {
            print("json convert failed")

        }
        return articles
    }
}
