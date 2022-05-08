//
// Popover
// The MIT License (MIT)
//
// Copyright (c) 2022 Jinya (https://github.com/Jinya)

import UIKit

@available(iOS 9.0, *)
extension UIPopoverArrowDirection {
    /// Specifying not to show the popover arrow.
    public static var none: UIPopoverArrowDirection {
        return .init(rawValue: 0)
    }
}

@available(iOS 9.0, *)
extension UIViewController {
    internal var topPresentedViewController: UIViewController? {
        return presentedViewController?.topPresentedViewController ?? self
    }

    internal func prepareForPopover(
        preferredContentSize: CGSize,
        arrowDirection: UIPopoverArrowDirection,
        backgroundColor: UIColor?,
        delegate: UIPopoverPresentationControllerDelegate?
    ) {
        modalPresentationStyle = .popover
        self.preferredContentSize = preferredContentSize
        popoverPresentationController?.permittedArrowDirections = arrowDirection
        popoverPresentationController?.backgroundColor = backgroundColor
        popoverPresentationController?.delegate = delegate
    }
}

@available(iOS 9.0, *)
extension UIApplication {
    internal static var rootViewController: UIViewController? {
        if #available(iOS 15.0, *) {
            return UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .filter { $0.activationState == .foregroundActive }
                .first?.keyWindow?.rootViewController?.topPresentedViewController
        } else if #available(iOS 13.0, *) {
            return UIApplication.shared.windows.filter { $0.isKeyWindow }
                .first?.rootViewController?.topPresentedViewController
        } else {
            return UIApplication.shared.keyWindow?.rootViewController?.topPresentedViewController
        }
    }
}
