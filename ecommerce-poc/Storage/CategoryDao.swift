//
//  CategoryDao.swift
//  ecommerce-poc
//
//  Created by Rugmangathan on 06/07/18.
//  Copyright © 2018 Rugmangathan. All rights reserved.
//

import RxSwift
import RxGRDB
import GRDB

class CategoryDao {
  private let dbQueue: DatabaseQueue

  init(_ dbQueue: DatabaseQueue) {
    self.dbQueue = dbQueue
  }

  func insert(_ category: LocalCategory) {
    do {
      try dbQueue.inDatabase { db in
        try category.insert(db)
      }
    } catch let error {
      fatalError("Couldn't save the category: \(error)")
    }
  }

  func insertAll(_ categories: [LocalCategory]) {
    do {
      try dbQueue
        .inDatabase { db in
          for category in categories {
            _ = try category.insert(db)
          }
      }
    } catch let error {
      fatalError("Couldn't save the categories: \(error)")
    }
  }

  func getAll() -> Observable<[LocalCategory]> {
    let request = LocalCategory.all()
    return request
      .rx
      .fetchAll(in: dbQueue)
      .asObservable()
  }
}
