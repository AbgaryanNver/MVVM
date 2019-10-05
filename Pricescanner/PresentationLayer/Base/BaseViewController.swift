import ReactiveCocoa
import ReactiveSwift
import UIKit

/**
 Describing base View logic for MVVM implementation

 *Confirmed only by BaseViewController!!! (like NSObjectProtocol)*
 */
protocol BaseViewControllerProtocol {
    /// Concrete ViewModel type
    associatedtype ViewModelType

    /// Reference to ViewModel in current flow
    var viewModel: ViewModelType { get set }

    /// A signal that sends a value event when vieDidLoad, setupUI and bind jobs were done
    ///
    /// - note: You can use `isLoaded` in general to notify viewModel to perform some actions or requests like signIn
    var isLoaded: Signal<Void, Never> { get }

    /// View constructor
    ///
    /// - Parameters:
    /// - viewModel: ViewModel for View initialization
    init(with viewModel: ViewModelType)

    /// Implementation of all interface setup logic (subviews, constraints etc)
    func setupUI()

    /// Setup bindings beetwen View and ViewModel
    ///
    /// - Parameter viewModel: ViewModel for bind
    func bind(viewModel: ViewModelType)
}

/**
 Base logic for all ViewController's in application

 **Don't put flow depended logic here!!!**
 */
class BaseViewController<ViewModelType: BaseViewModelProtocol>: UIViewController, BaseViewControllerProtocol {
    var viewModel: ViewModelType

    private(set) var isLoaded: Signal<Void, Never>
    private let isLoadedIO: (output: Signal<Void, Never>, input: Signal<Void, Never>.Observer)

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    required init(with viewModel: ViewModelType) {
        self.viewModel = viewModel

        isLoadedIO = Signal<Void, Never>.pipe()
        isLoaded = isLoadedIO.output

        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        bind(viewModel: viewModel)

        isLoadedIO.input.send(value: ())
    }

    func setupUI() {}

    func bind(viewModel: ViewModelType) {
        reactive.title <~ viewModel.screenTitle
    }
}
