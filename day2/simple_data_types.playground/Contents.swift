import UIKit

let fileName = "some.jpg"
let isImage = fileName.hasSuffix(".jpg")

let number = 120
let isMultiple = number.isMultiple(of: 3)


var gameOver = false
print("playing..... player killed")
gameOver.toggle()

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)
