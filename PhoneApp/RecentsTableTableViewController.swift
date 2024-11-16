import UIKit

class RecentsTableTableViewController: UITableViewController, UISearchResultsUpdating {
    
    let RecentContacts = [
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
        ("Sneha", "mobile", "S"),
        ("Caleb Wilson", "mobile", "CW"),
        ("Elijah Coleman", "mobile", "EC"),
        ("Brittany Mitchell", "mobile", "BM"),
        ("Mayya", "WhatsApp", "M"),
        ("Appa", "WhatsApp", "A"),
        ("Venky", "WhatsApp", "V"),
        ("Sneha", "mobile", "S")
    ]
    
    var filteredContacts: [(String, String, String)] = []
    var isFiltering: Bool {
        return searchController.isActive && !searchController.searchBar.text!.isEmpty
    }

    let searchController = UISearchController(searchResultsController: nil)
    let segmentedControl = UISegmentedControl(items: ["All", "Missed"])

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Recents"
        
        // Enable large titles for the navigation controller
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always

        // Customize navigation bar appearance
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.tintColor = .systemBlue
        
        // Set up segmented control in the navigation bar
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        segmentedControl.backgroundColor = .black
        segmentedControl.selectedSegmentTintColor = .systemBlue
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        navigationItem.titleView = segmentedControl
        
        // Set up the search controller
        setupSearchController()

        // Register the custom UITableViewCell
        tableView.register(RecentsTableViewCell.self, forCellReuseIdentifier: "recents cell")
        tableView.backgroundColor = .black
        tableView.alwaysBounceVertical = true
        
    }

    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.barStyle = .black // Sets the general appearance of the search bar
        searchController.searchBar.searchBarStyle = .minimal // Makes the background transparent for customization
        navigationItem.searchController = searchController
        //navigationItem.hidesSearchBarWhenScrolling = false // Keep search bar visible when scrolling
        definesPresentationContext = true
        
        // Set up the tab bar appearance
        if let tabBar = tabBarController?.tabBar {
            tabBar.barTintColor = .black
        }
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
            // Update the list based on the selected segment
            // For simplicity, you can add a condition to filter "missed" calls differently if applicable
            tableView.reloadData()
        }


    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? filteredContacts.count : RecentContacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recents cell", for: indexPath) as! RecentsTableViewCell
        
        let contact = isFiltering ? filteredContacts[indexPath.row] : RecentContacts[indexPath.row]
        cell.configure(with: contact)
        
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        filteredContacts = RecentContacts.filter { contact in
            contact.0.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
}



class RecentsTableViewCell: UITableViewCell {
    
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

        profileImageView.image = nil
        initialsLabel.isHidden = false
    }
}
