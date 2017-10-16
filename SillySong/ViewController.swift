//
//  ViewController.swift
//  SillySong
//
//  Created by Kara Kelley on 10/15/17.
//  Copyright © 2017 Kara Kelley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    @IBAction func displayLyrics(_ sender: Any) {
        if let text = nameField.text, !text.isEmpty {
          lyricsView.text = (lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: self.nameField.text!))
        }
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

func shortNameFromName(name: String) -> String {
    var shortName = name.lowercased()
    if shortName.prefix(1).contains("aeiou") {
        return shortName
    } else {
        return String(shortName.characters.drop(while: {!"aeiou".characters.contains($0)}))
    }
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func lyricsForName(lyricsTemplate: String, fullName: String) -> String  {
    let shortName = shortNameFromName(name: fullName)
    let partialSong = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
    let fullSong = partialSong.replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    return fullSong
}

