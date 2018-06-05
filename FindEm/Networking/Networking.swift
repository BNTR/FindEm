//
//  Copyright © 2018 Viktor Sokolov. All rights reserved.
//

import Foundation
import RxSwift

class Networking {
    init() {

    }
}

extension Networking: MissingHumansRepository {
    func allMissingHumans() -> Single<[MissingHuman]> {
        return .just([MissingHuman(name: "Viktor", missingDate: Date())])
    }
}
