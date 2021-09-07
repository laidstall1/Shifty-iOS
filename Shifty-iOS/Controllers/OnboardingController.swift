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
    
    private let pageControl: UIPageControl = {
       let pg = UIPageControl()
        return pg
    }()
    
    private lazy var skipButton: UIButton = {
        let btn = createSkipButton()
        btn.addTarget(self, action: #selector(handleSkipBtn), for: .touchUpInside)
       return btn
    }()
    
    private lazy var nextButton: UIButton = {
        let btn = createNavigationButton(title: "Continue")
        btn.addTarget(self, action: #selector(handleNextButton), for: .touchUpInside)
        return btn
    }()
    
    var slides: [OnboardingSlide] = []
    
    //    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        configureCollectionView()
        configureUI()
        slides = configureOnboardingSlides()
        navigationController?.navigationBar.isHidden = true
        configurePageControl()
    }

    override func viewDidLayoutSubviews() {
        configurePageControl() 
    }
    
    init() {
            super.init(collectionViewLayout: UICollectionViewFlowLayout())
        }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    //    MARK: - Selectors
    
    @objc func handleSkipBtn() {
        let vc = WelcomeMobileController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    
    @objc func handleNextButton() {
    }
    
    @objc func handlePageControl() {
    }
    
    
    //    MARK: - Helpers
    
    func configurePageControl() {
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = UIColor.red
        pageControl.tintColor = .lightGray
            self.view.insertSubview(pageControl, at: 0)
        view.bringSubviewToFront(pageControl)
    }
    
    fileprivate func configureOnboardingSlides() -> [OnboardingSlide] {
        return [OnboardingSlide(title: "Easy Process", description: "Find all your house needs in one place. We provide every service to make your home experience smooth.", image: "topContainer"),
                
                OnboardingSlide(title: "Fast Transportation", description: "We provide the best transportation service and organize your furniture properly to prevent any damage.", image: "fastTransport"),
                
                OnboardingSlide(title: "Expert People", description: "We have the best in class individuals working just for you. They are well  trained and capable of handling anything you need.", image: "expertPeople")]
    }
    
    //    MARK: - Helpers
    
    func createSkipButton() -> UIButton {
        let button = UIButton()
            button.setTitle("Skip", for: .normal)
            button.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1).cgColor
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
            button.setWidth(width: 69)
            button.setHeight(height: 41)
            button.alpha = 0.8
            button.layer.cornerRadius = 41 / 2
        
            return button
    }
    
    func configureCollectionView() {
        collectionView.register(OnboardingCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let layout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .white
        layout.scrollDirection = .horizontal
        collectionView.isPagingEnabled = true
    }
    
    func configureUI() {
        view.addSubview(skipButton)
        skipButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, right: view.rightAnchor, paddingRight: 30)
   
        view.addSubview(nextButton)
        nextButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 40, paddingBottom: 24, paddingRight: 40)
        nextButton.centerX(inView: view)
        
        pageControl.addTarget(self, action: #selector(handlePageControl), for: .valueChanged)
        pageControl.hidesForSinglePage = true
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.9921568627, green: 0.4196078431, blue: 0.1333333333, alpha: 1)
        pageControl.currentPageIndicatorTintColor = .orange
        
        view.addSubview(pageControl)
        pageControl.centerX(inView: view)
        pageControl.setDimensions(height:18 , width: 56)
        pageControl.anchor(bottom: nextButton.topAnchor, paddingBottom: 20)
        
    }
}

extension OnboardingController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? OnboardingCell else  { return UICollectionViewCell() }
        cell.configure(with: slides[indexPath.row])
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.section
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

