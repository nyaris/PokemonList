//
//  CacheRepository.swift
//  ExempleProjRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 12/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol CacheRepository {
   func retrieve<T>(fromKey key: String) -> T? where T : Codable
  
}
