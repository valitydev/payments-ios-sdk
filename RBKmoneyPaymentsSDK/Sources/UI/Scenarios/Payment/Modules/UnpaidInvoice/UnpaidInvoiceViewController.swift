// Copyright 2019 RBKmoney
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import RxCocoa
import RxSwift
import UIKit

final class UnpaidInvoiceViewController: UIViewController, ModuleView {

    // MARK: - Dependencies
    lazy var priceFormatter: UnpaidInvoicePriceFormatter = deferred()
    lazy var invoiceDetailsFormatter: UnpaidInvoiceInvoiceDetailsFormatter = deferred()

    // MARK: - Outlets
    @IBOutlet private var cancelBarButtonItem: UIBarButtonItem!

    // MARK: - ModuleView
    var output: UnpaidInvoiceViewModel.Input {
        return UnpaidInvoiceViewModel.Input(
            didTapCancel: cancelBarButtonItem.rx.tap.asSignal()
        )
    }

    func setupBindings(to viewModel: UnpaidInvoiceViewModel) -> Disposable {
        return viewModel.shopName.drive(navigationItem.rx.title)
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private
    private func setupUI() {
        navigationItem.hidesBackButton = true
    }
}
