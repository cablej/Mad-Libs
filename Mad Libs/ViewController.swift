//
//  ViewController.swift
//  Mad Libs
//
//  Created by Jack Cable on 7/1/15.
//  Copyright © 2015 Jack Cable. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let saveFileName = "story.txt"
    let fileManager = FileManager()
    var types: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTableData()
    }
    
    override func viewDidAppear(animated: Bool) {
        loadTableData()
        tableView.reloadData()
    }
    
    func loadTableData() {
        types = []
        if let storyText = fileManager.readStringFromPath(saveFileName) {
            let words = storyText.componentsSeparatedByString(" ")
            for word in words {
                var type = word
                let last = type.characters.last
                if (!((last >= "a" && last <= "z") || (last >= "A" && last <= "Z")) && last != "]" ){
                    type = String(dropLast(type.characters))
                }
                if(type.characters.first == "[" && type.characters.last == "]") {
                    type = String(dropLast(dropFirst(type.characters)))
                    types.append(String(type))
                }
            }
        } else {
            print("Error reading data")
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("MadLibsTableViewCell") as! MadLibsTableViewCell
        cell.typeLabel.text = types[indexPath.row]
        cell.inputField.hidden = false;
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if(sender.title != "Submit") {
            return;
        }
        let dvc = segue.destinationViewController as! ViewStoryViewController
        dvc.words = getWords()
    }
    
    func getWords() ->[String] {
        var words: [String] = []
        for cell in tableView.visibleCells {
            let cellAsCustom = cell as! MadLibsTableViewCell
            let text = cellAsCustom.inputField.text
            words.append(text!)
        }
        return words
    }

}

