import Foundation
import UIKit

class AIActivityView: UIView {
    private lazy var loadingView: UIView = {
        let loadingView = UIView()
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = CGPoint(x: center.x, y: center.y - 50 )
        loadingView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        return loadingView
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
        activityIndicator.style = .whiteLarge
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2 )
        activityIndicator.startAnimating()
        return activityIndicator
    }()
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white.withAlphaComponent(0.0)
        
        loadingView.addSubview(activityIndicator)
        addSubview(loadingView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func showActivity(on view: UIView) {
        if view.subviews.filter({ $0 is ActivityView }).isEmpty {
            view.addSubview(ActivityView(frame: UIScreen.main.bounds))
        }
    }
    
    static func hideActivity(on view: UIView) {
        view.subviews.filter({ $0 is ActivityView }).forEach({$0.removeFromSuperview()})
    }
}
