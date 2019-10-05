import UIKit

class MainTabsViewController: UITabBarController {
    enum Constants {
        static let barTopHeightMargin: CGFloat = 6
        static let tabTextVerticalOffset: CGFloat = -8
        static let tabTextHorizontalOffset: CGFloat = 0
        static let scalableWidthLimit: CGFloat = 414.0
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        var heightMultiplier: CGFloat = 1

        if UIScreen.main.bounds.size.width < Constants.scalableWidthLimit {
            heightMultiplier = UIScreen.main.bounds.size.width / Constants.scalableWidthLimit
        }

        tabBar.frame.size.height += (Constants.barTopHeightMargin * heightMultiplier)
        tabBar.frame.origin.y = view.frame.height - tabBar.frame.size.height

        tabBar.items?.forEach { item in
            item.titlePositionAdjustment = UIOffset(horizontal: Constants.tabTextHorizontalOffset, vertical: Constants.tabTextVerticalOffset)
        }
    }
}

extension UITabBarItem {
    static let first = UITabBarItem(title: L10n.mainFirstTabKey,
                                    image: nil,
                                    selectedImage: nil)
    static let second = UITabBarItem(title: L10n.mainSecondTabKey,
                                     image: nil,
                                     selectedImage: nil)
    static let third = UITabBarItem(title: L10n.mainThirdTabKey,
                                    image: nil,
                                    selectedImage: nil)
}
