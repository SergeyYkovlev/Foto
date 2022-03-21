//
//  FotoViewController.swift
//  Foto
//
//  Created by Сергей Яковлев on 21.03.2022.
//

import Foundation
import UIKit

protocol PhotoViewInput: AnyObject {
    func update(with viewModel: PhotoViewModel, force: Bool, animated: Bool)
}

protocol PhotoViewOutput: AnyObject {

}
class PhotoViewController: UIViewController {

    private let output: PhotoViewOutput
    private var viewModel: PhotoViewModel

    init(viewModel: PhotoViewModel, output: PhotoViewOutput) {
        self.viewModel = viewModel
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
}

extension PhotoViewController: PhotoViewInput, ViewUpdate {
    func update(with viewModel: PhotoViewModel, force: Bool, animated: Bool) {
        let oldViewModel = self.viewModel
        self.viewModel = viewModel
        //        collectionViewManager.update(with: viewModel.listSectionItems, animated: animated)
        view.setNeedsLayout()
        view.layoutIfNeeded()
        func updateViewModel<Value: Equatable>(_ keyPath: KeyPath<PhotoViewModel, Value>, configurationBlock: (Value) -> Void) {
            update(new: viewModel, old: oldViewModel, keyPath: keyPath, force: force, configurationBlock: configurationBlock)
        }
    }
}
