//
//  FotoPresenter.swift
//  Foto
//
//  Created by Сергей Яковлев on 21.03.2022.
//

import Foundation
import UIKit
import CoreLocation

final class PhotoPresenter {

//    let searchService: SearchServiceImpl = .init()

     var view: PhotoViewInput?
    weak var output: PhotoModuleOutput?

    var state: PhotoState
//    private let listItemsFactory: SearchListItemsFactory

    init(state: PhotoState) {
        self.state = state
//        self.listItemsFactory = listItemsFactory
    }

}

extension PhotoPresenter: PhotoViewOutput {

}

extension PhotoPresenter: PhotoModuleInput {
    func update(force: Bool, animated: Bool) {
        let viewModel = PhotoViewModel()
        view?.update(with: viewModel, force: force, animated: animated)
    }
}
