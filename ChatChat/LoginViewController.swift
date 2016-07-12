/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class LoginViewController: UIViewController {

    // MARK: Properties
    var ref: FIRAuth! // 1. First you specify a Firebase database reference as a property
//    var ref: Firebase! **No longer in use**
    
  override func viewDidLoad() {
    super.viewDidLoad()
//    ref = Firebase(url: "https://<my-firebase-app>.firebaseio.com") // 2
    ref = FIRAuth.auth()
    
  }

  @IBAction func loginDidTouch(sender: AnyObject) {
    ref.signInAnonymouslyWithCompletion { (user, error) in
        if error != nil {
            print(error!.description); return }
        
        print(self.ref.currentUser?.displayName)
        
        self.performSegueWithIdentifier("LoginToChat", sender: self)
    }
  }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        let navigationViewController = segue.destinationViewController as! UINavigationController
        let chatViewController = navigationViewController.viewControllers.first as! ChatViewController
        
        chatViewController.senderId = "SomeUserId"
        chatViewController.senderDisplayName = "Some User"

    }
  
}

