//
//  MypageViewController.swift
//  QiitaApp
//
//  Created by 川内翔一朗 on 2019/02/10.
//  Copyright © 2019 SampleApp. All rights reserved.
//

import UIKit
import RealmSwift

class MypageViewController: UIViewController {

    private let viewmodel = ArticleViewModel()

    @IBOutlet weak var tableView: UITableView!

    var likedArticles: Results<RealmArticle>?{
        didSet {
            tableView.reloadData()
        }
    }



    override func viewDidLoad() {
        super.viewDidLoad()

        initTableView()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // デフォルトRealmを取得
        let realm = try! Realm()
        // 一覧を取得：金額を条件に、登録日時が新しい順でソート
        self.likedArticles = realm.objects(RealmArticle.self)
    }




    private func initTableView() {
        tableView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
        tableView.rowHeight = 96
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

extension MypageViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return likedArticles?.count ?? 0 //変更
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ArticleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell") as! ArticleTableViewCell
        let likeArticle = likedArticles![indexPath.row]
        cell.bindDataCell(article: likeArticle)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }
}

extension MypageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section: \(indexPath.section) index: \(indexPath.row)")

    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        return
    }
}

