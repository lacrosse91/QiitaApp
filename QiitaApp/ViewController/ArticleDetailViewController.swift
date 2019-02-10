//
//  ArticleDetailViewController.swift
//  QiitaApp
//
//  Created by 川内翔一朗 on 2019/02/10.
//  Copyright © 2019 SampleApp. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController {

    var article: Article?
    var isLikeButtonPush: Bool = false

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
//            likeButton.titleLabel?.text = "like"
            likeButton.setTitle("unlike", for: .normal)
            isLikeButtonPush = false
        } else {
            print("押された")
//            likeButton.titleLabel?.text = "liked"
            likeButton.setTitle("liked", for: .normal)
            isLikeButtonPush = true

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
