//
//  Copyright © 2018 Viktor Sokolov. All rights reserved.
//

import UIKit

class Application {
    private let window: UIWindow
    private let networking = Networking()

    private let mainTabBarController: UITabBarController

    init(window: UIWindow) {
        self.window = window
        self.mainTabBarController = UITabBarController()

        let missingHumansViewModel = MissingHumansViewModel(missingHumansRepository: self.networking)
        let missingHumansViewController = MissingHumansViewController(viewModel: missingHumansViewModel)
        self.mainTabBarController.viewControllers = [missingHumansViewController]
        self.window.rootViewController = self.mainTabBarController
    }

    func start() {
        self.window.makeKeyAndVisible()
    }
}
