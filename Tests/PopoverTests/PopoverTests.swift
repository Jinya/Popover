import XCTest

@testable import Popover

class PopoverVC: UIViewController, PopoverPresentable {}

final class PopoverTests: XCTestCase {
    func testPopoverSharedDelegation() {
        // `shouldDismissOnOutsideTap` is true by default.
        XCTAssertEqual(PopoverDelegation.shared.shouldDismissOnOutsideTap, true)

        let sourceView = UIView()
        let barButtonItem = UIBarButtonItem()
        let vc1 = PopoverVC()
        PopoverDelegation.shared.shouldDismissOnOutsideTap = false
        XCTAssertFalse(PopoverDelegation.shared.shouldDismissOnOutsideTap)

        vc1.presentAsPopover(from: sourceView)
        XCTAssertTrue(PopoverDelegation.shared.shouldDismissOnOutsideTap)

        vc1.presentAsPopover(from: barButtonItem, shouldDismissOnOutsideTap: false)
        XCTAssertFalse(PopoverDelegation.shared.shouldDismissOnOutsideTap)

        let fromVC = UIViewController()
        let toVC = UIViewController()

        fromVC.presentPopover(toVC, from: fromVC.view, shouldDismissOnOutsideTap: true)
        XCTAssertTrue(PopoverDelegation.shared.shouldDismissOnOutsideTap)

        let item = UIBarButtonItem()
        fromVC.presentPopover(toVC, from: item, shouldDismissOnOutsideTap: false)
        XCTAssertFalse(PopoverDelegation.shared.shouldDismissOnOutsideTap)
    }
}
