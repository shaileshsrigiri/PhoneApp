//
//  FavoritesTableViewController.swift
//  PhoneApp
//
//  Created by Shailesh Srigiri on 11/14/24.
//

import UIKit

class FavoritesTableViewController: UITableViewController {
    
    let favoriteContacts = [
            ("Caleb Wilson", "mobile", "CW"),
            ("Elijah Coleman", "mobile", "EC"),
            ("Brittany Mitchell", "mobile", "BM"),
            ("Mayya", "WhatsApp", "M"),
            ("Appa", "WhatsApp", "A"),
            ("Venky", "WhatsApp", "V"),
            ("Sneha", "mobile", "S"),
            ("Caleb Wilson", "mobile", "CW"),
            ("Elijah Coleman", "mobile", "EC"),
            ("Brittany Mitchell", "mobile", "BM"),
            ("Mayya", "WhatsApp", "M"),
            ("Appa", "WhatsApp", "A"),
            ("Venky", "WhatsApp", "V"),
            ("Sneha", "mobile", "S")
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        tableView.backgroundColor = .black
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.tintColor = .systemBlue
                
        tableView.register(FavoriteTableViewCell.self, forCellReuseIdentifier: "Favorite Cell")
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addContact))
                navigationItem.rightBarButtonItem = addButton
                definesPresentationContext = true
        
        // Set up the tab bar appearance
        if let tabBar = tabBarController?.tabBar {
            tabBar.barTintColor = .black
                }
    }
    
    @objc private func addContact() {
            let alert = UIAlertController(title: "Add Contact", message: "This is where the add favorite contact functionality will be implemented.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favoriteContacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Favorite Cell", for: indexPath) as! FavoriteTableViewCell
        
        // Configure the custom cell
        let contact = favoriteContacts[indexPath.row]
        cell.configure(with: contact)
        
        return cell
    }


    // MARK: - Table view delegate

//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let contact = favoriteContacts[indexPath.row]
//        
//        // Show an alert to confirm the call action
//        let alert = UIAlertController(title: "Call \(contact.0)?", message: contact.1, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Call", style: .default, handler: { _ in
//            print("Calling \(contact.0)...")
//        }))
//        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//        
//        present(alert, animated: true, completion: nil)
//        
//        // Deselect the row after the action
//        tableView.deselectRow(at: indexPath, animated: true)
//    }

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


import UIKit

// Custom UITableViewCell to match the Phone app's Favorites screen
class FavoriteTableViewCell: UITableViewCell {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGray4
        return imageView
    }()
    
    let initialsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    let contactTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .systemGray
        return label
    }()
    
    let infoButton: UIButton = {
        let button = UIButton(type: .detailDisclosure)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .systemBlue
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        contentView.addSubview(profileImageView)
        contentView.addSubview(initialsLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(contactTypeLabel)
        contentView.addSubview(infoButton)
        
        // Layout Constraints
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            profileImageView.heightAnchor.constraint(equalToConstant: 50),
            
            initialsLabel.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor),
            initialsLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 15),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            
            contactTypeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            contactTypeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            
            infoButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            infoButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with contact: (String, String, String)) {
        nameLabel.text = contact.0
        contactTypeLabel.text = contact.1
        initialsLabel.text = contact.2

        // Set placeholder initials or profile image
        profileImageView.image = nil
        initialsLabel.isHidden = false
        
        // You could also add logic to set an image if available
        if contact.0 == "Nikhitha Melige" {
            profileImageView.image = UIImage(named: "profile_picture") // Replace with actual image name
            initialsLabel.isHidden = true
        }
    }
}
