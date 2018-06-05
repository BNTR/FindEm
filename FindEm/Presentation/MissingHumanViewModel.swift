//
//  Copyright © 2018 Viktor Sokolov. All rights reserved.
//

import Foundation
import RxSwift

class MissingHumanViewModel {
    let name: Observable<String>
    let missingDate: Observable<Date?>

    init(missingHuman: MissingHuman) {
        self.name = Observable.just(missingHuman.name)
        self.missingDate = Observable.just(missingHuman.missingDate)
    }
}
