//
//  Copyright © 2018 Viktor Sokolov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxSwiftExt

class MissingHumanCell: UITableViewCell {
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var missedDateLabel: UILabel!

    var disposeBag = DisposeBag()
    var missingHumanViewModel: MissingHumanViewModel? {
        didSet {
            self.disposeBag = DisposeBag()
            self.bindView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.disposeBag = DisposeBag()
        self.missingHumanViewModel = nil
    }

    private func bindView() {
        guard let missingHumanViewModel = missingHumanViewModel else { return }
        self.disposeBag.insert(CompositeDisposable(
            missingHumanViewModel.name
                .observeOn(MainScheduler.instance)
                .bind(to: self.nameLabel.rx.text),
            missingHumanViewModel.missingDate.unwrap()
                .map { String($0.timeIntervalSince1970) }
                .observeOn(MainScheduler.instance)
                .bind(to: self.missedDateLabel.rx.text)
        ))
    }
}
