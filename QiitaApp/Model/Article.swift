//
//  File.swift
//  QiitaApp
//
//  Created by 川内翔一朗 on 2019/02/10.
//  Copyright © 2019 SampleApp. All rights reserved.
//

import Foundation



struct Article: Codable {

    let title: String
    let body: String
    let date: String
    struct User: Codable {
        let id: String  //user name
        let imageUrl: String
        private enum CodingKeys: String, CodingKey {
            case imageUrl = "profile_image_url"
            case id
        }

    }
    let user: User
    private enum CodingKeys: String, CodingKey {
        case title
        case body
        case date = "created_at"
        case user
    }
}
