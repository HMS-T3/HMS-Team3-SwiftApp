//
//  AppleHealthViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 20/04/23.
//

import UIKit
import HealthKit

class AppleHealthViewController: UIViewController {

    let healthStore : HKHealthStore = HKHealthStore()
//    let quantityType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier(rawValue: "$0"))

    static var readDataTypes: [HKSampleType] {
        return allHealthDataTypes
    }
    
    static var shareDataTypes: [HKSampleType] {
        return allHealthDataTypes
    }
    private static var allHealthDataTypes: [HKSampleType] {
            let typeIdentifiers: [String] = [
                HKQuantityTypeIdentifier.stepCount.rawValue,
//                HKQuantityTypeIdentifier.distanceWalkingRunning.rawValue,
//                HKQuantityTypeIdentifier.bloodPressureSystolic.rawValue,
//                HKQuantityTypeIdentifier.bloodPressureDiastolic.rawValue,
                HKQuantityTypeIdentifier.heartRate.rawValue,
                HKQuantityTypeIdentifier.appleSleepingWristTemperature.rawValue
            ]
            
        return typeIdentifiers.compactMap { getSampleType(for: $0) }
        }
    let readTypes = Set(readDataTypes)
    /// The HealthKit data types we will request to share and have write access.
    let shareTypes = Set(shareDataTypes)
    
    var hasRequestedHealthData: Bool = false
    
    
    @IBAction func viewTapped(_ sender: Any) {
        requestHealthAuthorization()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func requestHealthAuthorization() {
        print("Requesting HealthKit authorization...")
        
        if !HKHealthStore.isHealthDataAvailable() {
            print("not available")
            
            return
        }
        
        healthStore.requestAuthorization(toShare: nil, read: readTypes) { (success, error) in
            var status: String = ""
            
            if let error = error {
                status = "HealthKit Authorization Error: \(error.localizedDescription)"
            } else {
                if success {
                    if self.hasRequestedHealthData {
                        status = "You've already requested access to health data. "
                    } else {
                        status = "HealthKit authorization request was successful! "
                    }
                    
//                    status += self.createAuthorizationStatusDescription(for: self.shareTypes)
                    
                    self.hasRequestedHealthData = true
                } else {
                    status = "HealthKit authorization did not complete successfully."
                }
            }
            
            print(status)
            
            // Results come back on a background thread. Dispatch UI updates to the main thread.
            DispatchQueue.main.async {
//                self.descriptionLabel.text = status
            }
        }
    }

}
