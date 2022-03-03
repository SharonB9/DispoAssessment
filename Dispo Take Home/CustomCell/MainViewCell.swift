import UIKit
import Kingfisher
import SkeletonView

class MainViewCell: UITableViewCell {
    
    static let identifier = "cell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(gifImage)
        contentView.addSubview(gifTitle)
        configureViewCell()
    }
    
    public let gifImage: UIImageView = {
        let gifImage = UIImageView()
        gifImage.isSkeletonable = true
        gifImage.showAnimatedGradientSkeleton()
        gifImage.backgroundColor = .red
        gifImage.clipsToBounds = true
        gifImage.image = UIImage(named: "test")
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: {
            gifImage.hideSkeleton()
        })
        return gifImage
    }()
    
    public let gifTitle: UILabel = {
        let gifTitle = UILabel()
        gifTitle.isSkeletonable = true
        gifTitle.showAnimatedGradientSkeleton()
        gifTitle.text = "Title goes here"
        gifTitle.numberOfLines = 0
        gifTitle.adjustsFontSizeToFitWidth = false
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: {
            gifTitle.hideSkeleton()
        })
        return gifTitle
    }()
    
    public func setup(with giphy: Giphy) {
        gifTitle.text = giphy.title
        gifImage.setImage(imageUrl: giphy.url ?? "")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
