//
// Popover
// The MIT License (MIT)
//
// Copyright (c) 2022 Jinya (https://github.com/Jinya)

import UIKit

internal final class PopoverDelegation: NSObject, UIPopoverPresentationControllerDelegate {
    static let shared = PopoverDelegation()

    var shouldDismissOnOutsideTap: Bool = true

    // MARK: - UIPopoverPresentationControllerDelegate
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }

    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return shouldDismissOnOutsideTap
    }
}
