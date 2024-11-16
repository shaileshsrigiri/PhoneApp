import UIKit

class KeypadViewController: UIViewController {
    // Array to keep track of the input numbers
    var inputNumbers: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupKeypadUI()
    }

    // Function to set up the keypad UI
    private func setupKeypadUI() {
        let buttonTitles = [
            ["1", "2", "3"],
            ["4", "5", "6"],
            ["7", "8", "9"],
            ["*", "0", "#"]
        ]

        let buttonStackView = UIStackView()
        buttonStackView.axis = .vertical
        buttonStackView.distribution = .equalCentering
        buttonStackView.spacing = 20
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonStackView)

        // Create rows of buttons
        for row in buttonTitles {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.distribution = .equalCentering
            rowStackView.spacing = 20

            for title in row {
                let button = createButton(withTitle: title)
                rowStackView.addArrangedSubview(button)
            }

            buttonStackView.addArrangedSubview(rowStackView)
        }

        // Add the call button
        let callButton = UIButton(type: .system)
        let callImage = UIImage(systemName: "phone.fill")
        callButton.setImage(callImage, for: .normal)
        callButton.tintColor = .white
        callButton.backgroundColor = .systemGreen
        callButton.layer.cornerRadius = 40
        callButton.addTarget(self, action: #selector(callButtonTapped), for: .touchUpInside)
        callButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(callButton)

        // Layout constraints
        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),

            callButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            callButton.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 20),
            callButton.widthAnchor.constraint(equalToConstant: 80),
            callButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }

    // Function to create individual buttons
    private func createButton(withTitle title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 40 // Make the button fully round
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        button.addTarget(self, action: #selector(keypadButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return button
    }

    // Action for keypad buttons
    @objc private func keypadButtonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        inputNumbers.append(title)
        print("Current input: \(inputNumbers)")
    }

    // Action for call button
    @objc private func callButtonTapped() {
        print("Calling number: \(inputNumbers)")
        // Here you could add logic to initiate a call or show an alert
    }
}
