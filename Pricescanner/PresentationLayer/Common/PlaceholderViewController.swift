import UIKit

final class PlaceholderViewController: UIViewController {
    convenience init(title: String) {
        self.init()
        self.title = title
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray
        let label = UILabel(frame: view.bounds)
        label.text = "Nothing to see here"
        label.textColor = .white
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        label.textAlignment = .center
        view.addSubview(label)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
