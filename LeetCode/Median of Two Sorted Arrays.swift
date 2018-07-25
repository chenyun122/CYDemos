//
//  Median of Two Sorted Arrays.swift
//  YjyxStudent
//
//  Created by Yun CHEN on 2018/7/25.
//  Copyright © 2018年 YJYX. All rights reserved.
//

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var A = nums1
        var B = nums2
        if (A.count > B.count) {
            swap(&A, &B)
        }
        let m = A.count, n = B.count
        let halfLength = (m + n + 1) / 2
        var iMin = 0, iMax = m
        while iMin <= iMax {
            let i = (iMin + iMax) / 2
            let j = halfLength - i
            if (i < iMax && B[j-1] > A[i]) {
                iMin+=1
            }
            else if (i > iMin && A[i-1] > B[j]) {
                iMax-=1
            }
            else{
                var maxLeft = 0
                if i == 0 {
                    maxLeft = B[j-1]
                }
                else if j == 0 {
                    maxLeft = A[i-1]
                }
                else{
                    maxLeft = max(A[i-1], B[j-1])
                }
                
                if ( (n + m) % 2 == 1) {
                    return Double(maxLeft)
                }
                
                var minRight = 0
                if (i == m) {
                    minRight = B[j]
                }
                else if (j == n) {
                    minRight = A[i]
                }
                else{
                    minRight = min(A[i], B[j])
                }
                
                return Double(maxLeft + minRight) / 2.0
            }
        }
        return 0.0
    }
}
