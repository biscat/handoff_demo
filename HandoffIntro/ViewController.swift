//
//  ViewController.swift
//  HandoffIntro
//
//  Created by William Wong on 09/12/2015.
//  Copyright © 2015 Fleetmatics. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    var noteTitleField: UITextField!
    var noteContentView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let activity = NSUserActivity(activityType: "com.fleetmatics.HandoffIntro")
        activity.title = "Note"
        activity.userInfo = ["title": "", "content": ""]
        userActivity = activity
        userActivity?.becomeCurrent()
        userActivity?.eligibleForSearch = true
        userActivity?.eligibleForPublicIndexing = true
    }
    
    override func viewDidAppear(animated: Bool) {
        self.noteTitleField = UITextField(frame: CGRect(x: 12, y: 28, width: self.view.frame.width - 22, height: 20))
        self.noteTitleField.placeholder = "Note Title"
        self.noteTitleField.delegate = self
        
        self.noteContentView = UITextView(frame: CGRect(x: 8, y: 56, width: self.view.frame.width - 16, height: self.view.frame.height - 64))
        self.noteContentView.text = "Note Content"
        self.noteContentView.delegate = self
        
        self.view.addSubview(self.noteTitleField)
        self.view.addSubview(self.noteContentView)
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        if textView.text == "Note Content" {
            textView.text = ""
        }
    }
    
    //this call to update User Activity state
    override func updateUserActivityState(activity: NSUserActivity) {
        activity.addUserInfoEntriesFromDictionary(["title": (self.noteTitleField?.text)!, "content": self.noteContentView.text])
        super.updateUserActivityState(activity)
    }
    
    
    //call back of a textView to update activity state
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        self.updateUserActivityState(userActivity!)
        return true
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        self.updateUserActivityState(userActivity!)
        return true
    }
    
    //override this method in order to retrieve the information from the NSUserActivity
    override func restoreUserActivityState(activity: NSUserActivity) {
        self.noteTitleField.text = activity.userInfo?["title"] as? String
        self.noteContentView.text = activity.userInfo?["content"] as! String
    }
}
