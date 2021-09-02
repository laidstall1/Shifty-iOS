//
//  ViewController.swift
//  Shifty-iOS
//
//  Created by mac on 01/09/2021.
//

import UIKit

private let reuseIdentifier = "OnboardingCell"
class OnboardingController: UICollectionViewController {

    //    MARK: - Properties
    private let topContainerView = TopContainerView(image: "topContainer")
    private let skipButton = UIButton(bgColor: #colorLiteral(red: 0.6296878457, green: 0.4354371428, blue: 0.9175583124, alpha: 1) )
    private let nextButton = UIButton(type: .system)
    private let largeTitleLabel = CustomLabel(text: "Easy Process", font: .boldSystemFont(ofSize: 36), true)
    private let descriptionLabel =  CustomLabel(text: "Find all your house needs in one place. We provide every service to make your home experience smooth.", font: .systemFont(ofSize: 16), false)
    
    //    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        configureCollectionView()
        navigationController?.navigationBar.isHidden = true
    }

    init() {
            super.init(collectionViewLayout: UICollectionViewFlowLayout())
        }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    //    MARK: - Selectors
    
    
    //    MARK: - Helpers
    
    func configureCollectionView() {
        collectionView.register(OnboardingCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let layout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .white
        layout.scrollDirection = .horizontal
        collectionView.isPagingEnabled = true
    }
    
    func configureUI() {
        view.addSubview(topContainerView)
        topContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topContainerView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor)

        topContainerView.addSubview(skipButton)
        skipButton.anchor(top: topContainerView.safeAreaLayoutGuide.topAnchor, right: topContainerView.rightAnchor, paddingRight: 30)

        let stack = UIStackView(arrangedSubviews: [largeTitleLabel, descriptionLabel])
        stack.axis = .vertical
        stack.spacing = 10

        view.addSubview(stack)
        stack.centerX(inView: view)
        stack.anchor(top: topContainerView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 49, paddingLeft: 37, paddingRight: 37)

        view.addSubview(nextButton)
        nextButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 40, paddingBottom: 24, paddingRight: 40)
        nextButton.centerX(inView: view)
    }
}

extension OnboardingController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? OnboardingCell else  { return UICollectionViewCell() }
        return cell
    }
}

extension OnboardingController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.height-0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 0, left: 0, bottom: 0, right: 0)
    }
}

