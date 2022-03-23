import Foundation

var width: Float = 1.5
var height: Float = 2.3

let oneBucketCovers: Float = 1.5

var bucketsOfPaint: Int {
    get {
        let numberOfBuckets = (width*height)/oneBucketCovers
        let roundedBuckets = ceilf(numberOfBuckets)
        return Int(roundedBuckets)
    }
    
    set {
        print("The introduced number of buckets can paint \(Float(newValue)*oneBucketCovers) sqm")
    }
}
//a bucket cover 1.5m2

print(bucketsOfPaint)


bucketsOfPaint = 8
