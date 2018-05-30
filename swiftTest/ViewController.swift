//
//  ViewController.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 20/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let obj = downloadManager()
        obj.downloadFile(fromUrl: "")
        
        let obj2 = closureTest()
        obj2.downLoadDataFromUrl(""){
            print($0)
        }
        obj2.downLoadDataFromUrl("", oncomplete: {(data:String) in print(data)})
        obj2.requestData { [weak self] (data: String) in
            self?.useData(data: data)
        }
        
        obj2.onDataUpdate = { [weak self] (data: String) in
            self?.useData(data: data)
        }
        obj2.dataRequest()
        
    }
    private func useData(data: String) {
        print(data)
    } 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ViewController : downloadCompleteDelegate{
    func downloadComplete(data: Data?) {
        let image = UIImage(data: data!)
    }
    
    
}
