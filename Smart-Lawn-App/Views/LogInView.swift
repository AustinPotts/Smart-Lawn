//
//  LogInView.swift
//  Smart-Lawn-App
//
//  Created by Austin Potts on 9/28/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class LogInView: UIView {

    
    let backgroundImageView: UIImageView = UIImageView()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupConstraints()
    }
    
    
    private var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(LoginButton), for: .touchUpInside)
        return button
    }()
    
    private var signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign Up", for: .normal)
        button.tintColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(SignUpButton), for: .touchUpInside)
        return button
    }()
    
    
    private var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25)
        
        label.text = "Please Login"
        label.textColor = .white
        
        label.textAlignment = .center
        return label
    }()
    
    var passwordView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.9411764706, blue: 0.9450980392, alpha: 1)
        view.layer.cornerRadius =   30
        return view
    }()
    
    var usernameBoxView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.9411764706, blue: 0.9450980392, alpha: 1)
        view.layer.cornerRadius = 30
        return view
    }()
    
    lazy var passwordTextfield: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.textColor = .darkGray
        textfield.placeholder = "Enter Your Password"
        textfield.isSecureTextEntry = true
        return textfield
    }()
    
    
    lazy var usernameTextfield: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.textColor = .darkGray
        textfield.placeholder = "Enter Your Username"
        return textfield
    }()
    
    
    // Large View Containing All Elements
    private var loginView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = false
        view.backgroundColor = #colorLiteral(red: 0.02971558008, green: 0.5, blue: 0.01973280179, alpha: 1)
        view.layer.cornerRadius = 30
        view.layer.shadowRadius = 30
        return view
    }()
    
    private var signUpView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        view.layer.cornerRadius =   30
        return view
    }()
    
    
    //View for the Login Button
    private var loginButtonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        view.layer.cornerRadius =   30
        return view
    }()
    
    private var createAccountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "Please Sign Up"
        label.textColor = .darkGray
        label.textAlignment = .right
        return label
    }()
    
    
    
    //MARK: - Methods
    @objc func LoginButton() {
        guard let username = usernameTextfield.text,!username.isEmpty,
            let password = passwordTextfield.text, !password.isEmpty else {return}
        print("\(username), \(password)")
        
        
    }
    
    @objc func SignUpButton() {
        
        
    }
    
    private func setupConstraints() {
        
        addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true //background leading anchor equal to view leading anchor
        backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        backgroundImageView.image = UIImage(named: "Grass")
        
        addSubview(loginView)
        loginView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 130).isActive = true
        loginView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        loginView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        loginView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -230).isActive = true
        
        loginView.addSubview(loginLabel)
        loginLabel.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 20).isActive = true
        loginLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 20).isActive = true
        loginLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -20).isActive = true
        
        
        loginView.addSubview(usernameBoxView)
        usernameBoxView.topAnchor.constraint(equalToSystemSpacingBelow: loginLabel.bottomAnchor, multiplier: 2).isActive = true
        usernameBoxView.leadingAnchor.constraint(equalTo: loginView.leadingAnchor,constant: 10).isActive = true
        usernameBoxView.trailingAnchor.constraint(equalTo:loginView.trailingAnchor,constant: -10).isActive = true
        usernameBoxView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        usernameBoxView.addSubview(usernameTextfield)
        usernameTextfield.leadingAnchor.constraint(equalTo: usernameBoxView.leadingAnchor, constant: 15).isActive = true
        usernameTextfield.trailingAnchor.constraint(equalTo: usernameBoxView.trailingAnchor, constant: -10).isActive = true
        usernameTextfield.topAnchor.constraint(equalTo: usernameBoxView.topAnchor, constant: 0).isActive = true
        usernameTextfield.bottomAnchor.constraint(equalTo: usernameBoxView.bottomAnchor, constant: 0).isActive = true
        
        loginView.addSubview(passwordView)
        passwordView.topAnchor.constraint(equalToSystemSpacingBelow: usernameBoxView.bottomAnchor, multiplier: 2).isActive = true
        passwordView.leadingAnchor.constraint(equalTo: loginView.leadingAnchor,constant: 10).isActive = true
        passwordView.trailingAnchor.constraint(equalTo:loginView.trailingAnchor,constant: -10).isActive = true
        passwordView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        
        passwordView.addSubview(passwordTextfield)
        passwordTextfield.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 15).isActive = true
        passwordTextfield.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: -10).isActive = true
        passwordTextfield.topAnchor.constraint(equalTo: passwordView.topAnchor, constant: 0).isActive = true
        passwordTextfield.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 0).isActive = true
        
        loginView.addSubview(loginButtonView)
        loginButtonView.topAnchor.constraint(equalToSystemSpacingBelow: passwordView.bottomAnchor, multiplier: 2).isActive = true
        loginButtonView.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 100).isActive = true
        loginButtonView.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -100).isActive = true
        loginButtonView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        loginButtonView.addSubview(loginButton)
        loginButton.leadingAnchor.constraint(equalTo: loginButtonView.leadingAnchor).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: loginButtonView.trailingAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: loginButtonView.topAnchor).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: loginButtonView.bottomAnchor).isActive = true
        
        
        
        addSubview(signUpView)
        signUpView.topAnchor.constraint(equalTo: loginButtonView.bottomAnchor, constant: 20).isActive = true
        signUpView.leadingAnchor.constraint(equalTo: loginButtonView.leadingAnchor, constant: 20).isActive = true
        signUpView.trailingAnchor.constraint(equalTo: loginButtonView.trailingAnchor, constant: -20).isActive = true
        signUpView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        
        signUpView.addSubview(signUpButton)
        signUpButton.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor).isActive = true
        signUpButton.topAnchor.constraint(equalTo: signUpView.topAnchor).isActive = true
        signUpButton.bottomAnchor.constraint(equalTo: signUpView.bottomAnchor).isActive = true
        
        
        
        
    }
}


