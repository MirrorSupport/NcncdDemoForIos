//
//  BloodSugarTestVC.swift
//  NcncdDemo
//  上传血糖类型
//  Created by lihaotian on 2017/11/17.
//  Copyright © 2017年 miao. All rights reserved.
//

import UIKit
import Ncncd

class BloodSugarTestVC: UIViewController , NcncdApiDelegate{
    
    // 血糖类型
    @IBOutlet weak var tfType: UITextField!
    // 测量数值
    @IBOutlet weak var tfValue: UITextField!
    
    // 内容框
    @IBOutlet weak var textView: UITextView!
    
    // 数据缓存
    var datas: Array<BloodSugar> = []
    
    let httpAlert = MBProgressHUD(view: UIApplication.shared.keyWindow!)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "血糖数据"
        
        // 修改输入框边框
        textView.layer.borderWidth = 1.5
        textView.layer.borderColor = UIColor.black.cgColor
        
        tfType.text = "1"
        tfValue.text = "6.6"
        
        addData(type: 1, value: 6.6)
    }
    
    /// 限制血糖类型输入长度
    ///
    /// - Parameter sender: sender
    @IBAction func actionTfTypeChange(_ sender: Any) {
        
        setUpTfLength(textF: tfType, length: 1)
    }
    
    /// 限制测量数值输入长度
    ///
    /// - Parameter sender: sender
    @IBAction func actionTfValueChange(_ sender: Any) {
        
        setUpTfLength(textF: tfValue, length: 6)
    }
    
    /// 添加数据Action
    ///
    /// - Parameter sender: sender
    @IBAction func actionAdd(_ sender: Any) {
        
        if tfType.text!.isEmpty || tfValue.text!.isEmpty {
            
            showToast(view: self.view, message: "请完整填写内容")
            return
        }
        
        let value = Int(tfType.text!)!
        if value < 1 || value > 2 {
            
            showToast(view: self.view, message: "血糖类型只能填1或2")
            return
        }
        
        if Float(tfValue.text!) == nil {
            
            showToast(view: self.view, message: "测试数值格式错误")
        }
        
        addData(type: value, value: Float(tfValue.text!)!)
        
    }
    
    /// 添加数据
    ///
    /// - Parameters:
    ///   - type: 血糖类型
    ///   - value: 测量数值
    func addData(type: Int , value: Float) {
        
        let bloodSugar = BloodSugar()
        bloodSugar.type = type
        bloodSugar.value = value
        bloodSugar.sampleTime = Int(Date().timeIntervalSince1970)
        
        datas.append(bloodSugar)
        
        var text = "血糖类型：\(type) , 测量数值：\(value)"
        if !textView.text.isEmpty {
            
            text.append("\n")
            text.append(textView.text)
        }
        
        textView.text = text
    }
    
    /// 上传数据
    ///
    /// - Parameter sender: sender
    @IBAction func actionUpload(_ sender: Any) {
        
        BloodSugarApi.delegate = self
        BloodSugarApi.uploadBloodSugar(data: datas, telephone: "13889354554")
    }
    
    /// 重置数据
    ///
    /// - Parameter sender: sender
    @IBAction func actionReset(_ sender: Any) {
        
        textView.text = ""
        
        tfType.text = "1"
        tfValue.text = "6.6"
        
        addData(type: 1, value: 6.6)
    }
    
    func start() {
        
        httpAlert.label.text = "处理中..."
        UIApplication.shared.keyWindow?.addSubview(httpAlert)
        httpAlert.show(animated: true)
    }
    
    func success() {
        
        showToast(view: self.view, message: "数据上传成功")
        
        textView.text = ""
        
        tfType.text = "1"
        tfValue.text = "6.6"
        
        addData(type: 1, value: 6.6)
    }
    
    func httpError(httpError: Error) {
        
        print("--------" + httpError.localizedDescription)
        
        showToast(view: self.view, message: "请求异常，请检查您的网络并稍后再试")
    }
    
    func failure(errNo: Int, errMsg: String) {
        
        
        showToast(view: self.view, message: errMsg)
    }
    
    func finish() {
        
        httpAlert.hide(animated: true)
    }
    
    /// 回收键盘
    ///
    /// - Parameters:
    ///   - touches:
    ///   - event:
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
