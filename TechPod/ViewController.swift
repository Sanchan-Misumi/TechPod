//
//  ViewController.swift
//  TechPod
//
//  Created by Maho Misumi on 2017/09/19.
//  Copyright © 2017年 Maho Misumi. All rights reserved.
//

import UIKit
import AVFoundation


//UITableViewのデータソースメソッドを使うためのプロトコル宣言を行う(データソースを採用する？)
//UITableViewのデリゲートメソッドを使うためにデリゲートを採用する

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    //ストーリーボードで扱うTableViewを宣言
    @IBOutlet var table:UITableView!
    
    //曲名を入れるための配列
    var songNameArray = [String]()
    
    //曲のファイル名を入れる目の配列
    var fileNameArray = [String]()
    
    //音楽家の画像名を入れるための配列
    var imageNameArray = [String]()
    
    //音楽を再生するための配列
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //テーブルビューのデータソースメソッドはViewControllerクラスに書くよ、という設定
        table.dataSource = self
        //テーブルビューのデリゲートメソッドはViewControllerに書くよという設定
        table.delegate = self
        //songNameArrayに曲名を入れていく
        songNameArray = ["カノン", "エリーゼのために", "G戦上のマリア"]
        //FileNameArrayに曲名を入れていく
        fileNameArray = ["cannon", "elise", "aria"]
        //ImageNameArrayに作曲家の名前を入れていく
        imageNameArray = ["Pachelbel.jpg","Beethoven.jpg","Bach.jpg"]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //セルの数をSongNameArrayの要素の数にする
        return songNameArray.count
        
    }
    //ID付きのセルを取得して、セル付属のtextlabelにテストと表示させてみる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
    
        //セルのsongNameArrayの曲名を表示する
        cell?.textLabel?.text = songNameArray[indexPath.row]
        
        //セルに音楽家の画像を表示する
        cell?.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        return cell!
    
        
    }
    //セルが押された時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(songNameArray[indexPath.row])が選ばれました")
        
        //音楽ファイルの設定
     let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row],ofType:"mp3")!)
        
        //再生の準備
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        
        //音楽を再生
        audioPlayer.play()
        
        
    }
}


