//
//  SettingsView.swift
//  youtube
//
//  Created by Waldron, Dustin on 10/4/20.
//

import UIKit

class SettingsView: UIViewController {
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var termsView: UIView!
    @IBOutlet weak var feedbackView: UIView!
    @IBOutlet weak var helpView: UIView!
    @IBOutlet weak var accountView: UIView!
    @IBOutlet weak var cancelView: UIView!
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.stackView.isHidden = true
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        setupStackView()
        fadeBackground()
    }
    
    @objc func handleTap(_ sender: SettingsItemGesture) {
        presentAlert(screenName: sender.screenName)
    }
    
    @objc func handleCancel(_ sender: SettingsItemGesture) {
        DispatchQueue.main.async {
            self.view.backgroundColor = UIColor.clear
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.stackView.alpha = 0
                self.view.alpha = 0
                self.dismiss(animated: true)
            })
        }
    }
    
    func setupSettingsItems(_ view: UIView, _ screenName: String) {
        if screenName == "Cancel" {
            let tap = SettingsItemGesture(target: self, action: #selector(self.handleCancel(_:)))
            tap.screenName = "Cancel"
            cancelView.addGestureRecognizer(tap)
            backgroundView.addGestureRecognizer(tap)
        } else {
            let tap = SettingsItemGesture(target: self, action: #selector(self.handleTap(_:)))
            tap.screenName = screenName
            view.addGestureRecognizer(tap)
        }
    }
    
    func presentAlert(screenName: String) {
        let alertController = UIAlertController(title: "Setting Tapped!", message: "Will navigate to \(screenName)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))

        self.present(alertController, animated: true, completion: nil)
    }
    
    private func setupStackView() {
        setupSettingsItems(settingsView, "Settings")
        setupSettingsItems(termsView, "Terms & Conditions")
        setupSettingsItems(feedbackView, "Send Feedback")
        setupSettingsItems(helpView, "Help")
        setupSettingsItems(accountView, "Switch Account")
        setupSettingsItems(cancelView, "Cancel")
    }
    
    private func fadeBackground() {
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        self.view.alpha = 0
        self.stackView.isHidden = false
        self.stackView.alpha = 0
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.stackView.alpha = 1
            self.view.alpha = 1
        })
    }
}

public class SettingsItemGesture: UITapGestureRecognizer {
    public var screenName: String = ""
}
