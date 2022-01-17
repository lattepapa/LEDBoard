//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by Siwoo Baek on 2022/01/17.
//

import UIKit

// 이 세팅 뷰컨트롤러에 저장된 내용들을 루트 뷰컨트롤러로 전달하기 위해 delegate 필요
// 이는 아래 delegate 선언을 통해 클래스의 속성으로 실현된다
protocol LEDSBoardSettingDelegate: AnyObject {
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
}

class SettingViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var yellobutton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    
    // 세팅 뷰컨트롤러에서 활용할 delegate 속성
    weak var delegate: LEDSBoardSettingDelegate?
    
    // 색깔을 입힐 글자 속성
    var ledText: String?
    
    // delegate 내 함수(changedSetting)에 인자로 사용하기 위한 글자색, 배경색 속성
    var textColor: UIColor = .yellow
    var backgroundColor: UIColor = .black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 글자에 적용된 색깔과 배경을 뷰 컨트롤러에 저장
        self.configureView()
    }
    
    // 글자에 색깔과 배경을 지정하는 함수
    private func configureView() {
        if let ledText = self.ledText {
            self.textField.text = ledText
        }
        self.changeTextColorButton(color: self.textColor)
        self.changeBackgroundColorButton(color: self.backgroundColor)
    }
    
    // 글자 색상 설정 항목에서 색상버튼 클릭 시 changeTextColorButton 메서드에 해당 색상버튼의 색깔을 인자로 넘겨주기
    // 선택된 색상은 메서드뿐만 아니라 textColor 속성에도 저장
    // 이를 통해 delegate 내 함수(changedSetting)에 입력 가능해진다
    @IBAction func tabTextColorButton(_ sender: UIButton) {
        if sender == self.yellobutton {
            self.changeTextColorButton(color: .yellow)
            self.textColor = .yellow
        } else if sender == self.purpleButton {
            self.changeTextColorButton(color: .purple)
            self.textColor = .purple
        } else if sender == self.greenButton {
            self.changeTextColorButton(color: .green)
            self.textColor = .green
        }
    }
    
    // 베경 색상 설정 항목에서 색상버튼 클릭 시 changeBackgroundColorButton 메서드에 해당 색상버튼의 색깔을 인자로 넘겨주기
    // 선택된 색상은 메서드뿐만 아니라 backgroundColor 속성에도 저장
    // 이를 통해 delegate 내 함수(changedSetting)에 입력 가능해진다
    @IBAction func tabBackgroundColorButton(_ sender: UIButton) {
        if sender == self.blackButton {
            self.changeBackgroundColorButton(color: .black)
            self.backgroundColor = .black
        } else if sender == self.blueButton {
            self.changeBackgroundColorButton(color: .blue)
            self.backgroundColor = .blue
        } else if sender == self.orangeButton {
            self.changeBackgroundColorButton(color: .orange)
            self.backgroundColor = .orange
        }
    }
    
    // "저장" 버튼 클릭 시
    @IBAction func tabSaveButton(_ sender: UIButton) {
        // delegate에 지금까지 저장한 속성값들을 쭉 활용
        self.delegate?.changedSetting(
            text: self.textField.text,
            textColor: self.textColor,
            backgroundColor: self.backgroundColor
        )
        
        // 저장 완료 후 뒤로우
        self.navigationController?.popViewController(animated: true)
    }
    
    // 선택된 글자 색상버튼에 대해 Alpha 값을 1로 올려주기
    private func changeTextColorButton(color: UIColor) {
        self.yellobutton.alpha = color == UIColor.yellow ? 1 : 0.2
        self.purpleButton.alpha = color == UIColor.purple ? 1 : 0.2
        self.greenButton.alpha = color == UIColor.green ? 1 : 0.2
    }
    
    // 선택된 배경 색상버튼에 대해 Alpha 값을 1로 올려주기
    private func changeBackgroundColorButton(color: UIColor) {
        self.blackButton.alpha = color == UIColor.black ? 1 : 0.2
        self.blueButton.alpha = color == UIColor.blue ? 1 : 0.2
        self.orangeButton.alpha = color == UIColor.orange ? 1 : 0.2
    }
}
