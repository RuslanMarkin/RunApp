//
//  ViewModel.swift
//  RunApp
//
//  Created by Ruslan on 09.02.23.
//

import UIKit
import HealthKit

//class RunViewModel {
//
//    typealias AppHealthKitValueCompletion = ((Double?, Error?)->Void)
//
//        func loadCalory(since start: Date = Date().startOfDay, to end: Date = Date(), completion: @escaping AppHealthKitValueCompletion) {
//            guard let type = HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned) else {
//                return
//            }
//
//            let predicate = HKQuery.predicateForSamples(withStart: start, end: end, options: .strictStartDate)
//            let query = HKStatisticsQuery(quantityType: type, quantitySamplePredicate: predicate, options: .cumulativeSum) { (_, result, error) in
//                var resultCount = 0.0
//                guard let result = result else {
//                    completion(nil, error)
//                    return
//                }
//
//                if let quantity = result.sumQuantity() {
//                    resultCount = quantity.doubleValue(for: HKUnit.kilocalorie())
//                }
//                DispatchQueue.main.async {
//                    completion(resultCount, nil)
//                }
//            }
//            healthStore.execute(query)
//        }
//}
