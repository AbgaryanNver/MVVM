import UIKit

class AppCoordinator: TabsCoordinator {
    let window: UIWindow?
    private let tabBarController = MainTabsViewController()

    init(context: CoordinatorContext, window: UIWindow?) {
        self.window = window
        super.init(context: context, root: tabBarController)
    }

    override func start(animated _: Bool) {
        guard let window = window else {
            return
        }

        let second = PlaceholderViewController(title: "second")
        second.tabBarItem = UITabBarItem.second

        let third = PlaceholderViewController(title: "third")
        third.tabBarItem = UITabBarItem.third
        setTabs([HomeCoordinator(context: context), second, third], animated: false)
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
}
