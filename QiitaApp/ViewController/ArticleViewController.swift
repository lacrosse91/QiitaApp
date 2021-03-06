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


    private let viewmodel = ArticleViewModel()



    private var articles: [Article] {
        get {
            return viewmodel.articles
        }
        set(newValue) {
            viewmodel.articles = newValue
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    


    override func viewDidLoad() {
        super.viewDidLoad()

        initTableView()
        load()
        // Do any additional setup after loading the view.
    }

    private func initTableView() {
        tableView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
        tableView.rowHeight = 96
    }



    private func load() {
        viewmodel.fetchArticles()
            .onSuccess { [weak self] data in
                self?.articles = data
                self?.tableView.reloadData()
                print(data)
            }
            .onFailure { [weak self] error in
                print("errorrrr")
        }
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
        cell.bindDataCell(article: article) //変更
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }
}

extension ArticleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section: \(indexPath.section) index: \(indexPath.row)")
        let storyboard: UIStoryboard = UIStoryboard(name: "ArticleDetail", bundle: nil)
        if let next: ArticleDetailViewController = storyboard.instantiateViewController(withIdentifier: "ArticleDetail") as? ArticleDetailViewController {
            next.article = articles[indexPath.row]
            navigationController?.pushViewController(next, animated: true)
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        return
    }
}

