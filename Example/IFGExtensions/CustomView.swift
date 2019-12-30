//
//  CustomView.swift
//  ARFocusSquare
//
//  Created by Emmanuel Merali on 22/12/2019.
//

import UIKit
import IFGExtensions

extension CustomView {
    func showFunctionIndicator() {
#if TARGET_INTERFACE_BUILDER
        useFunctionIndicator.backgroundColor = useFunction ? UIColor.green : UIColor.red
#endif
    }
}


@IBDesignable
class CustomView: UIView, LoadableFromNib {

    @IBOutlet weak var contentView: UIView!

    @IBOutlet weak var squareView: UIView!

    @IBOutlet weak var button: UIButton!

    @IBInspectable
    var squareIsHidden: Bool {
        get { return squareView.isHidden }
        set { squareView.isHidden = newValue; self.setNeedsDisplay() }
    }

    @IBInspectable var cornerRadius: CGFloat = 2.0 {
        didSet {
            contentView.layer.cornerRadius = cornerRadius
            contentView.layer.masksToBounds = cornerRadius > 0
        }
    }

    @IBInspectable
    open var useFunction: Bool = true {
        didSet {
            showFunctionIndicator()
        }
    }

#if TARGET_INTERFACE_BUILDER
    var useFunctionIndicator: UIView = UIView(frame: CGRect(x: 2, y: 5, width: 20, height: 20))
#endif

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
#if TARGET_INTERFACE_BUILDER
        self.addSubview(useFunctionIndicator)
        self.showFunctionIndicator()
#endif
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib()
#if TARGET_INTERFACE_BUILDER
        self.addSubview(useFunctionIndicator)
        self.showFunctionIndicator()
#endif
    }
}
