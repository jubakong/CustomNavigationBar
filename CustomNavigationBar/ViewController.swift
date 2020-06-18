//
//  ViewController.swift
//  CustomNavigationBar
//
//  Created by Jeongbae Kong on 2020/06/08.
//  Copyright © 2020 Jeongbae Kong. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
  
  
  private var url: String?
  @IBOutlet weak var webView: WKWebView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    initTitleInput()
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
  
  //타이틀 뷰에 이미지 넣기 샘플
  private func initTitleImage() {
    let image = UIImage(named: "swift_logo")
    let imageV = UIImageView(image: image)
    navigationItem.titleView = imageV
  }
  
  private func initTitleInput() {
    
    //네비게이션 바에 색 추가
    navigationController?.navigationBar.barTintColor = UIColor.white
    
    //타이틀에 텍스트 필드 사용하기 ( Ex.,브라우저)
    let tf = UITextField()
    tf.frame = CGRect(x: 0, y: 0, width: 300, height: 35)
    tf.backgroundColor = UIColor.white
    tf.font = UIFont.systemFont(ofSize: 13)
    tf.autocapitalizationType = .none
    tf.autocorrectionType = .no
    tf.keyboardType = .URL
    tf.keyboardAppearance = .dark
    tf.layer.borderWidth = 0.3
    tf.returnKeyType = UIReturnKeyType.done
    tf.delegate = self
    tf.layer.borderColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0).cgColor
    
    self.navigationItem.titleView = tf
    
    
    //LeftBarButton 추가
    let back = UIImage(named: "arrow-back")
    let leftItem = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(tapped))
    navigationItem.leftBarButtonItem = leftItem
    
    let rv = UIView()
    rv.frame = CGRect(x: 0, y: 0, width: 70, height: 37)
    let rItem = UIBarButtonItem(customView: rv)
    
    navigationItem.rightBarButtonItem = rItem
    
    //RightBarButton에 Label추가
    let cnt = UILabel()
    cnt.frame = CGRect(x: 10, y: 8, width: 20, height: 20)
    cnt.font = UIFont.systemFont(ofSize: 10)
    cnt.textColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0)
    cnt.text = "12"
    cnt.textAlignment = .center
    cnt.layer.cornerRadius = 5
    cnt.layer.borderWidth = 3
    cnt.layer.borderColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0).cgColor
    
    rv.addSubview(cnt)
    
    //RightBarButton에 Button추가
    let more = UIButton(type: .system)
    more.frame = CGRect(x: 50, y: 10, width: 16, height: 16)
    more.setImage(UIImage(named: "more"), for: .normal)
    
    rv.addSubview(more)
    
  }
  
  @objc func tapped() {
    navigationController?.popViewController(animated: true)
  }
  
  func loadUrl() {
    guard let urlInput = url else { return }
    
    if urlInput.contains("https://") {
      guard let URL = URL(string: urlInput) else { return }
      let request = URLRequest(url: URL)
      webView.load(request)
    } else {
      guard let URL = URL(string: "https://\(urlInput)") else { return }
      let request = URLRequest(url: URL)
      webView.load(request)
    }
  }
}

extension ViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    guard let input = textField.text else { return false}
    url = input
    textField.resignFirstResponder()
    loadUrl()
    return true
  }
}
