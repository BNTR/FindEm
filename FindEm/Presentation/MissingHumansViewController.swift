//
//  Copyright © 2018 Viktor Sokolov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

struct SectionOfMissingHumans {
    var items: [MissingHumanViewModel]
}

extension SectionOfMissingHumans: SectionModelType {
    typealias Item = MissingHumanViewModel

    init(original: SectionOfMissingHumans, items: [Item]) {
        self = original
        self.items = items
    }
}

class MissingHumansViewController: UIViewController {
    @IBOutlet private var missingHumansTableView: UITableView!

    private let disposeBag = DisposeBag()
    private let viewModel: MissingHumansViewModel
    private let dataSource: RxTableViewSectionedReloadDataSource<SectionOfMissingHumans>

    init(viewModel: MissingHumansViewModel) {
        self.viewModel = viewModel
        self.dataSource = RxTableViewSectionedReloadDataSource<SectionOfMissingHumans>(
            configureCell: { ds, сv, ip, item in
                let cell = сv.dequeueReusableCell(
                    withIdentifier: String(describing: MissingHumanCell.self),
                    for: ip
                    ) as! MissingHumanCell
                cell.missingHumanViewModel = item
                return cell
            }
        )
        super.init(
            nibName: String(describing: MissingHumansViewController.self),
            bundle: Bundle(for: MissingHumansViewController.self)
        )
        self.title = "Missing"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
        self.bindView()
    }

    private func setupView() {
        let nib = UINib(nibName: String(describing: MissingHumanCell.self), bundle: nil)
        self.missingHumansTableView.register(nib, forCellReuseIdentifier: String(describing: MissingHumanCell.self))

        self.viewModel.missingHumansViewModels
            .map { [SectionOfMissingHumans(items: $0)] }
            .bind(to: self.missingHumansTableView.rx.items(dataSource: self.dataSource))
            .disposed(by: self.disposeBag)
    }

    private func bindView() {

    }
}
