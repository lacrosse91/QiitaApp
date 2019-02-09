//
//  APIManager.swift
//  QiitaApp
//
//  Created by 川内翔一朗 on 2019/02/10.
//  Copyright © 2019 SampleApp. All rights reserved.
//

import Foundation
import Alamofire

struct APIManager {
    static func qiitaRequest(){
        let url: URL = URL(string: "http://qiita.com/api/v2/items")!
        let task: URLSessionTask  = URLSession.shared.dataTask(with: url, completionHandler: {data, response, error in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [Any] //この部分を書き換える
                print(json)
                print("count: \(json.count)")
            }
            catch {
                print(error)

            }
        })
        task.resume()

    }



    
}
