//
//  OngoingMedicationsViewController.swift
//  HMS-Team3-SwiftApp
//
//  Created by Rushil Kothari on 24/04/23.
//

import UIKit

class OngoingMedicationsViewController: UIViewController {
    
//    private let scrollView = UIScrollView()
//
//    private let pageControl: UIPageControl = {
//        let pc = UIPageControl()
//        pc.numberOfPages = 2
//        return pc
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Ongoing Medications Screen")
        view.backgroundColor = .systemBackground
        
//        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
//        view.addSubview(scrollView)
//        view.addSubview(pageControl)
//        scrollView.delegate = self
        // Do any additional setup after loading the view.
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        pageControl.frame = CGRect(x: 0, y: 220, width: 100, height: 25)
//        scrollView.frame = CGRect(x: 50, y: 210, width: 316, height: 168)
//        if scrollView.subviews.count == 2 {
//            configureScrollView()
//        }
//
//    }
    
//    private func configureScrollView(){
//        scrollView.contentSize = CGSize(width: view.frame.width+5, height: scrollView.frame.size.height)
//        scrollView.isPagingEnabled = true
//        for x in 0..<2 {
//            let page = UIView(frame: CGRect(x: CGFloat(x) * view.frame.size.width, y: 0, width: view.frame.size.width, height: scrollView.frame.size.height))
//            scrollView.addSubview(page)
//        }
//    }

//    @objc private func pageControlDidChange(_ sender: UIPageControl){
//        let current = sender.currentPage
//        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
//    }

}

//extension OngoingMedicationsViewController: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x) / Float( scrollView.frame.size.width)))
//    }
//}
