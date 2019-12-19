//
//  UIViewController+Extensions.swift
//  IFGExtensions
//
//  Created by Emmanuel Merali on 18/12/2019.
//

import UIKit

private func addBlurView(to view: UIView) -> UIVisualEffectView {
    let blurView: UIVisualEffectView = UIVisualEffectView(effect: nil)
    view.addSubview(blurView)
    view.bringSubviewToFront(blurView)
    blurView.translatesAutoresizingMaskIntoConstraints = false
    blurView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    blurView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    blurView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    blurView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    return blurView
}

public extension UIVisualEffectView {
    func fadeIn(_ style:UIBlurEffect.Style = .light, withDuration duration: TimeInterval = 1.0) {
        let animator = UIViewPropertyAnimator(duration: duration, curve: .easeIn) {
            self.effect = UIBlurEffect(style: style)
        }
        animator.startAnimation()
    }

    func fadeOut(withDuration duration: TimeInterval = 1.0) {
        let animator = UIViewPropertyAnimator(duration: duration, curve: .linear) {
            self.effect = nil
        }
        animator.addCompletion { (_) in
            self.removeFromSuperview()
        }
        animator.startAnimation()
    }
}

public extension UIViewController {
    func showAlert(title: String,
                   message: String,
                   buttonTitle: String = "OK",
                   showCancel: Bool = false,
                   actionHandler: ((UIAlertAction) -> Void)? = nil) {
        var blurView: UIVisualEffectView?
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: buttonTitle, style: .default) { (action) in
            blurView?.fadeOut(withDuration: 0.25)
            alertController.dismiss(animated: true, completion: nil)
            actionHandler?(action)
        }
        alertController.addAction(confirmAction)
        if showCancel {
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                blurView?.fadeOut(withDuration: 0.25)
               alertController.dismiss(animated: true, completion: nil)
               actionHandler?(action)
            }
            alertController.addAction(cancelAction)
        }
        DispatchQueue.main.async {
            blurView = addBlurView(to: self.view)
            blurView?.fadeIn(.dark, withDuration: 0.25)
            self.present(alertController, animated: true, completion: nil)
        }
    }

    func showPrompt(title: String,
                    tag: String = "",
                    buttonTitle: String = "OK",
                    showCancel: Bool = false,
                    actionHandler: ((UIAlertAction, String?) -> Void)? = nil) {
        var blurView: UIVisualEffectView?
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: buttonTitle, style: .default) { (action) in
            blurView?.fadeOut(withDuration: 0.25)
            alertController.dismiss(animated: true, completion: nil)
            actionHandler?(action, alertController.textFields?.first?.text)
        }
        alertController.addAction(confirmAction)
        alertController.addTextField { (textField) in
            textField.placeholder = tag
        }
        if showCancel {
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                blurView?.fadeOut(withDuration: 0.25)
                alertController.dismiss(animated: true, completion: nil)
                actionHandler?(action, nil)
            }
            alertController.addAction(cancelAction)
        }
        DispatchQueue.main.async {
            blurView = addBlurView(to: self.view)
            blurView?.fadeIn(.dark, withDuration: 0.25)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
