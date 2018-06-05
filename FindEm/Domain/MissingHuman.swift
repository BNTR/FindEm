//
//  Copyright © 2018 Viktor Sokolov. All rights reserved.
//

import Foundation

struct MissingHuman {
    let name: String
    let missingDate: Date?

    init(name: String, missingDate: Date?) {
        self.name = name
        self.missingDate = missingDate
    }
}
