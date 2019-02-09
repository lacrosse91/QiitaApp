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

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 96.0
        tableView.rowHeight = 96

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

extension ArticleViewController: UITableViewDelegate, UITableViewDataSource {
    // return the number of tableCells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    // draw the tableCells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ArticleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell") as! ArticleTableViewCell
        cell.bindDataCell()
        return cell
    }
}
