//
// Popover
// The MIT License (MIT)
//
// Copyright (c) 2022 Jinya (https://github.com/Jinya)

import UIKit

// MARK: - PopoverPresentable

public protocol PopoverPresentable {
    var popoverContentView: UIView { get }

    var popoverContentSize: CGSize { get }

    var popoverArrowDirection: UIPopoverArrowDirection { get }

    var popoverBackgroundColor: UIColor? { get }
}

// MARK: - PopoverPresentable Default Implementations

public extension PopoverPresentable {
    var popoverArrowDirection: UIPopoverArrowDirection {
        return .any
    }

    var popoverBackgroundColor: UIColor? {
        return nil
    }
}
