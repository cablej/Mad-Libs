//
//  ViewStoryViewController.swift
//  Mad Libs
//
//  Created by Jack Cable on 7/1/15.
//  Copyright © 2015 Jack Cable. All rights reserved.
//

import UIKit

class ViewStoryViewController: UIViewController {
    
    @IBOutlet var storyLabel: UILabel!
    
    let fileManager = FileManager()
    let saveFileName = "story.txt"
    
    var words : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        var text = ""
        var index = 0
        
        if let storyText = fileManager.readStringFromPath(saveFileName) {
            let wordsOfStory = storyText.componentsSeparatedByString(" ")
            for word in wordsOfStory {
                var type = word
                let last = type.characters.last
                var extra = ""
                if (!((last >= "a" && last <= "z") || (last >= "A" && last <= "Z")) && last != "]" ){
                    extra += String(last!)
                    type = String(dropLast(type.characters))
                }
                if(type.characters.first == "[" && type.characters.last == "]") {
                    text += words[index] + extra + " "
                    index++
                } else {
                    text += word + " "
                }
            }
        } else {
            print("Error reading data")
        }
        
        storyLabel.text = text
    }

}
