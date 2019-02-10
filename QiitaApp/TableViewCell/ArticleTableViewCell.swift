//
//  ArticleTableViewCell.swift
//  QiitaApp
//
//  Created by 川内翔一朗 on 2019/02/09.
//  Copyright © 2019 SampleApp. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func bindDataCell(article: Article) {
        // 引数にArticleオブジェクトを受け取って、cellの作成を行います.
        // 現状まだ引数をいれずに適当な値を入れています.
        titleLabel.text = article.title
        dateLabel.text = article.date
        userLabel.text = article.user.id

        thumbImageView.sd_setImage(with: URL(string: article.user.imageUrl), placeholderImage: UIImage(named: "Image.png"))



//        // guard let で書くとき. ネストが深くならない、かつ、早期リターンできるのでこちら推奨.
//        // WebImageを使うとパフォーマンスが向上します
//        guard let thumbnailURL = URL(string: "https://i.vimeocdn.com/portrait/58832_300x300") else { return }
//        guard let thumb = try? Data(contentsOf: thumbnailURL) else { return }
//        thumbnail.image = UIImage(data: thumb)

    }
    
}
