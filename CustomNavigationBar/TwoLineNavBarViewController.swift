//
//  TwoLineNavBarViewController.swift
//  CustomNavigationBar
//
//  Created by Jeongbae Kong on 2020/06/18.
//  Copyright © 2020 Jeongbae Kong. All rights reserved.
//

import UIKit

class TwoLineNavBarViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    initTitleNew()
  }
  
  //Label 필드를 2칸으로 나누기
  private func initTitleNew() {
    let containerView = UIView(frame:CGRect(x: 0, y: 0, width: 200, height: 36))
    
    let topTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 18))
    topTitle.numberOfLines = 1
    topTitle.textAlignment = .center
    topTitle.font = UIFont.systemFont(ofSize: 15)
    topTitle.textColor = UIColor.white
    topTitle.text = "58개 숙소"
    
    let subTitle = UILabel(frame: CGRect(x: 0, y: 18, width: 200, height: 18))
    subTitle.numberOfLines = 1
    subTitle.textAlignment = .center
    subTitle.font = UIFont.systemFont(ofSize: 12)
    subTitle.textColor = UIColor.white
    subTitle.text = "1박(1월 10일 ~ 1월 11일)"
    
    containerView.addSubview(topTitle)
    containerView.addSubview(subTitle)
    
    navigationItem.titleView = containerView
    
    let color = UIColor(red: 0.02, green: 0.22, blue: 0.49, alpha: 1.0)
    navigationController?.navigationBar.barTintColor = color
  }
  
  //TitleView를 2줄로 만들기
  private func initTitle() {
    let nTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
    nTitle.numberOfLines = 2
    nTitle.textAlignment = .center
    nTitle.textColor = UIColor.white
    nTitle.font = UIFont.systemFont(ofSize: 15)
    nTitle.text = "58개 숙소 \n 1박(1월10일 ~ 1월 11일)"
    
    navigationItem.titleView = nTitle
    
    let color = UIColor(red: 0.02, green: 0.22, blue: 0.49, alpha: 1.0)
    navigationController?.navigationBar.barTintColor = color
  }
}
