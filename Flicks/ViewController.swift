//
//  ViewController.swift
//  Flicks
//
//  Created by MacbookPro on 1/9/16.
//  Copyright © 2016 MacbookPro. All rights reserved.
//

import UIKit
import AFNetworking

class ViewController: UIViewController {
    let totalMovies: Int = 100
    var movies: [NSDictionary]?
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
         collectionView.dataSource = self
        collectionView.delegate = self
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//
//    func movieForIndexPath(indexPath: NSIndexPath) -> UIColor {
//        if indexPath.row >= totalMovies {
//            return UIColor.blackColor()	// return black if we get an unexpected row index
//        }
//        
//        var hueValue: CGFloat = CGFloat(indexPath.row) / CGFloat(totalMovies)
//        return UIColor(hue: hueValue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
//    }



    func loadData() {
        
        
        
        
        
        let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
        let url = NSURL(string:"https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request,
            completionHandler: { (dataOrNil, response, error) in
                if let data = dataOrNil {
                    if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                        data, options:[]) as? NSDictionary {
                            NSLog("response: \(responseDictionary)")
                            
                            self.movies = responseDictionary ["results"] as! [NSDictionary]
                            self.collectionView.reloadData()
                    }
                }
        });
        task.resume()
        
        
        
    }
}








extension ViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let movies = movies {
            return movies.count
        } else {
            
            return 0
            
        }
    }
    
 
        
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("com.Davis.MovieCell", forIndexPath: indexPath) as! MovieCell
            let movie = movies![indexPath.row]
            let title = movie["title"] as! String
        
        
           let posterPath = movie["poster_path"] as! String
           let baseUrl = "http://image.tmdb.org/t/p/w500"
           let imageUrl = NSURL(string: baseUrl + posterPath)
        
        
         cell.titleLabel.text = title 
         cell.posterView.setImageWithURL(imageUrl!)
        
        
        
        
        return cell
    }
}


extension ViewController: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("Selected cell number: \(indexPath)")
    }
}