//
//  ViewController.swift
//  twitter_sample
//
//  Created by NAGAMINE HIROMASA on 2015/08/16.
//  Copyright (c) 2015年 Hiromasa Nagamine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var loginButton: UIButton!
    var accountsList:[Dictionary<String,String>]?

    // ログイン画面のローディング(ライフサイクルメソッド)
    override func viewDidLoad() {
        super.viewDidLoad()

        // アカウントデータを配列に持たせる
        accountsList = [["name":"@ken"], ["name":"@jeff"], ["name":"@chris"]]
    }

    // メモリーが不足した時にOSから呼ばれる(ライフサイクルメソッド)
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // ログインボタンを押すと呼ばれる(ユーザーアクションメソッド)
    @IBAction func tappedLoginButton(sender: AnyObject) {
        // 1. アクションシートの初期化
        // 1-1. アクションシートの作成・タイトルの初期化
        var accountSelectionSheet = UIAlertController()
        accountSelectionSheet.title = "Select Account"

        // 1-2. アカウントが選択された時の処理 (クロージャー)
        let selectAction =  { (var action: UIAlertAction!) -> Void in
            self.performSegueWithIdentifier("segueTimelineViewController", sender: nil)
        }

        // 1-3. アカウントのリストと選択時の処理をアクションシートへ追加
        if let accounts:[Dictionary<String, String>] = accountsList{
            for account in accounts {
                // accountListから１つづつアカウントを読み込んで、アクションシートのボタンに追加
                // その際、それぞれのボタンにselectAction処理を追加している
                let action = UIAlertAction(title: account["name"]!, style: .Default, handler: selectAction)
                accountSelectionSheet.addAction(action)
            }
        }

        // 1-4. アクションシートにキャンセルボタンの追加・シャンせるアクションの追加
        let CanceledAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        accountSelectionSheet.addAction(CanceledAction)

        // 2. アクションシートの表示
        self.presentViewController(accountSelectionSheet, animated: true, completion: nil)
    }

}

