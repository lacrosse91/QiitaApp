//
//  ArticleViewModel.swift
//  QiitaApp
//
//  Created by 川内翔一朗 on 2019/02/10.
//  Copyright © 2019 SampleApp. All rights reserved.
//

import UIKit
import BrightFutures
import APIKit

class ArticleViewModel {

    var articles = [Article]()

    func fetchArticles() -> Future<GetArticlesRequest.Response, SessionTaskError> {

        return APIManager.send(request: GetArticlesRequest())
    }
}
