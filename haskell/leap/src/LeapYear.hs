module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year 
    | evenly year 4 == True && notEvenly year 100 == True = True
    | (evenly year 4 == True && evenly year 100 == True) && evenly year 400 == True = True
    | evenly year 4 == True && evenly year 100 == True = False
    | otherwise = False

evenly :: Integer -> Integer -> Bool
evenly year number = if year `rem` number == 0 then True else False 

notEvenly :: Integer -> Integer -> Bool
notEvenly year number = if year `rem` number > 0 then True else False
