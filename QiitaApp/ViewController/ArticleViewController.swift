//
//  ArticleViewController.swift
//  QiitaApp
//
//  Created by 川内翔一朗 on 2019/02/09.
//  Copyright © 2019 SampleApp. All rights reserved.
//

import UIKit
import Alamofire

class ArticleViewController: UIViewController {



    var articles: [[String: Any]] = [] {
        didSet {
            tableView.reloadData()
        }
    }


    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        fetchArticles()

        // Do any additional setup after loading the view.
    }

    private func initTableView() {
        tableView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
        tableView.rowHeight = 96
    }


    private func fetchArticles() {
        guard let url: URL = URL(string: "http://qiita.com/api/v2/items") else { return }
        let task: URLSessionTask  = URLSession.shared.dataTask(with: url, completionHandler: {data, response, error in
            do {
                guard let data = data else { return } // guard letに書き換え
                guard let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [Any] else { return } // guard letに書き換え
                let articles = json.flatMap { (article) -> [String: Any]? in
                    return article as? [String: Any]
                } // flatMapに書き換え
                DispatchQueue.main.async() { () -> Void in
                    self.articles = articles
                }
            }
            catch {
                print(error)
            }
        })
        task.resume()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



extension ArticleViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count //変更
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ArticleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell") as! ArticleTableViewCell
        let article = articles[indexPath.row] //追加
        let title = article["title"] as! String //追加
        cell.bindDataCell(title: title) //変更
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section: \(indexPath.section) index: \(indexPath.row)")
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        return
    }
}

