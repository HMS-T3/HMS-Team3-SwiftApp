//
//
//  Created by Niya Shameer on 25/04/23.
//

import Foundation
import HealthKit

func getSampleType(for identifier: String) -> HKSampleType? {
    if let quantityType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier(rawValue: identifier)) {
        return quantityType
    }
    return nil
}
