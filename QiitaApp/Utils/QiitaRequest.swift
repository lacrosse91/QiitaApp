//
//  QiitaRequest.swift
//  QiitaApp
//
//  Created by 川内翔一朗 on 2019/02/10.
//  Copyright © 2019 SampleApp. All rights reserved.
//

import Foundation
import APIKit

protocol QiitaRequest: Request {}

extension QiitaRequest {
    var baseURL: URL { return URL(string: "http://qiita.com/api/v2/")! }
}
