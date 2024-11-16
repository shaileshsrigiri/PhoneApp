//
//  VoicemailViewController.swift
//  PhoneApp
//
//  Created by Shailesh Srigiri on 11/15/24.
//

import UIKit

class VoicemailViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        // Set background color to black
        view.backgroundColor = .black

        // Set up navigation bar
        title = "Voicemail"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.tintColor = .systemBlue

        // Add the "Greeting" button on the right side of the navigation bar
        let greetingButton = UIBarButtonItem(title: "Greeting", style: .plain, target: self, action: #selector(greetingButtonTapped))
        navigationItem.rightBarButtonItem = greetingButton

        // Set up the "No Voicemail" label
        let noVoicemailLabel = UILabel()
        noVoicemailLabel.text = "No Voicemail"
        noVoicemailLabel.textColor = .systemGray
        noVoicemailLabel.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        noVoicemailLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(noVoicemailLabel)

        // Center the label in the view
        NSLayoutConstraint.activate([
            noVoicemailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            noVoicemailLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func greetingButtonTapped() {
        // Placeholder action for the "Greeting" button
        let alert = UIAlertController(title: "Greeting", message: "This is where the Greeting action would be implemented.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
