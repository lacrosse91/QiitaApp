//
//  APIManager.swift
//  QiitaApp
//
//  Created by 川内翔一朗 on 2019/02/10.
//  Copyright © 2019 SampleApp. All rights reserved.
//

import Foundation
import APIKit
import BrightFutures

struct APIManager {

    static func send<T: QiitaRequest>(request: T, callbackQueue queue: CallbackQueue? = nil) -> Future<T.Response, SessionTaskError> {

        let promise = Promise<T.Response, SessionTaskError>()

        Session.send(request, callbackQueue: queue) { result in
            switch result {
            case let .success(data):
                promise.success(data)

            case let .failure(error):
                promise.failure(error)
            }
        }

        return promise.future
    }

}
