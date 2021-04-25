//
//  ViewController.swift
//  KakaoTalk
//
//  Created by 김윤서 on 2021/04/10.
//

import UIKit
import SnapKit

protocol ProfileLoadDelegator{
    func setProfile(data : FriendDataModel)
}


class FriendTabViewController: UIViewController {

    private var friendLabel = UILabel()
    private var topBarView = UIView()
    private var settingButton = UIButton()
    
    private var friendTableView = UITableView()
    
    private var friendList : [FriendDataModel] = []
    
    var delegate : ProfileLoadDelegator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        
        setFunc()
        setLayout()
        setAttributes()
        
    }
    
    private func setFunc(){
        
    }
    
    private func setTableView(){
        setFriendList()
        friendTableView.dataSource = self
        friendTableView.delegate = self
        friendTableView.register(MyProfileTableViewCell.self,
                                      forCellReuseIdentifier: MyProfileTableViewCell.identifier)
        friendTableView.register(FriendTableViewCell.self,
                                      forCellReuseIdentifier: FriendTableViewCell.identifier)
        friendTableView.separatorStyle = .none
    }
    
    private func setAttributes(){
        
        friendLabel.text = "친구"
        friendLabel.font = .font22Bold
        
        settingButton.setBackgroundImage(.settingIcon, for: .normal)
    }
    
    private func setLayout(){
        view.addSubviews(topBarView,friendLabel,settingButton,friendTableView)
        
        topBarView.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.leading.trailing.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        friendLabel.snp.makeConstraints {
            $0.centerY.equalTo(topBarView)
            $0.leading.equalTo(topBarView.snp.leading).offset(14)
        }
        
        settingButton.snp.makeConstraints {
            $0.centerY.equalTo(topBarView)
            $0.trailing.equalTo(topBarView.snp.trailing).inset(15)
        }
        
        friendTableView.snp.makeConstraints {
            $0.top.equalTo(topBarView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
    }
    
    func setFriendList()
        {
            friendList.append(contentsOf: [
                FriendDataModel(image: .profileImage1,
                                name: "안솝트",
                                state: "배고파요"),
                
                FriendDataModel(image: .profileImage2,
                                name: "최솝트",
                                state: "피곤해요"),
                
                FriendDataModel(image: .profileImage3,
                                name: "정솝트",
                                state: "시험언제끝나죠?"),
                
                FriendDataModel(image: .profileImage4,
                                name: "이솝트",
                                state: "ㅠㅠㅠㅠ"),
                
                FriendDataModel(image: .profileImage5,
                                name: "유솝트",
                                state: "나는 상태메세지!"),
                
                FriendDataModel(image: .profileImage6,
                                name: "박솝트",
                                state: "원하는대로 바꿔보세요 ^_^"),
                
                FriendDataModel(image: .profileImage7,
                                name: "최솝트",
                                state: "넘 덥다.."),
                
                FriendDataModel(image: .profileImage8,
                                name: "원솝트",
                                state: "배고파요"),
                
                FriendDataModel(image: .profileImage9,
                                name: "투솝트",
                                state: "내꿈은 대나무부자"),
                
                FriendDataModel(image: .profileImage10,
                                name: "권솝트",
                                state: "걱정말라구!")
                
            ])
        }
}


extension FriendTabViewController : UITableViewDelegate{
    func tableView(_: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 73
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let profileViewController = ProfileViewController()
        profileViewController.modalPresentationStyle = .overFullScreen
        delegate = profileViewController
        if indexPath.row == 0{
            delegate?.setProfile(data: FriendDataModel(image: .profileUserImg, name: "김윤서", state: "아놔"))
        }
        else{
            delegate?.setProfile(data: friendList[indexPath.row - 1])
        }
        
        self.present(profileViewController, animated: true)
    }
}

extension FriendTabViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if indexPath.row == 0 {
            if let cell = friendTableView.dequeueReusableCell(withIdentifier: MyProfileTableViewCell.identifier,for: indexPath) as? MyProfileTableViewCell {
                cell.setData(profile: FriendDataModel(image: .profileUserImg, name: "김윤서", state: "아놔"))
                cell.selectionStyle = .none
                return cell
            }
            return UITableViewCell()
        }else{
            if let cell = friendTableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.identifier,for: indexPath) as? FriendTableViewCell {
                cell.setData(profile: friendList[indexPath.row - 1])
                cell.selectionStyle = .none
                return cell
            }
            return UITableViewCell()
        }
    }
    
}

