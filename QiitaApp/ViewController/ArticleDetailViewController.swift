//
//  ArticleDetailViewController.swift
//  QiitaApp
//
//  Created by 川内翔一朗 on 2019/02/10.
//  Copyright © 2019 SampleApp. All rights reserved.
//

import UIKit
import RealmSwift
class ArticleDetailViewController: UIViewController {

    var article: Article?
    var isLikeButtonPush: Bool = false
    var likedArticle = RealmArticle()

    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var likeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let article = article {
            bodyTextView.text = article.body
            bodyTextView.isEditable = false
        }

        // Do any additional setup after loading the view.
    }

    @IBAction func likeButton(_ sender: UIButton) {

        if (isLikeButtonPush) {
            print("押された")
            likeButton.setTitle("unlike", for: .normal)
            isLikeButtonPush = false
            /*
             モデルオブジェクトの削除
             */
            do {
                let realm = try Realm()

                try! realm.write {
                    realm.delete(likedArticle)
                }
            } catch {
            }

        } else {
            print("押された")
            likeButton.setTitle("liked", for: .normal)
            isLikeButtonPush = true
            do {
                let realm = try Realm()

                likedArticle.title = article!.title
                likedArticle.body = article!.body
                likedArticle.date = article!.date
                likedArticle.imageUrl = article!.user.imageUrl
                likedArticle.user = article!.user.id


                try! realm.write {
                    realm.add(likedArticle)
                    print("成功だよ", likedArticle)

                }

            } catch {
                print("エラーだよ")

            }

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
