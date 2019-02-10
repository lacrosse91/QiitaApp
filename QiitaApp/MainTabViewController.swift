//
//  MainTabViewController.swift
//  QiitaApp
//
//  Created by 川内翔一朗 on 2019/02/10.
//  Copyright © 2019 SampleApp. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Arrayにした方がきれいに見えそうです...
        let articleStoryboard = UIStoryboard(name: "Article", bundle: nil)
        let mypageStoryboard = UIStoryboard(name: "Mypage", bundle: nil)
        let articleViewController = articleStoryboard.instantiateInitialViewController() as! UINavigationController
        let mypageViewController = mypageStoryboard.instantiateInitialViewController() as! UINavigationController
        let viewControllers = [articleViewController, mypageViewController]
//        let viewControllers = [articleViewController]
        self.setViewControllers(viewControllers, animated: false)

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
