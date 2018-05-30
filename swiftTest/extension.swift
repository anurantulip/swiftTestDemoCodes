//
//  extension.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 12/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//

import Foundation
import UIKit
//MARK: - UIImageView
extension UIImageView {
    func loadImageFromRemote(imageLink:String){
        DispatchQueue.global(qos:.userInteractive).async {
            guard let fileUrl = URL(string: imageLink),let data = try? Data(contentsOf: fileUrl),let image = UIImage(data: data)
            else{
                return
            }
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
    func loadImageFromLocal(imageName:String){
      guard  let imageUrl = Bundle.main.url(forResource: imageName, withExtension:"png"),
        let data = try? Data(contentsOf: imageUrl), let image = UIImage(data: data)else{
            return
        }
        self.image = image
    }
}

//MARK: - String
extension String {
    func trim() -> String
    {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
    func isValidEmail(email:String) -> Bool{
        return true
    }
    func isValidPhoneNumber(email:String) -> Bool{
        return true
    }
}
