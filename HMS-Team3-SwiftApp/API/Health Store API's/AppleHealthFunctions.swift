//
//  DailySteps.swift
//  HMS-Team3-SwiftApp
//
//  Created by Shivacharan Reddy on 29/04/23.
//

import Foundation
import HealthKit

enum AppleHealthError: String, Error {
	case UnableToReadData
	case NoDataAvailabe = "No Data"
}

class AppleHealthFunctions {
	
	static let shared = AppleHealthFunctions()
	
	let healthStore = HKHealthStore()
	
	let dataTypes = Set([
		HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!,
		HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!,
		HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.height)!,
		HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass)!,
		HKObjectType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.bloodType)!
	])
	
	func askForHealthKitPermission() {
		
		healthStore.requestAuthorization(toShare: nil, read: dataTypes) { sucessBool, error in
			guard error == nil else {
				print(error)
				return
			}
		}
	}
	
	func getDailyStepsFromApple(completion: @escaping(Result<Double, Error>) -> Void) {
		
		guard let stepCountType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount) else {
			completion(.failure(AppleHealthError.UnableToReadData))
			return
		}
		
		let startOfDay = Calendar.current.startOfDay(for: Date())
		let endOfDay = Calendar.current.date(byAdding: .day, value: 1, to: startOfDay)
		
		let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: endOfDay, options: .strictEndDate)
		
		let queryDay = HKStatisticsQuery.init(quantityType: stepCountType, quantitySamplePredicate: predicate, options: .cumulativeSum) { query, result, error in
			
			guard let result = result else {
				completion(.failure(AppleHealthError.NoDataAvailabe))
				return
			}
			
			let count = result.sumQuantity()?.doubleValue(for: HKUnit.count()) ?? 0
			completion(.success(count))
		}
		
		healthStore.execute(queryDay)
	}
	
	func getWeeklyStepsFromApple(completion: @escaping(Result<Double, Error>) -> Void) {
				
		guard let stepCountType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount) else {
			completion(.failure(AppleHealthError.UnableToReadData))
			return
		}
		
		let startOfWeek = Calendar.current.date(from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date()))!
		let endOfWeek = Calendar.current.date(byAdding: .day, value: 7, to: startOfWeek)
		
		let predicate = HKQuery.predicateForSamples(withStart: startOfWeek, end: endOfWeek, options: .strictEndDate)
		
		let query = HKStatisticsQuery.init(quantityType: stepCountType, quantitySamplePredicate: predicate) { query, result, error in
			
			guard let result = result else {
				completion(.failure(AppleHealthError.NoDataAvailabe))
				return
			}
			
			let count = result.sumQuantity()?.doubleValue(for: HKUnit.count()) ?? 0
			completion(.success(count))
		}
		
		healthStore.execute(query)
	}
	
	func getMonthlyStepsFromApple(completion: @escaping(Result<Double, Error>) -> Void) {
		
		guard let stepCountType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount) else {
			completion(.failure(AppleHealthError.UnableToReadData))
			return
		}
		
		let startOfMonth = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Date()))!
		let endOfMonth = Calendar.current.date(byAdding: .month, value: 1, to: startOfMonth)
		
		let predicate = HKQuery.predicateForSamples(withStart: startOfMonth, end: endOfMonth, options: .strictEndDate)
		
		let query = HKStatisticsQuery.init(quantityType: stepCountType, quantitySamplePredicate: predicate) { query, result, error in
			
			guard let result = result else {
				completion(.failure(AppleHealthError.NoDataAvailabe))
				return
			}
			
			let count = result.sumQuantity()?.doubleValue(for: HKUnit.count()) ?? 0
			completion(.success(count))
		}
		
		healthStore.execute(query)
	}
	
	func getYearlyStepsFromApple(completion: @escaping(Result<Double, Error>) -> Void) {
		
		guard let stepsDataType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount) else {
			completion(.failure(AppleHealthError.UnableToReadData))
			return
		}
		
		let startOfYear = Calendar.current.date(from: Calendar.current.dateComponents([.year], from: Date()))!
		let endOfYear = Calendar.current.date(byAdding: .year, value: 1, to: startOfYear)
		
		let predicate = HKQuery.predicateForSamples(withStart: startOfYear, end: endOfYear, options: .strictEndDate)
		
		let query = HKStatisticsQuery.init(quantityType: stepsDataType, quantitySamplePredicate: predicate) { query, results, error in
			
			guard let results = results else {
				completion(.failure(AppleHealthError.NoDataAvailabe))
				return
			}
			
			let count = results.sumQuantity()?.doubleValue(for: HKUnit.count()) ?? 0
			completion(.success(count))
		}
		
		healthStore.execute(query)
	}
	
	func getHeightFromAppleHealth(completion: @escaping(Result<Double, Error>) -> Void) {
		
		guard let heightDataType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.height) else {
			completion(.failure(AppleHealthError.UnableToReadData))
			return
		}
		
		let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
		
		let query = HKSampleQuery.init(sampleType: heightDataType, predicate: nil, limit: HKObjectQueryNoLimit, sortDescriptors: [sortDescriptor]) { query, result, error in
			
			guard let height = result?.first as? HKQuantitySample else {
				completion(.failure(AppleHealthError.NoDataAvailabe))
				return
			}
			
			let heightValue = height.quantity.doubleValue(for: HKUnit.meterUnit(with: HKMetricPrefix.centi))
			completion(.success(heightValue))
		}
		
		healthStore.execute(query)
	}
	
	func getBodyMassFromAppleHealth(completion: @escaping(Result<Double, Error>) -> Void) {
		
		guard let weightDataType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass) else {
			completion(.failure(AppleHealthError.UnableToReadData))
			return
		}
		
		let sortDescriptors = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
		
		let query = HKSampleQuery.init(sampleType: weightDataType, predicate: nil, limit: HKObjectQueryNoLimit, sortDescriptors: [sortDescriptors]) { query, result, error in
			
			guard let weight = result?.first as? HKQuantitySample else {
				completion(.failure(AppleHealthError.NoDataAvailabe))
				return
			}
			
			let bodyMass = weight.quantity.doubleValue(for: HKUnit.gramUnit(with: HKMetricPrefix.kilo))
			completion(.success(bodyMass))
		}
		
		healthStore.execute(query)
	}
	
	func getBloodTypeFrommAppleHealth(completion: @escaping(Result<String, Error>) -> Void) {
		
		do {
			
			let bloodObject = try healthStore.bloodType()
			
			let bloodType: String
			
			switch bloodObject.bloodType {
			case .aNegative:
				bloodType = "A-ve"
			case .aPositive:
				bloodType = "A+ve"
			case .abNegative:
				bloodType = "AB-ve"
			case .abPositive:
				bloodType = "AB+ve"
			case .bNegative:
				bloodType = "B-ve"
			case .bPositive:
				bloodType = "B+ve"
			case .oNegative:
				bloodType = "O-ve"
			case .oPositive:
				bloodType = "O+ve"
			case .notSet:
				bloodType = "Not Set"
			default:
				bloodType = "Unknown"
			}
			
			completion(.success(bloodType))
		} catch {
			completion(.failure(error))
		}
	}
}
