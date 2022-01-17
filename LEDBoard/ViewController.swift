//
//  ViewController.swift
//  LEDBoard
//
//  Created by Siwoo Baek on 2022/01/17.
//

import UIKit

class ViewController: UIViewController, LEDSBoardSettingDelegate {

    @IBOutlet weak var contentsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentsLabel.textColor = .yellow
    }

    // 세팅 뷰컨트롤러의 delegate 정보를 받기 위한 준비(다운캐스팅)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingViewController = segue.destination as? SettingViewController {
            settingViewController.delegate = self
            settingViewController.ledText = self.contentsLabel.text
            settingViewController.textColor = self.contentsLabel.textColor
            // 배경 색상에 대한 별도 설정이 없는 경우(optional), 검정색을 기본색상으로 제공
            settingViewController.backgroundColor = self.contentsLabel.backgroundColor ?? .black
        }
    }
    
    // 세팅 뷰컨트롤러에서 전달받은 각 속성정보들을 루트 뷰컨트롤러에 적용
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
        if let text = text {
            self.contentsLabel.text = text
        }
        self.contentsLabel.textColor = textColor
        self.view.backgroundColor = backgroundColor
    }
}

