//
//  ViewController.swift
//  createTodo
//
//  Created by Ryuichi Hayashi on 2014/07/26.
//  Copyright (c) 2014年 Ryuichi Hayashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIApplicationDelegate {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let date = NSDate()
        
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
        let connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)
        
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil)
        let dictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableLeaves, error: nil) as NSDictionary
        
        
        
        func JSONStringify(jsonObj: AnyObject) -> String {
            var e: NSError?
            let jsonData = NSJSONSerialization.dataWithJSONObject(
                jsonObj,
                options: NSJSONWritingOptions(0),
                error: &e)
            if e {
                return ""
            } else {
                return NSString(data: jsonData, encoding: NSUTF8StringEncoding)
            }
        }

        
        //Capacity
        var capaLabel = UILabel(frame : CGRectMake(20, 200, 300, 20))
        for (tepcoCode, tepcoName) in dictionary {
            if(tepcoCode as NSString == "capacity"){
               capaLabel.text = "最大値: \(tepcoName)"
               var capaTepco = "\(tepcoName)"
            }
        }
        self.view.addSubview(capaLabel)
        
        
        //forecast_peak_usage
        var peakLabel = UILabel(frame : CGRectMake(20, 200, 300, 100))
        for (tepcoCode, tepcoName) in dictionary {
            if(tepcoCode as NSString == "forecast_peak_usage"){
                peakLabel.text = "利用電力: \(tepcoName)"
                let usedTepco = "\(tepcoName)"
            }
        }
        self.view.addSubview(peakLabel)
        
        //残り
//        var zanLabel = UILabel(frame : CGRectMake(20, 200, 300, 180))
//        zanLabel.text = "aaaa"
//        self.view.addSubview(zanLabel)

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

