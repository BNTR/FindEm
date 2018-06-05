//
//  Copyright © 2018 Viktor Sokolov. All rights reserved.
//

import Foundation
import RxSwift

protocol MissingHumansRepository {
    func allMissingHumans() -> Single<[MissingHuman]>
}
