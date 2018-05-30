//
//  customDelegate.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 20/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//

import Foundation

protocol downloadCompleteDelegate : class {
    func downloadComplete(data:Data?)
}
class downloadManager{
    weak var delegate : downloadCompleteDelegate?
    
    func downloadFile(fromUrl:String){
        DispatchQueue.global(qos:.background).async {
            let url = URL(string:fromUrl)
            let data = try? Data(contentsOf: url!)
            if let data = data {
               self.delegate?.downloadComplete(data: data)
            }
            DispatchQueue.main.async {
                //refresh UI
            }
        }
    }
}


