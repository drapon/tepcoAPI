tepcoAPI
========

東京電力APIをSwiftで叩いてみる

````
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

````
