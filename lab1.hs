-- CSci 117, Lab 1:  Introduction to Haskell
-- Eric Smrkovsky
-- Lab @ 10 Room 205



NOTE: all examples are at start at line 426
---------------- Part 1 ----------------

-- Work through Chapters 1 - 3 of Learn You a Haskell for Great Good!
-- Type in the examples and make sure you understand the results.
-- Ask questions about anything you don't understand! This is your
-- chance to get off to a good start understanding Haskell.


---------------- Part 2 ----------------

-- The Haskell Prelude has a lot of useful built-in functions related
-- to numbers and lists.  In Part 2 of this lab, you will catalog many
-- of these functions.

data Color = Red | Orange | Yellow | Green | Blue | Violet
     deriving (Show, Eq, Ord, Enum)

-- For each of the Prelude functions listed below, give its type,
-- describe in your own words what the function does, answer any
-- questions specified, and give several examples of its use.  Does
-- the function apply at all to the "Color" type defined above?

-- succ
    -- succ :: Enum a => a -> a
    -- takes a value and returns it's successor.
    -- works with Color type.
-- pred
    -- pred :: Enum a => a -> a
    -- takes a value and returns it's predecessor.
    -- works with Color type.

-- toEnum
    -- toEnum :: Enum a => Int -> a
    -- takes an Int and converts it to an EDT.
    -- works with Color type.
-- fromEnum
    -- fromEnum :: Enum a => a -> Int
    -- takes an EDT and converts it to an Int.
    -- works with Color type.
-- enumFrom
    -- enumFrom :: Enum a => a -> [a]
    -- takes an element of a list and returns the
    -- remaining members of the list.
    -- Can return infinite lists.
    -- Can set the result of an input.
    -- Can set a maxBound using 'take' function.
    -- works with Color type.
-- enumFromThen
    -- enumFromThen :: Enum a => a -> a -> [a]
    -- takes two values of an EDT
    -- finds the spacing between the two values
    -- and continues the pattern until the end
    -- of the list is reached.
    -- Inaccurate when it comes to Floats.
    -- works with Color type.
-- enumFromTo
    -- enumFromTo :: Enum a => a -> a -> [a]
    -- Takes 2 inputs from an EDT and makes a list
    -- by starting with the first input and
    -- incrementing by one until 2nd input is reached.
    -- only increments if distance is greater that .5
    -- instances of integer overflow.
    -- works with Color type.
-- enumFromThenTo
    -- enumFromThenTo :: Enum a => a -> a -> a -> [a]
    -- takes 3 inputs from a EDT and makes a list starting
    -- with first value. second value is used to find distance
    -- that the list will be incremented by until 3rd input
    -- is reached. doesn't work with decimal inputs
    -- must have distance between value one and two or
    -- an infinite list is produced.
    -- works with Color type.
-- As one of your examples, try  (toEnum 3) :: Color

-- ==
    -- (==) :: Eq a => a -> a -> Bool
    -- takes two values from Eq typeclass and compares them
    -- looking for equality. works with lists. can't compare
    -- different types.
    -- works with Color type
-- /=
    -- (/=) :: Eq a => a -> a -> Bool
    -- takes two values from Eq and tests for equality.
    -- if the values are equal, returns False.
    -- works with Color type

-- quot
    -- quot :: Integral a => a -> a -> a
    -- takes two values from Integral typeclass and divides
    -- the first input by the second and returns the answer.
    -- Integral basically means whole numbers.
    -- Truncates toward zero
    -- can't divide by zero
    -- does NOT work with Color type
-- div
    -- div :: Integral a => a -> a -> a
    -- takes two values from Integral typeclass and divides
    -- the first input by the second and returns the answer.
    -- Truncates toward negative infinity
    -- can't divide by zero
    -- does NOT work with Color type
-- Q: What is the difference between quot and div functions?
-- A: The quot functions truncates a resulting negative value
--    toward zero and the div functions truncates it's negative
--    results toward negative infinity.

-- rem
    -- rem :: Integral a => a -> a -> a
    -- takes two inputs from the Integral typeclass and divides the
    -- first input by the second input.
    -- satisfies (x `quot` y)*y + (x `rem` y)
    -- can't divide by zero
    -- does NOT work with Color type.
-- mod
    -- mod :: Integral a => a -> a -> a
    -- takes two inputs from the Integral typeclass and does
    -- modular division of the first input with the second inputs
    -- satisfies (x `div` y)*y + (x `mod` y)
    -- can't divide by zero
    -- does NOT work with Color type
-- Q: What is the difference between rem and mod functions?
-- A: rem finds a remainder after preforming division, mod finds
--    the modulus after doing division. Basically mod can move
--    past zero to find a remainder, rem can't.

-- quotRem
    -- quotRem :: Integral a => a -> a -> (a, a)
    -- takes two inputs from the Integral typeclass and
    -- simultaneously calls the functions quot and rem with the
    -- inputs and returns the outputs of the functions as a tuple.
    -- can't divide by zero.
    -- does NOT work with Color type.
-- divMod
    -- divMod :: Integral a => a -> a -> (a, a)
    -- takes two inputs from the Integral typeclass and and
    -- simultaneously calls the functions quot and rem with the
    -- inputs and returns the outputs of the functions as a tuple.
    -- can't divide by zero.
    -- does NOT work with Color type.

-- &&
    -- (&&) :: Bool -> Bool -> Bool
    -- standard logical AND: takes two boolean inputs and returns a bool.
    -- returns true if both inputs are true, any other possibility
    -- returns false.
    -- does NOT work with Color type.
-- ||
    -- (||) :: Bool -> Bool -> Bool
    -- standard logical OR: takes two boolean inputs and returns a bool.
    -- returns true if one of the inputs are true, otherwise
    -- returns false.
    -- does NOT work with Color type.

-- ++
    -- (++) :: [a] -> [a] -> [a]
    -- takes two lists as input and returns
    -- the 2nd list appended to the first.
    -- works with Color type.

-- compare
    -- compare :: Ord a => a -> a -> Ordering
    -- takes two inputs or lists compares then and returns their ordering
    -- returns GT EQ or LT
    -- works with Color type.

-- <
    -- (<) :: Ord a => a -> a -> Bool
    -- takes two inputs and checks to see if the first input is less
    -- than the second input.
    -- works with Color type.
-- >
    -- (>) :: Ord a => a -> a -> Bool
    -- takes two inputs and checks to see if the first input is greater
    -- than the second input.
    -- works with Color type.

-- max
    -- max :: Ord a => a -> a -> a
    -- takes 2 inputs and returns the bigger of the two
    -- works with Color type.
-- min
    -- min :: Ord a => a -> a -> a
    -- takes 2 inputs and returns the smaller of the two
    -- works with Color type.

-- ^
    -- (^) :: (Integral b, Num a) => a -> b -> a
    -- takes two inputs and raises the first number to the
    -- second numbers power.
    -- second input can not be negative.
    -- does NOT work with Color type.

-- all
    -- all :: Foldable t => (a -> Bool) -> t a -> Bool
    -- (note: all :: (a -> Bool) -> [a] -> Bool)
    -- takes a condition in parenthesis as the first input
    -- and a list as the second input. this function returns True if
    -- all of the members in the given list satisfy the condition,
    -- otherwise it returns False.
    -- works with Color type.
-- any
    -- any :: Foldable t => (a -> Bool) -> t a -> Bool
    -- (note: any :: (a -> Bool) -> [a] -> Bool)
    -- takes a condition in parenthesis as the first input
    -- and a list as the second input. this function returns True if
    -- any of the members in the given list satisfy the condition,
    -- otherwise it returns False.
    -- works with Color type.

-- break
    -- break :: (a -> Bool) -> [a] -> ([a], [a])
    -- takes a condition in parenthesis as the first input
    -- and a list as the second input. this function returns two lists
    -- formed as a tuple. the functions checks each member of the list
    -- with the condition and populates the first part of the tuple
    -- with the members that return false, puts the remaining members in
    -- the second list.
    -- works with Color type.

-- concat
    -- concat :: Foldable t => t [a] -> [a]
    -- (note: concat :: [[a]] -> [a])
    -- takes a list containing lists and
    -- appends them together creating a new list.
    -- works with Color type.

-- const
    -- const :: a -> b -> a
    -- takes 2 inputs and returns only the 1st input.
    -- use this function when you don't need a 2nd input
    -- works with Color type.

-- cycle
    -- cycle :: [a] -> [a]
    -- takes a list as input and creates an infinite list by cycling
    -- through the members of the input list repeatedly
    -- works with Color type.

-- drop
    -- drop :: Int -> [a] -> [a]
    -- takes an Int for the first input and a list as the second input.
    -- the first input is the amount of members of the list that are dropped.
    -- the function drops those members then returns the remainder of the list.
    -- works with Color type.
-- take
    -- take :: Int -> [a] -> [a]
    -- takes an Int for the first input and a list as the second input.
    -- the first input is the amount of members that are taken and
    -- returned to the user in a list.
    -- works with Color type.

-- dropWhile
    -- dropWhile :: (a -> Bool) -> [a] -> [a]
    -- takes a condition in parenthesis as the first input
    -- and a list as the second input. drops the members that satisfy
    -- the condition and returns the rest of the list
    -- works with Color type.
-- takeWhile
    -- takeWhile :: (a -> Bool) -> [a] -> [a]
    -- takes a condition in parenthesis as the first input
    -- and a list as the second input. takes the members that satisfy
    -- the condition puts them in a list and returns the list.
    -- works with Color type.

-- elem
    -- elem :: (Foldable t, Eq a) => a -> t a -> Bool
    -- (note: elem :: Eq a => a -> [a] -> Bool)
    -- takes a value from the EQ typeclass and a list
    -- of the same type as inputs. the function traverses the list and
    -- returns true if it finds the first input otherwise returns false.
    -- works with Color type.

-- even
    -- even :: Integral a => a -> Bool
    -- takes an Integral as input and returns true if it is even
    -- otherwise returns false.
    -- does NOT work with Color type.

-- filter
    -- filter :: (a -> Bool) -> [a] -> [a]
    -- takes a condition in parenthesis as the first input
    -- and a list as the second input. traverses the list and
    -- returns a new list that contains all of the members
    -- that satisfied the condition.
    -- works with Color type.

-- fst
    -- fst :: (a, b) -> a
    -- takes a tuple as input and returns it's first member.
    -- works with Color type.

-- gcd
    -- gcd :: Integral a => a -> a -> a
    -- takes two Integers as input and returns the
    -- greatest common divisor.
    -- Does NOT work with color type.

-- head
    -- head :: [a] -> a
    -- takes a list as input and returns it's first member.
    -- works with Color type.

-- id
    -- id :: a -> a
    -- takes an input and returns then returns it.
    -- works with Color type.

-- init
    -- init :: [a] -> [a]
    -- takes a list as input and returns it without reading it's
    -- last member.
    -- works with Color type.

-- iterate
    -- iterate :: (a -> a) -> a -> [a]
    -- takes a function and a value as an input. applies the value to
    -- the function and then repeatedly applies the result back into
    -- the function after using the results to populate a list.
    -- populates the list infinitly.
    -- does not work with Color type as far as I could tell.

-- last
    -- last :: [a] -> a
    -- takes a list as input and returns it's first member.
    -- works with Color type.

-- lcm
    -- Integral a => a -> a -> a
    -- Takes two Integers as input and returns the
    -- lowest common multiple.
    -- Does NOT work with color type.

-- length
    -- length :: Foldable t => t a -> Int
    -- (note: length :: [a] -> Int)
    -- takes a list as input and returns it's length.
    -- works with Color type.

-- map
    -- map :: (a -> b) -> [a] -> [b]
    -- takes a function and a list as input. takes each member of the
    -- list and uses it as input for the function, placing each outputs
    -- in a list and returning it.
    -- works with Color type.

-- null
    -- null :: Foldable t => t a -> Bool
    -- (note: null :: [a] -> Bool)
    -- takes a list as input and returns true if it's is
    -- empty, otherwise returns false.
    -- works with Color type.

-- odd
    -- odd :: Integral a => a -> Bool
    -- takes an Integral as input and returns true if it is even
    -- otherwise returns false.
    -- does NOT work with Color type.

-- repeat
    -- repeat :: a -> [a]
    -- takes a value of any type as input and repeats it infinitely in a list.
    -- works with Color type.

-- replicate
    -- replicate :: Int -> a -> [a]
    -- takes an Int and a value of any type. this function returns a list
    -- filled with copies of the 2nd parameter and uses the first
    -- parameter for the size of the list.
    -- works with color type.

-- reverse
    -- reverse :: [a] -> [a]
    -- takes a list as input and returns it reversed.
    -- works with color type

-- snd
    -- snd :: (a, b) -> b
    -- Takes a tuple as input and returns it's second member.
    -- works with Color type.

-- span
    -- span :: (a -> Bool) -> [a] -> ([a], [a])
    -- takes a condition in parenthesis and a list as input and returns a
    -- tuple with two lists inside. this function checks each member of the
    -- list that it satisfies the condition, as long as that checks it
    -- populates the first list in the tuple. As soon as the condition fails
    -- the function places the remaining members
    -- in the second list of the tuple.
    -- works with Color type.

-- splitAt
    -- splitAt :: Int -> [a] -> ([a], [a])
    -- takes an Int and a list as input and returns a tuple with two lists.
    -- this function uses the members of the input list to populate the first
    -- list in the tuple until its length reaches the value of the Int input.
    -- It then places the rest of the members in a new list for the second
    -- part of the tuple.
    -- works with Color type.

-- zip
    -- zip :: [a] -> [b] -> [(a, b)]
    -- takes two lists as inputs and returns a list of tuples.
    -- each tuple contains the members of each slot out of the two input lists.
    -- function stops making tuples when one of the lists runs out of members
    -- works with Color type.











    -- *****EXAMPLES*****
    (about halfway through I switch the prompt to λ>)
    -- succ
        {-*Main> succ 'a'
        'b'
        *Main> succ 456
        457
        *Main> succ Blue
        Violet
        *Main> succ Violet (error, no successor)-}
    -- pred
        {-*Main> pred 1
        0
        *Main> pred 'z'
        'y'
        *Main> pred Orange
        Red
        *Main> pred Red (error, no previous value)-}

    -- toEnum
        {-*Main> toEnum 17 :: Double
        17.0
        *Main> toEnum 17 :: Bool (error, bad argument)
        *Main> toEnum 1 :: Bool (fixed error with good argument)
        True
        *Main> toEnum 1 :: Color (checked color EDT)
        Orange-}
    -- fromEnum
        {-*Main> fromEnum (-5)
        -5
        *Main> fromEnum (-5.0)
        -5
        *Main> fromEnum ('A')
        65
        *Main> fromEnum Red
        0
        -}
    -- enumFrom
        {-
        *Main> enumFrom 'a' (returns infinite list of chars)
        *Main> enumFrom 1 (returns infinite list)
        *Main> enumFrom Green
        [Green,Blue,Violet]
        *Main> enumFrom False
        [False,True]
        *Main> enumFrom 4 = 5
        *Main> enumFrom 4
        5
        *Main> take 10 (enumFrom 1)
        [1,2,3,4,5,6,7,8,9,10]
        *Main> take 10 (enumFrom 10)
        [10,11,12,13,14,15,16,17,18,19]
        *Main> take 10 (enumFrom Yellow)
        [Yellow,Green,Blue,Violet]
        *Main> take 10 (enumFrom 1.2)
        :!cls
        [1.2,2.2,3.2,4.2,5.2,6.2,7.2,8.2,9.2,10.2]
        -}
    -- enumFromThen
        {-
        *Main> enumFromThen Red Green
        [Red,Green]
        *Main> enumFromThen 'a' 'c'
        "acegikmoqsuwy{}\DEL\129..." (infinite list)
        *Main> take 20 (enumFromThen 'a' 'c')
        "acegikmoqsuwy{}\DEL\129\131\133\135"
        *Main> take (-20) (enumFromThen 'a' 'c')
        ""
        enumFromThen Red Orange
        [Red,Orange,Yellow,Green,Blue,Violet]
        enumFromThen Red Red (causes infinite repeat)
        *Main> enumFromThen Red Yellow
        [Red,Yellow,Blue]
        *Main> take 5 (enumFromThen 1.2 1.4)
        [1.2,1.4,1.5999999999999999,
        1.7999999999999998,1.9999999999999998]
        -}

    -- enumFromTo
        {-
        *Main> take 10 (enumFrom 1.2)
        [1.2,2.2,3.2,4.2,5.2,6.2,7.2,8.2,9.2,10.2]
        *Main> take 10 (enumFromTo 1 10)
        [1,2,3,4,5,6,7,8,9,10]
        *Main> take 10 (enumFromTo 1.111 1)
        [1.111]
        *Main> take 10 (enumFromTo 1.111 2)
        [1.111,2.1109999999999998]
        *Main> take 10 (enumFromTo 1.111 2.2)
        [1.111,2.1109999999999998]
        *Main> take 10 (enumFromTo 1.111 3.2)
        [1.111,2.1109999999999998,3.1109999999999998]
        *Main> take 10 (enumFromTo 1.5 3.0)
        [1.5,2.5,3.5]
        *Main> take 10 (enumFromTo 1.5 3.5)
        [1.5,2.5,3.5]
        *Main> take 10 (enumFromTo 1.5 3.6)
        [1.5,2.5,3.5]
        *Main> take 10 (enumFromTo 1.5 3.7)
        [1.5,2.5,3.5]
        *Main> take 10 (enumFromTo 1.5 3.8)
        [1.5,2.5,3.5]
        *Main> take 10 (enumFromTo 1.5 3.9)
        [1.5,2.5,3.5]
        *Main> take 10 (enumFromTo 1.5 4.0)
        [1.5,2.5,3.5,4.5]
        *Main> take 10 (enumFromTo 1.5 3.999)
        [1.5,2.5,3.5]
        *Main> take 10 (enumFromTo Red Red)
        [Red]
        *Main> take 10 (enumFromTo Red Violet)
        [Red,Orange,Yellow,Green,Blue,Violet]
        *Main> take 10 (enumFromTo Violet Red)
        []
        -}
    -- enumFromThenTo
        {-
        *Main> enumFromThenTo 1 10 20
        [1,10,19]
        *Main> enumFromThenTo 1 10 60
        [1,10,19,28,37,46,55]
        *Main> enumFromThenTo 20 10 60
        []
        *Main> enumFromThenTo 1 10 15
        [1,10]
        *Main> enumFromThenTo 1 10 2
        [1]
        *Main> enumFromThenTo 1 10 8
        [1]
        *Main> enumFromThenTo 1 10 -4
        *Main> enumFromThenTo Red Yellow Violet
        [Red,Yellow,Blue]
        *Main> enumFromThenTo .4 1.2 6.2 (error doesnt work with Floats)
        *Main> take 10 (enumFromThenTo False False True)
        [False,False,False,False,False,False,False,False,False,False]
        *Main> take 10 (enumFromThenTo True True True)
        [True,True,True,True,True,True,True,True,True,True]
        -}
    -- As one of your examples, try  (toEnum 3) :: Color
        -- *Main> (toEnum 3) :: Color
        -- Green

    -- ==
        {-
        *Main> 1 == 1
        True
        *Main> 1 == 2
        False
        *Main> 0 == False (error can't compare Int and Bool)
        *Main> 0 == (1-0)
        *Main> 'a' == 'a'
        True
        *Main> 'a' == 'A' (upper/lower case matters)
        False
        False
        *Main> 0 == (1-1)
        True
        *Main> [1,1,541] == [1,1,1]
        False
        *Main> [1,1,541] == [1,1,541]
        True
        *Main> [1,1,541] == [1,1,541.5]
        False
        *Main> Red == Red
        True
        *Main> Red == Redish (error Redish is not a Color)
        *Main> Red == Blue
        False
        -}
    -- /=
        {-
        *Main> Green /= Green
        False
        *Main> Green /= Red
        True
        *Main> Green /= 1 (error can't have mismatched types)
        *Main> 1 /= 1.0
        False
        *Main> 1 /= 1.000000000000000000000000000000000000000000001
        False (this should be true technically, so is Haskell inaccurate?)
        *Main> "asd" /= "asd"
        False
        *Main>  ['a','s','d'] /= ['a','s','d']
        False
        -}

    -- quot
        {-
        *Main> quot 12 4
        3
        *Main> quot 12 5
        2
        *Main> quot Blue Yellow (error can't use color type)
        *Main> quot (-2) 1
        -2
        *Main> quot (-2) (-2)
        1
        *Main> quot [1,2,3] [1,2,3] (error, doesn't work with lists)
        *Main> quot (2) (-123) (checking truncation)
        0               (actual answer is -.0162601626)
        *Main> quot 5 0
        *** Exception: divide by zero
        -}
    -- div
        {-
        *Main> div 6 3
        2
        *Main> div 7 3
        2
        *Main> div (-8) 4
        -2
        *Main> div (-8) (-4)
        2
        *Main> div 8 (-4)
        -2
        *Main> div (2) (-123) (checking truncation)
        -1              (actual answer is -.0162601626)
        *Main> div Blue Blue (error, can't use color type)
        -}
        *Main> div 5 0
        *** Exception: divide by zero
    -- rem
        {-
        *Main> rem 7 3
        1
        *Main> rem 70000001 70000000
        1
        *Main> rem (-17) 18
        -17
        *Main> rem (-17) 16
        -1
        *Main> rem (-5) 2
        -1
        *Main> rem (-5) 3
        -2
        *Main> rem (-5) 34
        -5
        *Main> rem (-5) (-5)
        0
        *Main> rem 3 (-1)
        0
        *Main> rem 3 (-2)
        1
        *Main> rem 3 (-4)
        3
        *Main> rem Blue Blue (error, can't use color)
        -}
        *Main> rem 5 0
        *** Exception: divide by zero
    -- mod
        {-
        *Main> mod 2 4
        2
        *Main> mod 2 3
        2
        *Main> mod 2 2
        0
        *Main> mod 2 1
        0
        *Main> mod 2 0
        *** Exception: divide by zero
        *Main> mod 2 3
        2
        *Main> mod 2 1
        0
        *Main>
        *Main> mod 2 (-1)
        0
        *Main> mod 3 (-1)
        0
        *Main> mod 3 (-2)
        -1
        *Main> mod 3 (-3)
        0
        *Main> mod 3 (-4)
        -1
        *Main> mod (-3) (-4)
        -3
        *Main> mod (-3) (-2)
        -1
        *Main> mod (-3) (1)
        0
        *Main> mod (-3) (23)
        20
        *Main> mod (-17) 16
        15
        *Main> mod Blue Blue (error, can't use color)
        -}

    -- quotRem
        {-
        *Main> quotRem 1 10
        (0,1)
        *Main> quotRem 2 2
        (1,0)
        *Main> quotRem 2 1
        (2,0)
        *Main> quotRem 5 4
        (1,1)
        *Main> quotRem (-5) 4
        (-1,-1)
        *Main> quotRem 5 (-3)
        (-1,2)
        *Main> quotRem 1 0
        *** Exception: divide by zero
        *Main> quotRem Blue Blue (error, can't use color)
        -}
    -- divMod
        {-
        *Main> divMod 1 10
        (0,1)
        *Main> divMod 2 2
        (1,0)
        *Main> divMod 2 1
        (2,0)
        *Main> divMod 5 4
        (1,1)
        *Main> divMod (-5) 4
        (-2,3)
        *Main> divMod 5 (-3)
        (-2,-1)
        *Main> divMod 1 0
        *** Exception: divide by zero
        *Main> divMod Blue Blue (error, can't use color)
        -}

    -- &&
        {-
        *Main> True && True
        True
        *Main> True && False
        False
        *Main> False && False
        False
        *Main>  [True, True] && [True, True] (error doesn't work with lists)
        *Main> Green && Green (error can't use Color type)
        -}
    -- ||
        {-
        *Main> True || False
        True
        *Main> False || False
        False
        *Main> True || True
        True
        *Main> False || True
        True
        *Main> False || 1 (error doesn't work with numbers)
        *Main> False || True || True || False || True || True
        True
        *Main> i = True
        *Main> False || i
        True
        *Main> Green || Green (error can't use Color type)
        -}
    FYI I SWITCHED THE PROMPT to λ>
    -- ++
        {-
        λ> 1 ++ 1 (error, must be in a list)
        λ> [1] ++ [1]
        [1,1]
        λ> [1 .. 5] ++ ['A' .. 'E'] (error can't mismatch types)
        λ> ["this lab is"] ++ ["taking"] ++ [" foreeeever."]
        ["this lab is","taking"," foreeeever."]
        λ> ['a','a'] ++ "bb"
        "aabb"
        λ> [Green] ++ [Blue]
        [Green,Blue]
        -}

    -- compare
        {-
        λ> compare 'A' 'E'
        LT
        λ> compare 1 5
        LT
        λ> compare 'A' 1 (error, can't mismatch types)
        λ> compare [1,2,3,4,5,6] [1]
        GT
        λ> compare [1,2,3,4,5,6] [1,2,3,4,5,6]
        EQ
        λ> compare [1] [1,2,3,4,5,6]
        LT
        λ> compare [(-1)] [1,2,3,4,5,6]
        LT
        λ> compare [(-1)] [0]
        LT
        λ> compare (-1) 0
        LT
        λ> compare 1.0000000000 1.0000000001
        LT
        λ> compare False True
        LT
        λ> compare True False
        GT
        λ> compare False True
        LT
        λ> compare True False
        GT
        λ> compare Red Violet
        LT
        λ> compare Violet Red
        GT
        λ> compare LT GT
        LT
        -}

    -- <
        {-
        λ> Green < Violet
        True
        λ> Green < 8 (error can't mismatch types)
        λ> [1,2] < [1,3]
        True
        λ> [1,2] < [1,0]
        False
        λ> [1,2] < [1]
        False
        λ> True < False
        False
        λ> "CSCI" < "Bootcamps"
        False
        λ> (8 < 9) < ('A' < 'B')
        False
        λ> (8 < 9) < ('A' < 'A')
        False
        λ> (8 < 9) < ('B' < 'A')
        False
        λ> (9 < 8) < ('A' < 'B')
        True
        -}
    -- >
        {-
        λ> Green > Violet
        False
        λ> Green > 'A' (error can't mismatch types)
        λ> 100000000000000000000000000000000000 > 20
        True
        λ> 100000000000000000000000000000000000 > (20^1500)
        False
        λ> 1.15156151515000000000000000 > (20^1500)
        False
        -}

    -- max
        {-
        λ> max 1 2
        2
        λ> max [1,2,3,4,5] [2,3,4,5,6]
        [2,3,4,5,6]
        λ> max Red Violet
        Violet
        λ> max 'C' 'D'
        'D'
        -}
    -- min
        {-
        λ> min 1 2
        1
        λ> min [1,2,3,4,5] [2,3,4,5,6]
        [1,2,3,4,5]
        λ> min Red Violet
        Red
        λ> min 'C' 'D'
        'C'
        -}

    -- ^
        {-
        λ> 1^2
        1
        λ> 1^5
        1
        λ> 2^4
        16
        λ> (-2)^4
        16
        λ> (-2)^(-4)
        *** Exception: Negative exponent
        λ> (-2)^(6-4)
        4
        λ> Green^Green (error, can't use color type)
        λ> .25^.25    (error)
        λ> .25^(.25)  (error)
        λ> .25^(2)    (error)
        λ> (.25)^(2)  (error)
        -}

    -- all
        {-
        λ> all (==400) [(1+399),400]
        True
        λ> all (<=10) [1,2,3,4,5,6,7,8,9,10]
        True
        λ> all (<10) [1,2,3,4,5,6,7,8,9,10]
        False
        λ> all (<10) [1,2,3,4,5,6,7,8,9]
        True
        λ> all (<10) [1,2,3,4,5,6,7,8,9,(-9)]
        True
        λ> all (<Yellow) [Red,Orange]
        True
        λ> (all (<3) (take 3[1,2,3,4,5,6]))
        False
        λ> (all (<=3) (take 3[1,2,3,4,5,6]))
        True
        -}
    -- any
        {-
        any (<3) [1,2,3,4,5,6]
        True
        λ> any (<3) (take 3[1,2,3,4,5,6])
        True
        any (<3) (take 3[7,7,7,1,2,3,4,5,6])
        False
        λ> any (==Green) [Blue, Yellow, Blue]
        False
        λ> any (==Yellow) [Blue, Yellow, Blue]
        True
        -}

    -- break
        {-
        λ> break (<5) [1,2,3,4,5,6,7,8,9]
        ([],[1,2,3,4,5,6,7,8,9])
        λ> break (==5) [1,2,3,4,5,6,7,8,9]
        ([1,2,3,4],[5,6,7,8,9])
        λ> break (>5) [1,2,3,4,5,6,7,8,9]
        ([1,2,3,4,5],[6,7,8,9])
        λ> break (<5) [6,7,8,9,5,6,7,8,9]
        ([6,7,8,9,5,6,7,8,9],[])
        λ> break (>5) [6,7,8,9,5,2,6,7,8,9]
        ([6,7,8,9,5],[2,6,7,8,9])
        λ> break (==Blue) [Red, Red, Red, Blue, Violet, Green]
        ([Red,Red,Red],[Blue,Violet,Green])
        λ> break (>Blue) [Red, Red, Red, Blue, Violet, Green]
        ([Red,Red,Red,Blue],[Violet,Green])
        -}

    -- concat
        {-
        λ> concat [[1],[2..8]]
        [1,2,3,4,5,6,7,8]
        λ> concat [[1],[2..8],[9..15]]
        [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
        λ> concat [[],[]]
        []
        concat [[Green,Blue],[Yellow,Violet]]
        [Green,Blue,Yellow,Violet]
    concat [[Green,Blue],[Yellow,Violet],(concat [[Green,Blue],[Yellow,Violet]])]
        [Green,Blue,Yellow,Violet,Green,Blue,Yellow,Violet]
        -}

    -- const
        {-
        λ> a = const 1 0
        λ> b = const 2 0
        λ> c = const 3 0
        λ> a+b+c
        6
        λ> compare [a,b,c] [1,2,3]
        EQ
        λ> a = const Blue 3
        -}

    -- cycle
        {-
        take 25 (cycle [1,2,3,4])
        [1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4,1]
        λ> colors = [Red, Yellow, Violet]
        λ> take 10 (cycle colors)
        [Red,Yellow,Violet,Red,Yellow,Violet,Red,Yellow,Violet,Red]
        -}

    -- drop
        {-
        λ> drop 1 [1,2,3,4,5]
        [2,3,4,5]
        λ> drop 2 [1,2,3,4,5]
        [3,4,5]
        λ> drop 6 [1,2,3,4,5]
        []
        λ> drop (-5) [1,2,3,4,5]
        [1,2,3,4,5]
        λ> drop 1  [Red, Yellow, Violet]
        [Yellow,Violet]
        -}
    -- take
        {-
        λ> take 6 [1,2,3,4,5,6,7,8,9,10]
        [1,2,3,4,5,6]
        λ> take (-3) [1,2,3,4,5,6,7,8,9,10]
        []
        λ> color = [Red,Yellow,Violet,Red,Yellow,Violet,Red,Yellow,Violet,Red]
        λ>take (6) color
        [Red,Yellow,Violet,Red,Yellow,Violet]
        λ> take 0 color
        []
        -}

    -- dropWhile
        {-
        λ> dropWhile (< 5) ten
        [5,6,7,8,9,10]
        λ> ten = [1,2,3,4,5,6,7,8,9,10]
        λ> dropWhile (< 5) ten
        [5,6,7,8,9,10]
        λ> dropWhile (<=5) ten
        [6,7,8,9,10]
        λ> dropWhile (==5) ten
        [1,2,3,4,5,6,7,8,9,10] (shouldn't the 5 be gone?)
        λ> dropWhile (<Blue) colors
        [Violet]
        -}
    -- takeWhile
        {-
        takeWhile (<Blue) colors
        [Red,Yellow]
        λ> takeWhile (>5) ten
        []
        λ> takeWhile (<5) ten
        [1,2,3,4]
        -}

    -- elem
        {-
        λ> colors
        [Red,Yellow,Violet]
        λ> ten
        [1,2,3,4,5,6,7,8,9,10]
        λ> elem Blue colors
        False
        λ> elem Violet colors
        True
        λ> elem 4 ten
        True
        λ> elem 11 ten
        False
        λ> elem (-1) ten
        False
        λ> elem (-1) [1,2,3,4,(-1),5,6,7,8]
        True
        λ> elem "me" "tome" (error this didn't work, needs brackets)
        elem 'm' ['a','m']
        True
        λ> elem "me" ["tome"]
        False
        λ> elem "tome" ["tome"]
        True
        λ> even 4
        True
        λ> even 55
        False
        -}

    -- even
        {-
        λ> even Blue (error, doesn't work with colors)
        λ> even (4-2)
        True
        λ> even (4*2)
        True
        λ> 4/2
        2.0
        λ> even (4/2) (error (4/3) returns a decimal)
        -}

    -- filter
        {-
        λ> ten
        [1,2,3,4,5,6,7,8,9,10]
        λ> filter (<4) ten
        [1,2,3]
        λ> filter (>4) ten
        [5,6,7,8,9,10]
        λ> filter (==5) ten
        [5]
        λ> filter odd ten
        [1,3,5,7,9]
        λ>  colors
        [Red,Yellow,Violet]
        λ> filter (==Blue) colors
        []
        λ> filter (==Red) colors
        [Red]
        -}

    -- fst
        {-
        λ> (Blue, 1)
        (Blue,1)
        λ> truple = (Blue,1)
        λ> truple
        (Blue,1)
        λ> fst truple
        Blue
        λ> fst ([1,2,3],['a','b','c'])
        [1,2,3]
        -}

    -- gcd
        {-
        λ> gcd 10 5
        5
        λ> gcd 15 5
        5
        λ> gcd 30000000000 2
        2
        λ> gcd Blue Yellow (error, doesn't work with colors)

        -}

    -- head
        {-
        λ> ten
        [1,2,3,4,5,6,7,8,9,10]
        λ> color
        [Red,Yellow,Violet,Red,Yellow,Violet,Red,Yellow,Violet,Red]
        λ> head ten
        1
        λ> head color
        Red
        -}

    -- id
        {-
        λ> id ten
        [1,2,3,4,5,6,7,8,9,10]
        λ> id colors
        [Red,Yellow,Violet]
        λ> id 'h'
        'h'
        -}

    -- init
        {-
        λ> ten
        [1,2,3,4,5,6,7,8,9,10]
        λ> init ten
        [1,2,3,4,5,6,7,8,9]
        λ> color
        [Red,Yellow,Violet,Red,Yellow,Violet,Red,Yellow,Violet,Red]
        λ> init color
        [Red,Yellow,Violet,Red,Yellow,Violet,Red,Yellow,Violet]
        -}

    -- iterate
        {-
        λ> take 10 (iterate (10*) 2)
        [2,20,200,2000,20000,200000,2000000,20000000,200000000,2000000000]
        take 10 (iterate (/2) 20)
        [20.0,10.0,5.0,2.5,1.25,0.625,0.3125,0.15625,7.8125e-2,3.90625e-2]
        take 10 (iterate (*2) 2)
        [2,4,8,16,32,64,128,256,512,1024]
        -}

    -- last
        {-
        λ> last colors
        Violet
        λ> last ten
        10
        -}

    -- lcm
        {-
        λ> lcm 27 500
        13500
        λ> lcm 2 10
        10
        λ> lcm Red Orange (errorm can't use colors)
        -}

    -- length
        {-
        λ> colors
        [Red,Yellow,Violet]
        λ> ten
        [1,2,3,4,5,6,7,8,9,10]
        λ> length ten
        10
        λ> length colors
        3
        λ> length "IamAstring"
        10
        -}

    -- map
        {-
        λ> ten
        [1,2,3,4,5,6,7,8,9,10]
        λ> map odd ten
        [True,False,True,False,True,False,True,False,True,False]
        λ> map id colors
        [Red,Yellow,Violet]
        -}

    -- null
        {-
        λ> null []
        True
        λ> null [colors]
        False
        λ> null [Blue]
        False
        λ> null "asd"
        False
        λ> null "    "
        False
        λ> null ""
        True
        -}

    -- odd
        {-
        λ> ten
        [1,2,3,4,5,6,7,8,9,10]
        λ> odd 4
        False
        λ> odd 3
        True
        λ> odd Blue (error, can't use colors)
        -}

    -- repeat
        {-
        take 10 (repeat 12)
        [12,12,12,12,12,12,12,12,12,12]
        λ> take 4 (repeat Blue)
        [Blue,Blue,Blue,Blue]
        -}

    -- replicate
        {-
        λ> replicate 5 Green
        [Green,Green,Green,Green,Green]
        λ> replicate (-3) 3
        []
        λ> replicate 3 3
        [3,3,3]
        λ> replicate 5 "five "
        ["five ","five ","five ","five ","five "]
        λ> replicate 5 [1,2,3,4,5]
        [[1,2,3,4,5],[1,2,3,4,5],[1,2,3,4,5],[1,2,3,4,5],[1,2,3,4,5]]
        λ> replicate 5 take 3 [1,2,3,4,5,6,7,8,9] (error needs brackets)
        replicate 5 (take 3 [1,2,3,4,5,6,7,8,9])
        [[1,2,3],[1,2,3],[1,2,3],[1,2,3],[1,2,3]]
        -}

    -- reverse
        {-
        λ> reverse ten
        [10,9,8,7,6,5,4,3,2,1]
        λ> ten
        [1,2,3,4,5,6,7,8,9,10]
        λ> reverse colors
        [Violet,Blue,Green,Yellow,Orange,Red]
        λ> colors
        [Red,Orange,Yellow,Green,Blue,Violet]
        λ> reverse "I am almost done with this lab"
        "bal siht htiw enod tsomla ma I"
        -}

    -- snd
        {-
        λ> truple
        ('A',"Tuple")
        λ> snd truple
        "Tuple"
        λ> snd (1,9999999999999999999999999999999999)
        9999999999999999999999999999999999
        λ> snd (1,55+3*4/5)
        57.4
        λ> favColors = (Blue,Red)
        λ> snd favColors
        Red
        λ> snd (1,2,3,4) (error, input requires a tuple)
        -}

    -- span
        {-
        λ> span (<5) ten
        ([1,2,3,4],[5,6,7,8,9,10])
        λ> span (>5) ten
        ([],[1,2,3,4,5,6,7,8,9,10])
        λ> span (>=5) ten
        ([],[1,2,3,4,5,6,7,8,9,10])
        λ> span (==5) ten
        ([],[1,2,3,4,5,6,7,8,9,10])
        λ> span (==1) ten
        ([1],[2,3,4,5,6,7,8,9,10])
        λ> span (/=1) ten
        ([],[1,2,3,4,5,6,7,8,9,10])
        λ> span (/=5) ten
        ([1,2,3,4],[5,6,7,8,9,10])
        λ> span (/=Red) colors
        ([],[Red,Orange,Yellow,Green,Blue,Violet])
        λ> span (==Red) colors
        -}

    -- splitAt
        {-
        λ> splitAt 5 ten
        ([1,2,3,4,5],[6,7,8,9,10])
        λ> splitAt (-2) ten
        ([],[1,2,3,4,5,6,7,8,9,10])
        λ> splitAt 2 ten
        ([1,2],[3,4,5,6,7,8,9,10])
        λ> splitAt 10 ten
        ([1,2,3,4,5,6,7,8,9,10],[])
        λ> splitAt 11 ten
        ([1,2,3,4,5,6,7,8,9,10],[])
        λ> splitAt 4 colors
        ([Red,Orange,Yellow,Green],[Blue,Violet])
        -}

    -- zip
        {-
        λ> zip colors ten
        [(Red,1),(Orange,2),(Yellow,3),(Green,4),(Blue,5),(Violet,6)]
        zip (zip ["this lab is"] ["taking"]) [" forever"]
        [(("this lab is","taking")," forever")]
        -}
