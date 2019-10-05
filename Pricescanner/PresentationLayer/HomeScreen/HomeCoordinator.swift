import UIKit

class HomeCoordinator: NavigationCoordinator, TabPresentable {
    let navigationController = UINavigationController()
    var presentableTabBarItem: UITabBarItem {
        return .first
    }

    func present() -> UIViewController {
        return navigationController
    }

    init(context: CoordinatorContext) {
        super.init(context: context, root: navigationController)
        let viewModel = HomeViewModel(title: presentableTabBarItem.title ?? "")
        let homeVC = HomeViewController(with: viewModel)
        push(homeVC, animated: false)
    }
}
