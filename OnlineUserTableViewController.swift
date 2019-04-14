//
//  OnlineUserTableViewController.swift
//  crosswordPuzzle
//
//  Created by Shalise Ayromloo on 4/14/19.
//  Copyright © 2019 Shalise Ayromloo. All rights reserved.
//

import UIKit
import Firebase

class OnlineUsersTableViewController: UITableViewController {
    
    // MARK: Constants
    let userCell = "UserCell"
    
    // MARK: Properties
    var currentUsers: [String] = []
    let usersRef = Database.database().reference(withPath: "online")
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        usersRef.observe(.childAdded, with: { snap in
            guard let email = snap.value as? String else { return }
            self.currentUsers.append(email)
            let row = self.currentUsers.count - 1
            let indexPath = IndexPath(row: row, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .top)
        })
        usersRef.observe(.childRemoved, with: { snap in
            guard let emailToFind = snap.value as? String else { return }
            for (index, email) in self.currentUsers.enumerated() {
                if email == emailToFind {
                    let indexPath = IndexPath(row: index, section: 0)
                    self.currentUsers.remove(at: index)
                    self.tableView.deleteRows(at: [indexPath], with: .fade)
                }
            }
        })
    }
    
    // MARK: UITableView Delegate methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentUsers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: userCell, for: indexPath)
        let onlineUserEmail = currentUsers[indexPath.row]
        cell.textLabel?.text = onlineUserEmail
        return cell
    }
    
    // MARK: Actions
    @IBAction func signoutButtonPressed(_ sender: AnyObject) {
        let user = Auth.auth().currentUser! //first, get the currentUser and create onlineRef using its uid, which is a unique identifier representing the user
        /*while Firebase automatically adds the user to online upon sign in, it does not remove the user on sign out. Instead, it only removes users when they become disconnected. So, manually remove them here by calling removeValue to delete the value for onlineRef.*/
        let onlineRef = Database.database().reference(withPath: "online/\(user.uid)")
        onlineRef.removeValue { (error, _) in
            if let error = error { //within the completion closure, first check if there's an error and simply print it if so.
                print("Removing online failed: \(error)")
                return
            } //closes if-let
            do {
                try Auth.auth().signOut() //call Auth.auth().signOut() to remove the user's credentials from the keychain
                self.dismiss(animated: true, completion: nil) //if there isn't an error, dismiss the view controller
            } catch (let error) { //otherwise, print the error
                print("Auth sign out failed: \(error)")
            } //closes do-catch
        } //closes the closure after removeValue
    }
}
