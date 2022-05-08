//
// Popover
// The MIT License (MIT)
//
// Copyright (c) 2022 Jinya (https://github.com/Jinya)

import UIKit

extension PopoverPresentable where Self: UIViewController {

    // MARK: - PopoverPresentable Implementations

    public var popoverContentView: UIView {
        return view
    }

    public var popoverContentSize: CGSize {
        return view.systemLayoutSizeFitting(
            UIView.layoutFittingCompressedSize,
            withHorizontalFittingPriority: .defaultHigh,
            verticalFittingPriority: .defaultHigh
        )
    }

    // MARK: - Public Methods

    public func presentAsPopover(from sourceView: UIView,
                                 sourceRect: CGRect? = nil,
                                 shouldDismissOnOutsideTap: Bool = true,
                                 completion: (() -> Void)? = nil) {
        configurePopover(sourceView: sourceView, sourceRect: sourceRect)
        PopoverDelegation.shared.shouldDismissOnOutsideTap = shouldDismissOnOutsideTap
        UIApplication.rootViewController?.present(self, animated: true, completion: completion)
    }

    public func presentAsPopover(from barButtonItem: UIBarButtonItem,
                                 shouldDismissOnOutsideTap: Bool = true,
                                 completion: (() -> Void)? = nil) {
        configurePopover(barButtonItem: barButtonItem)
        PopoverDelegation.shared.shouldDismissOnOutsideTap = shouldDismissOnOutsideTap
        UIApplication.rootViewController?.present(self, animated: true, completion: completion)
    }

    public func dismissPopover(animated: Bool, completion: (() -> Void)? = nil) {
        dismiss(animated: animated, completion: completion)
    }

    // MARK: - Private Methods

    private func configurePopover(sourceView: UIView, sourceRect: CGRect? = nil) {
        configurePopover()
        popoverPresentationController?.sourceView = sourceView
        popoverPresentationController?.sourceRect = sourceRect ?? sourceView.bounds
    }

    private func configurePopover(barButtonItem: UIBarButtonItem) {
        configurePopover()
        popoverPresentationController?.barButtonItem = barButtonItem
    }

    private func configurePopover() {
        prepareForPopover(preferredContentSize: popoverContentSize,
                          arrowDirection: popoverArrowDirection,
                          backgroundColor: popoverBackgroundColor,
                          delegate: PopoverDelegation.shared)
    }
}

extension UIViewController {
    public func presentPopover(_ viewControllerToPresent: UIViewController,
                               from sourceView: UIView,
                               sourceRect: CGRect? = nil,
                               contentSize: CGSize = .zero,
                               backgroundColor: UIColor? = nil,
                               arrowDirection: UIPopoverArrowDirection = .any,
                               shouldDismissOnOutsideTap: Bool = true,
                               completion: (() -> Void)? = nil) {
        PopoverDelegation.shared.shouldDismissOnOutsideTap = shouldDismissOnOutsideTap

        viewControllerToPresent.prepareForPopover(
            preferredContentSize: contentSize,
            arrowDirection: arrowDirection,
            backgroundColor: backgroundColor,
            delegate: PopoverDelegation.shared
        )
        viewControllerToPresent.popoverPresentationController?.permittedArrowDirections = arrowDirection
        viewControllerToPresent.popoverPresentationController?.sourceRect = sourceRect ?? sourceView.bounds

        present(viewControllerToPresent, animated: true, completion: completion)
    }

    public func presentPopover(_ viewControllerToPresent: UIViewController,
                               from barButtonItem: UIBarButtonItem,
                               contentSize: CGSize = .zero,
                               backgroundColor: UIColor? = nil,
                               arrowDirection: UIPopoverArrowDirection = .any,
                               shouldDismissOnOutsideTap: Bool = true,
                               completion: (() -> Void)? = nil) {
        PopoverDelegation.shared.shouldDismissOnOutsideTap = shouldDismissOnOutsideTap

        viewControllerToPresent.prepareForPopover(
            preferredContentSize: contentSize,
            arrowDirection: arrowDirection,
            backgroundColor: backgroundColor,
            delegate: PopoverDelegation.shared
        )
        viewControllerToPresent.popoverPresentationController?.barButtonItem = barButtonItem

        present(viewControllerToPresent, animated: true, completion: completion)
    }
}
