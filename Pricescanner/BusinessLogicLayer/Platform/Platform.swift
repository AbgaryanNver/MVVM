import UIKit

class Platform: NSObject {
    let environment: AppEnvironment

    init(environment: AppEnvironment) {
        self.environment = environment
    }
}
