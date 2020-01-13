//
//  UIView+LoadFromNib.swift
//  IFGExtensions
//
//  Created by Emmanuel Merali on 22/12/2019.
//

import UIKit

public protocol LoadableFromNib: class {
    static var nibName: String { get }
    func appropriateConstraints(from view: UIView) -> [NSLayoutConstraint]
    func loadFromNib()
}

public extension LoadableFromNib where Self: UIView {
    static var nibName: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
    
    func appropriateConstraints(from view: UIView) -> [NSLayoutConstraint] {
        return view.constraints.map {
            let firstItem = ($0.firstItem === view ? self : $0.firstItem)
            let firstAttribute = $0.firstAttribute
            let relation = $0.relation
            let toItem = ($0.secondItem === view ? self : $0.secondItem)
            let secondAttribute = $0.secondAttribute
            let multiplier = $0.multiplier
            let constant = $0.constant
            let priority = $0.priority
            let constraint = NSLayoutConstraint(
                item: firstItem as Any,
                attribute: firstAttribute,
                relatedBy: relation,
                toItem: toItem,
                attribute: secondAttribute,
                multiplier: multiplier,
                constant: constant)
            constraint.priority = priority
            return constraint
        }
    }
    
    func loadFromNib() {
        let bundle = Bundle.init(for: type(of: self))
        let nibName = type(of: self).nibName
        if let objects = bundle.loadNibNamed(nibName, owner: self, options: nil),
            let containerView = objects.first as? UIView {
            let constraints = self.appropriateConstraints(from: containerView)
            containerView.removeConstraints(containerView.constraints)
            for view in containerView.subviews {
                self.addSubview(view)
            }
            NSLayoutConstraint.activate(constraints)
        }
    }
}
