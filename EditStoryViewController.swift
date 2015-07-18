//
//  EditStoryViewController.swift
//  Mad Libs
//
//  Created by Jack Cable on 7/1/15.
//  Copyright © 2015 Jack Cable. All rights reserved.
//

import UIKit

class EditStoryViewController: UIViewController {
    
    let saveFileName = "story.txt"
    let fileManager = FileManager()

    @IBOutlet var storyTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let storyText = fileManager.readStringFromPath(saveFileName) {
            storyTextField.text = storyText
        } else {
            storyTextField.text = "Type your own MadLib here."
        }
    }
    
    @IBAction func onSaveButtonTapped(sender: UIBarButtonItem) {
        if fileManager.writeStringToPath(storyTextField.text, fileName: saveFileName) {
            dismissView()
        } else {
            print("error saving")
        }
    }
    
    @IBAction func onCancelButtonPressed(sender: UIBarButtonItem) {
        dismissView()
    }

    func dismissView() {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: {
            let secondPresentingVC = self.presentingViewController?.presentingViewController;
            secondPresentingVC?.dismissViewControllerAnimated(true, completion: {})
        })
    }

}
