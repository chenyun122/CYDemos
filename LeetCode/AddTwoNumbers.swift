/**
 Add two numbers
 https://leetcode-cn.com/problems/add-two-numbers
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    public var desc:String {
        get{
            if let nextDesc = self.next?.desc {
                return String(val) + nextDesc
            }
            else{
                return String(val)
            }
        }
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var p = l1,q = l2
        let resultNode = ListNode(0)
        var current = resultNode
        var carry = 0
        while (p != nil || q != nil) {
            let sum = (p != nil ? p!.val : 0) + (q != nil ? q!.val : 0) + carry
            carry = sum / 10
            
            current.next = ListNode(sum % 10)
            current = current.next!
            p = p?.next
            q = q?.next
        }
        if carry > 0 {
            current.next = ListNode(carry)
        }
        
        return resultNode.next
    }
}

/* Test case:
 l1=[0,1]
 l2=[0,1,2]
 
 let l1 = ListNode(0)
 l1.next = ListNode(1)
 
 let l2 = ListNode(1)
 l2.next = ListNode(1)
 l2.next?.next = ListNode(2)
*/



/* Test case:
 l1=[]
 l2=[0,1]
 
 let l1:ListNode? = nil
 
 let l2 = ListNode(0)
 l2.next = ListNode(1)
 */


/* Test case:
 l1=[9,9]
 l2=[1]
 */
/*
let l1 = ListNode(9)
l1.next = ListNode(9)

let l2 = ListNode(1)

let solution = Solution()
if let resultNode = solution.addTwoNumbers(l1, l2) {
    print(resultNode.desc)
}
 */

