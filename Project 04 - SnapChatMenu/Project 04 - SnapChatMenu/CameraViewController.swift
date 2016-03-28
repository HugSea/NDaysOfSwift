//
//  CameraViewController.swift
//  Project 04 - SnapChatMenu
//
//  Created by 张庆杰 on 16/3/24.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!

    var captureSession: AVCaptureSession?
    var stillImageOutput: AVCaptureStillImageOutput?
    var previewLayer: AVCaptureVideoPreviewLayer?
    var isTakePhoto = Bool()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        UIApplication.sharedApplication().statusBarHidden = true
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // 创建捕获任务
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSessionPreset1920x1080
        
        // 设置后置摄像头
        let backCamera = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        // 创建输入流对象
        var captureDeviceInput: AVCaptureDeviceInput!
        var error: NSError?
        do {
            captureDeviceInput = try AVCaptureDeviceInput(device: backCamera)
        } catch let err as NSError {
            error = err
            captureDeviceInput = nil
        }
        if error == nil && captureSession?.canAddInput(captureDeviceInput) != nil {
            // 将输入流对象添加到缓冲区
            captureSession?.addInput(captureDeviceInput)
            
            // 创建输出流对象
            stillImageOutput = AVCaptureStillImageOutput()
            stillImageOutput?.outputSettings = [AVVideoCodecKey: AVVideoCodecJPEG]
            if captureSession?.canAddOutput(stillImageOutput) != nil {
                // 将输出流添加到缓冲区
                captureSession?.addOutput(stillImageOutput)
                
                // 创建预览图层
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
                previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.Portrait
                contentView.layer.addSublayer(previewLayer!)
                
                captureSession?.startRunning()
            }
        }
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        previewLayer?.frame = contentView.bounds
        
        print(previewLayer?.frame)
    }
    
    // MARK: - Event Response
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if isTakePhoto == false {
            isTakePhoto = true
            takePhoto()
        } else {
            isTakePhoto = false
            imageView.hidden = true
        }
    }

    // MARK: - Private Methods

    func takePhoto() {
        if let connection = stillImageOutput?.connectionWithMediaType(AVMediaTypeVideo) {
            // 将视频的旋转与设备同步
            connection.videoOrientation = AVCaptureVideoOrientation.Portrait
            stillImageOutput?.captureStillImageAsynchronouslyFromConnection(connection, completionHandler: { (sampleBuffer, error) -> Void in
                if error == nil {
                    // 将捕获的数据转为图片
                    let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer)
                    self.imageView.image = UIImage(data: imageData)
                    self.imageView.hidden = false
                }
            })
        }
    }
}
