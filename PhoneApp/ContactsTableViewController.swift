//
//  ContactsTableViewController.swift
//  PhoneApp
//
//  Created by Shailesh Srigiri on 11/14/24.
//

import UIKit

class ContactsTableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    let contacts = [
        "","A","Aaron Smith", "Abigail Johnson", "Adam Brown", "Alan White", "Alexandra Green", "Alice King", "Amanda Harris", "Andrew Walker", "Angela Scott", "Anna Parker",
        "Anthony Lee", "Ashley Young", "Austin Hall","","B", "Barbara Wright", "Benjamin Nelson", "Bethany Robinson", "Blake Lewis", "Brandon Campbell", "Brittany Mitchell", "Brooke Carter",
        "Bryan Davis","","C", "Caleb Wilson", "Cameron Murphy", "Carl Cooper", "Caroline Brooks", "Cassandra Edwards", "Catherine Morris", "Charles Rogers", "Charlotte Reed", "Chloe Griffin",
        "Chris Wood", "Christian Bell", "Christina Kelly", "Christopher Ward", "Cindy Howard", "Claire Cox", "Colin Morgan", "Connor Peterson", "Courtney Richardson", "Craig Simmons","","D",
        "Daniel Russell", "Danielle Foster", "David Powell", "Deborah Hughes", "Denise James", "Derek Butler", "Diana Sanders", "Dominic Ross", "Donald Perry", "Donna Long",
        "Dorothy Ramirez", "Dylan Powell","","E", "Edward Jenkins", "Elaine Barnes", "Elijah Coleman", "Elizabeth Bryant", "Ella Lopez", "Emily Gonzalez", "Emma Evans", "Eric Fisher",
        "Ethan Peterson", "Evelyn Torres","","F", "Faith Simmons", "Fiona Bryant", "Frank Gray","","G", "Gabriel King", "Gary Bennett", "George Ward", "Grace Washington", "Gregory Henderson","","H",
        "Hannah Jenkins", "Harry Reed", "Heather Torres", "Henry Adams", "Holly Alexander","","I", "Ian Bell", "Isaac Rogers", "Isabelle Griffin","","J", "Jack Young", "Jacob Russell",
        "James Murphy", "Jamie Howard", "Jane Anderson", "Jared Butler", "Jason Lewis", "Jeanette Cooper", "Jeffrey Powell", "Jennifer Ramirez", "Jessica Brooks", "Jillian Cox",
        "Joan Perry", "Joel Campbell", "John Simmons", "Jonathan Hughes", "Joseph Barnes", "Joshua King", "Julia Martin", "Julie Bailey", "Justin Perry","","K", "Kaitlyn Watson",
        "Katherine Young", "Kayla Scott", "Keith Lee", "Kelly Fisher", "Kevin Foster", "Kimberly James", "Kyle Sanders","","L", "Landon Adams", "Laura Hall", "Lauren Jenkins",
        "Liam Brown", "Linda Perry", "Logan Howard", "Lucas Rogers", "Luke Cox","","M", "Madeline Johnson", "Madison Gray", "Makayla Brooks", "Marcus Lee", "Margaret Scott", "Maria Lopez",
        "Mark Evans", "Martha Collins", "Mary Ward", "Mason King", "Matthew Russell", "Megan Richardson", "Melissa Morgan", "Michael Simmons", "Michelle Campbell", "Molly Bailey","","N",
        "Nathan Parker", "Nicholas Lewis", "Noah Young","","O", "Oliver Johnson", "Olivia White", "Owen Green","","P", "Patrick Johnson", "Pamela Robinson", "Patrick Reed", "Paul Davis", "Peter Murphy", "Philip Bryant","","R",
        "Rachel Martin", "Rebecca Brooks", "Richard James", "Robert Howard", "Ryan Griffin","","S", "Samuel Johnson", "Samantha Harris", "Samuel Walker", "Sandra King", "Sara Nelson", "Sarah Jenkins",
        "Scott Ward", "Sean Cooper", "Sophia Brown", "Stephanie Hughes", "Steven Gray", "Susan Adams", "Sydney Perry","","T", "Taylor Johnson", "Taylor Wilson", "Thomas White", "Timothy Campbell",
        "Tyler Parker","","V", "Vanessa Young", "Victoria Lopez", "Vincent Bennett","","W", "William Johnson", "William Powell","","Z", "Zachary Ross"
    ]
    
    var filteredContacts = [String]()
    var isFiltering: Bool {
        return searchController.isActive && !searchController.searchBar.text!.isEmpty
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the navigation bar
        title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.tintColor = .systemBlue
        
        // Set up the search controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.delegate = self
        searchController.searchBar.barStyle = .black // Sets the general appearance of the search bar
        searchController.searchBar.searchBarStyle = .minimal // Makes the background transparent for customization
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        
        
        // Register a basic UITableViewCell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "contacts cell")
        tableView.backgroundColor = .black
        
        
        // Add a button to the navigation bar
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addContact))
        navigationItem.rightBarButtonItem = addButton
        
        // Set up the tab bar appearance
        if let tabBar = tabBarController?.tabBar {
            tabBar.barTintColor = .black
                }
    }
    
    @objc private func addContact() {
        let alert = UIAlertController(title: "Add Contact", message: "This is where the add contact functionality will be implemented.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? filteredContacts.count : contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contacts cell", for: indexPath)
        let contact = isFiltering ? filteredContacts[indexPath.row] : contacts[indexPath.row]
        
        // Configure the cell
        cell.textLabel?.text = contact
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .black
        cell.selectionStyle = .none
        return cell
    }
    
    // MARK: - Search results updating
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        filteredContacts = contacts.filter { contact in
            contact.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
}
