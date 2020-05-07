//
//  MessagesViewController.swift
//  HW17
//
//  Created by Macintosh HD on 5/7/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController,getMessage {
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayOfMessages:[Message] = [
        Message(name: "Giorgi Ezugbaia", message:"Get free icons of Contact in iOS style for your design. The free images are pixel perfect and available in png and vector. Download icons in all formats or edit them for your designs."),
        Message(name: "Walter White", message: "Who are you talking to right now? Who is it you think you see? Do you know how much I make a year? I mean, even if I told you, you wouldn't believe it. Do you know what would happen if I suddenly decided to stop going into work? A business big enough that it could be listed on the NASDAQ goes belly up. Disappears! It ceases to exist without me. No, you clearly don't know who you're talking to, so let me clue you in. I am not in danger, Skyler. I am the danger. A guy opens his door and gets shot and you think that of me? No. I am the one who knocks!"),
        Message(name: "TBC", message: "A web interface is also available. Launched on 12 November 2014."),
        Message(name: "FBI", message: "FBI Open Up!"),
        
    
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(MessagesTableViewCell.nib(), forCellReuseIdentifier: MessagesTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func onAddNewMessage(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addMessage = storyboard.instantiateViewController(withIdentifier: "addMessageViewController") as! addMessageViewController
        
        addMessage.delegate = self
        
        self.navigationController?.pushViewController(addMessage, animated: true)
    }
    func returnMessage(messageReturned: Message) {
        arrayOfMessages.append(messageReturned)
        tableView.reloadData()
    }
}





extension MessagesViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let messagePage = storyboard.instantiateViewController(withIdentifier: "readMessage") as! readMessage
        
        messagePage.message = arrayOfMessages[indexPath.row].message
        self.navigationController?.pushViewController(messagePage, animated: true)
    }
}

extension MessagesViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessagesTableViewCell.identifier, for: indexPath) as! MessagesTableViewCell
        
        let name = arrayOfMessages[indexPath.row].name
        let message = arrayOfMessages[indexPath.row].message

        cell.configure(name: name, message: message)
        return cell
    }
    
    
}
