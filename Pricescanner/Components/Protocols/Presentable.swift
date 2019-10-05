import UIKit

protocol Presentable {
    func present() -> UIViewController
}

protocol TabPresentable: Presentable {
    var presentableTabBarItem: UITabBarItem { get }
}

extension UIViewController: TabPresentable {
    func present() -> UIViewController {
        return self
    }

    var presentableTabBarItem: UITabBarItem {
        return tabBarItem
    }
}
