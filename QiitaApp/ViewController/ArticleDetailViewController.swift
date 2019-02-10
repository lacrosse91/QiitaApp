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

    @IBOutlet weak var bodyTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let article = article {
            bodyTextView.text = article.body
            bodyTextView.isEditable = false
        }

        // Do any additional setup after loading the view.
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
