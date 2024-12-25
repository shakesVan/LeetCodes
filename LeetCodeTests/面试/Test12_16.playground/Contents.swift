import UIKit

/*
 给出一个字符串 s（仅含有小写英文字母和括号）。

 请你按照从括号内到外的顺序，逐层反转每对匹配括号中的字符串，并返回最终的结果。

 注意，您的结果中 不应 包含任何括号。


 示例 1：

 输入：s = "(abcd)"
 输出："dcba"
 示例 2：

 输入：s = "(u(love)i)"
 输出："iloveu"
 解释：先反转子字符串 "love" ，然后反转整个字符串。
 示例 3：

 输入：s = "(ed(et(oc))el)"
 输出："leetcode"
 解释：先反转子字符串 "oc" ，接着反转 "etco" ，然后反转整个字符串。
 示例 4：

 输入：s = "a(bcdefghijkl(mno)p)q"
 输出："apmnolkjihgfedcbq"
 
 */


func getString(_ s: String) -> String {
    if s.count == 0 {
        return ""
    }
    
    var stack = [Character]()
    var chars: [Character] = Array(s)
    var left: Character = "("
    var right: Character = ")"
    
    for i in 0..<chars.count {
        let char = chars[i]
        
        if char == right {
            // 出栈
            var arr: [Character] = []
            var tmp = stack.last
            while let tmp0 = tmp {
                if tmp0 == left {
                    stack.removeLast()
                    arr.forEach { stack.append($0) }
                    break
                }
                arr.append(stack.removeLast())
                tmp = stack.last
            }
            
        } else {
            // 入栈
            stack.append(char)
        }
        
    }
    return String(stack)

}

print(getString("(abcd)"))// dcba
print(getString("(u(love)i)"))// (uevol //
print(getString("(ed(et(oc))el)"))
print(getString("a(bcdefghijkl(mno)p)q"))
print(getString("()"))

var greeting = "Hello, playground"


struct Person {
    var name: String
    var age: Int
}

[
    "name": String()
    "age": String()
]
