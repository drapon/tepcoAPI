//
//  ViewController.swift
//  createTodo
//
//  Created by Ryuichi Hayashi on 2014/07/26.
//  Copyright (c) 2014年 Ryuichi Hayashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let date = NSDate()
        
        //現在の日付を取得
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja")
        
        //書式を整える
        dateFormatter.dateFormat = "yyyy/MM/dd/HH"
        
        //データをフォーマット
        let d = dateFormatter.stringFromDate(date)
        
        let origin:NSString = "http://tepco-usage-api.appspot.com/"
        let origin_url = origin + d + ".json"
        
        let url = NSURL(string: origin_url)
        let request = NSURLRequest(URL: url)
        
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil)
        var array = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableLeaves, error: nil) as NSDictionary
        
        println(array)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

