//
//  TimelineViewController.swift
//  twitter_sample
//
//  Created by NAGAMINE HIROMASA on 2015/08/16.
//  Copyright (c) 2015年 Hiromasa Nagamine. All rights reserved.
//

import UIKit

class TimelineViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {

    let cellIdentifier = "tweetCell"
    var tweets:[Dictionary<String, AnyObject>]?

    // タイムライン画面のローディング(ライフサイクルメソッド)
    override func viewDidLoad() {
        super.viewDidLoad()
        // ツイートデータの初期化
        tweets = [  ["name": "Hiro", "description": "My name is AAA", "icon":"twitter_icon"],
                    ["name": "Account BBB", "description": "My name is BBB", "icon":"user_b_icon"],
                    ["name": "Account CCC", "description": "My name is CCC", "icon":"user_c_icon"],
                    ["name": "Account BBB", "description": "How old are you, CCC?", "icon":"user_b_icon"],
                    ["name": "Account CCC", "description": "My old is 17.", "icon":"user_c_icon"]]
    }

    // メモリーが不足した時にOSから呼ばれる(ライフサイクルメソッド)
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    // MARK: - Table view data source
    // テーブルが持つsectionの数を指定(UITableView ライフサイクルメソッド)
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Sectionは１つにする
        return 1
    }

    // テーブルがsectionごとに持つセルの数を指定(UITableView ライフサイクルメソッド)
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // ツイートarrayの要素の数をTableViewにreturn
        if let tweetsList = tweets {
            return tweetsList.count
        }

        return 0
    }

    // 各セルをsection, rowごとに初期化(UITableView ライフサイクルメソッド)
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        // TableViewの使っていないセルを再利用
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as? UITableViewCell

        // 再利用できるセルがなければ初期化
        if cell == nil {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellIdentifier)
        }

        // セルに表示するサムネ・ツイート・名前の設定
        var aCell = cell!
        aCell.imageView?.image = UIImage(named: (tweets![indexPath.row]["icon"] as? String)!)
        aCell.textLabel?.text = tweets![indexPath.row]["description"] as? String
        aCell.detailTextLabel?.text = tweets![indexPath.row]["name"] as? String

        return aCell
    }

    // 各セルの高さをsection, rowごとに指定(UITableView ライフサイクルメソッド)
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50.0
    }

    // セルをタップした時に呼ばれる(UITableView ユーザーアクションメソッド)
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showTimelineDetailViewController", sender: nil)
    }
    
}
