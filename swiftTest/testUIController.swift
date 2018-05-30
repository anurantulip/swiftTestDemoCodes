//
//  testUIController.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 12/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//

import UIKit
import Alamofire
class testUIController: UIViewController ,UITextFieldDelegate{
    @IBOutlet weak var txtName:UITextField!
    var kbHeight: CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
        makeGetCallWithAlamofire()
        
        /*
        NotificationCenter.default.addObserver(self, selector: #selector(testUIController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(testUIController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
*/
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardNotification(notification:)),
                                               name: NSNotification.Name.UIKeyboardWillChangeFrame,
                                               object: nil)
 
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
    }
    @objc func keyboardWillShow(notification:NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize =  (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                kbHeight = keyboardSize.height
                self.animateTextField(up: true)
            }
        }
    }
    
    @objc func keyboardWillHide(notification:NSNotification) {
        self.animateTextField(up: false)
    }
    @objc func keyboardNotification(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            let endFrameY = endFrame?.origin.y ?? 0
            kbHeight = endFrame?.size.height
            if endFrameY >= UIScreen.main.bounds.size.height {
               
                self.animateTextField(up: false)
            } else {
                self.animateTextField(up: true)
            }
        }
    }
    func animateTextField(up: Bool) {
        let movement = (up ? -kbHeight : kbHeight)
        UIView.animate(withDuration: 0.3, animations: {
            self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement!)
           
        })
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UIImageview
    func createImageView(){
        let imgview = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imgview.loadImageFromLocal(imageName:"img1")
        imgview.loadImageFromRemote(imageLink:"")
        imgview.alpha = 1
        imgview.layer.cornerRadius = 5
        self.view.addSubview(imgview)
    }
    //MARK: - UIButton
    func createUIButton(){
        let btn = UIButton(type:.custom)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.setBackgroundImage(UIImage(named:""), for: .normal)
        btn.frame = CGRect(x: 0, y: 0, width: 100, height: UIScreen.main.bounds.height)
        btn.setTitle("Anuran", for:.normal)
        btn.addTarget(self, action: #selector(pressButton),  for: .touchUpInside)
        btn.layer.cornerRadius = 5
        
        btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        btn.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        btn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 18).isActive = true
    }
    @objc func pressButton(id:UIButton){
        
    }
    
    //MARK: - UITextField
    func createTextFiled(){
        let txtfield = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        txtfield.placeholder = "Enter Name"
        txtfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 40))
        txtfield.leftViewMode = .always
        txtfield.keyboardType = .emailAddress
        txtfield.returnKeyType = .done
        txtfield.autocapitalizationType = .words
        txtfield.isSecureTextEntry = false
        txtfield.textColor = UIColor.gray
        txtfield.font = UIFont(name: "", size: 20)
        txtfield.addTarget(self, action:#selector(txtDidchange), for: .editingChanged)
        
    }
   @objc func txtDidchange(id:UITextField){
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //animateViewMoving(up: true, moveValue: 250)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        //animateViewMoving(up: false, moveValue: 250)
    }
    
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:TimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    
    func tappedSubmitButton() {
        guard let name = txtName.text, isValid(name: name) else {
                        return
        }
        
    }
    
    func isValid(name: String) -> Bool {
        // check the name is between 4 and 16 characters
        if !(4...16 ~= name.count) {
            return false
        }
        
        return true
    }
    
    func serverCall(){
        Alamofire.request("http://jsonplaceholder.typicode.com/posts/1").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
    
    func makeGetCallWithAlamofire() {
        if Helper.isConnectedToInternet {
            print ("connection available")
        }else{
            print ("no connection")
        }
        let todoEndpoint: String = "https://jsonplaceholder.typicode.com/todos/1"
        Alamofire.request(todoEndpoint)
            .responseJSON { response in
                print("Request: \(String(describing: response.request))")   // original url request
                print("Response: \(String(describing: response.response))") // http url response
                print("Result: \(response.result)")                         // response serialization result
                // check for errors
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error calling GET on /todos/1")
                    print(response.result.error!)
                    return
                }
                
                // make sure we got some JSON since that's what we expect
                guard let json = response.result.value as? [String: Any] else {
                    print("didn't get todo object as JSON from API")
                    if let error = response.result.error {
                        print("Error: \(error)")
                    }
                    return
                }
                
                // get and print the title
                guard let todoTitle = json["title"] as? String else {
                    print("Could not get todo title from JSON")
                    return
                }
                print("The title is: " + todoTitle)
        }
      }
    
}
