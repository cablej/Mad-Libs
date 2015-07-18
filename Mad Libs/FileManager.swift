//
//  FileManager.swift
//  Mad Libs
//
//  Created by Jack Cable on 7/1/15.
//  Copyright © 2015 Jack Cable. All rights reserved.
//

import UIKit

class FileManager: NSObject {
    
    func writeStringToPath(text:String, fileName:String) -> Bool {
        if let dirs : [String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] { //finds the document directory
            let dir = dirs[0] //is the document directory
            let path = dir.stringByAppendingPathComponent(fileName)
            
            do {
                try text.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding)
                return true
            } catch {
                return false
            }
            
        }
    }
    
    func readStringFromPath(fileName:String) -> String? {
        if let dirs : [String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] { //finds the document directory
            let dir = dirs[0] //is the document directory
            let path = dir.stringByAppendingPathComponent(fileName)
            
            do {
                return try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            } catch {
                return nil
            }
            
        }
    }
    
}
