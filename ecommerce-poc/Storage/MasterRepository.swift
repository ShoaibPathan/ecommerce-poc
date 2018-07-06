//
//  MasterRepository.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 06/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import Foundation
import RxSwift

protocol CachedRepository {
  func getProducts() -> Observable<FetchEvent<[RemoteCategory]>>
}
