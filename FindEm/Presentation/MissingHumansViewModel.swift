//
//  Copyright © 2018 Viktor Sokolov. All rights reserved.
//

import Foundation
import RxSwift

class MissingHumansViewModel {
    let missingHumansViewModels: Observable<[MissingHumanViewModel]>

    init(missingHumansRepository: MissingHumansRepository) {
        self.missingHumansViewModels = missingHumansRepository.allMissingHumans().asObservable()
            .map { $0.map { MissingHumanViewModel(missingHuman: $0) } }
    }
}
