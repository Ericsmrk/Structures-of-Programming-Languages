-- CSci 117, Lab 2:  Functional techniques, iterators/accumulators,
-- and higher-order functions
-- Eric Smrkovsky
-- Lab @ 10 Room 205

---- Part 1: Basic structural recursion ----------------

-- 1. Merge sort--no

-- Deal a list into two (almost) equal-sizes lists by alternating elements
-- For example, deal [1,2,3,4,5,6,7] = ([1,3,5,7], [2,4,6])
deal :: [a] -> ([a],[a])
deal []        = ([],[])
deal [x]       = ([x],[])
deal (x:y:xys) = (x:xs, y:ys) where
     (xs, ys)  = deal xys

-- Now implement merge and mergesort from class, and test with some
-- scrambled lists to make sure your code is correct

merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)
    | x <= y    = x : merge xs (y:ys)
    | otherwise = y : merge (x:xs) ys

ms :: Ord a => [a] -> [a]
ms [] = []
ms [x] = [x]
ms xs = let (as,bs) = deal xs
        in merge (ms as) (ms bs)


-- 2. A backward list data structure

-- Back Lists: Lists where elements are added to the back ("snoc" == rev "cons")
-- For example, the list [1,2,3] is represented as Snoc (Snoc (Snoc Nil 1) 2) 3
data BList a = Nil | Snoc (BList a) a deriving Show

-- Add an element to the beginning of a BList, like (:) does
cons :: a -> BList a -> BList a
cons x Nil        = Snoc Nil x
cons x (Snoc l n) = Snoc (cons n l) x

-- Convert a usual list into a BList (hint: use cons)
toBList :: [a] -> BList a
toBList []  = Nil
toBList [x] = cons x (toBList [])
toBList xs = cons (last xs) (toBList (init xs))

-- Add an element to the end of a usual list
snoc :: [a] -> a -> [a]
snoc [] n = [n]
snoc (x:xs) n = x : snoc xs n

-- Convert a BList into a usual list (hint: use snoc)
fromBList :: BList a -> [a]
fromBList Nil = []
fromBList (Snoc list x) = (snoc (fromBList list) x)


-- 3. A tree data structure
data Tree a = Empty | Node a (Tree a) (Tree a) deriving Show

-- Count number of Empty's in the tree
num_empties :: Tree a -> Int
num_empties Empty = 1
num_empties (Node _ l r) = (num_empties l) + (num_empties r)

-- Count number of Node's in the tree
num_nodes :: Tree a -> Int
num_nodes Empty = 0
num_nodes (Node _ l r) = 1 + (num_nodes l) + (num_nodes r)

-- Insert a new node in the leftmost spot in the tree
insert_left :: a -> Tree a -> Tree a
insert_left x Empty = Node x Empty Empty
insert_left x (Node n l r) = Node n (insert_left x l) r

-- Insert a new node in the rightmost spot in the tree
insert_right :: a -> Tree a -> Tree a
insert_right x Empty = Node x Empty Empty
insert_right x (Node n l r) = Node n l (insert_right x r)

-- Add up all the node values in a tree of numbers
sum_nodes :: Num a => Tree a -> a
sum_nodes Empty = 0
sum_nodes (Node n l r) = n + sum_nodes l + sum_nodes r

-- Produce a list of the node values in the tree via an inorder traversal
-- Feel free to use concatenation (++)
inorder :: Tree a -> [a]
inorder Empty = []
inorder (Node n l r) = inorder l ++ [n] ++ inorder r

-- 4. A different tree data structure
data Tree2 a = Leaf a | Node2 a (Tree2 a) (Tree2 a) deriving Show

-- Count the number of elements in the tree (leaf or node)
num_elts :: Tree2 a -> Int
num_elts (Leaf _) = 1
num_elts (Node2 _ l r) = 1 + num_elts l + num_elts r

-- Add up all the elements in a tree of numbers
sum_nodes2 :: Num a => Tree2 a -> a
sum_nodes2 (Leaf n) = n
sum_nodes2 (Node2 n l r) = n + sum_nodes2 l + sum_nodes2 r

-- Produce a list of the elements in the tree via an inorder traversal
-- Again, feel free to use concatenation (++)
inorder2 :: Tree2 a -> [a]
inorder2 (Leaf n) = [n]
inorder2 (Node2 n l r) = inorder2 l ++ [n] ++ inorder2 r

-- Convert a Tree2 into an equivalent Tree1 (with the same elements)
conv21 :: Tree2 a -> Tree a
conv21 (Leaf n) = (Node n Empty Empty)
conv21 (Node2 x l r) = Node x (conv21 l) (conv21 r)


---- Part 2: Iteration and Accumulators ----------------


-- Both toBList and fromBList from Part 1 Problem 2 are O(n^2) operations.
-- Reimplement them using iterative helper functions with accumulators
-- to make them O(n)
toBList' :: [a] -> BList a
toBList' xs = toBL xs Nil where
    toBL :: [a] -> BList a -> BList a
    toBL [] a = a
    toBL (x:xs) a = toBL xs (Snoc a x)

fromBList' :: BList a -> [a]
fromBList' xs = fromBL xs [] where
    fromBL :: BList a -> [a] -> [a]
    fromBL Nil a = a
    fromBL (Snoc list x) a = fromBL list (x:a)


-- Even tree functions that do multiple recursive calls can be rewritten
-- iteratively using lists of trees and an accumulator. For example,
sum_nodes' :: Num a => Tree a -> a
sum_nodes' t = sum_nodes_it [t] 0 where
  sum_nodes_it :: Num a => [Tree a] -> a -> a
  sum_nodes_it [] a = a
  sum_nodes_it (Empty:ts) a = sum_nodes_it ts a
  sum_nodes_it (Node n t1 t2:ts) a = sum_nodes_it (t1:t2:ts) (n+a)

-- Use the same technique to convert num_empties, num_nodes, and sum_nodes2
-- into iterative functions with accumulators
atree = (Node 3 (Node 2 (Node 1 Empty Empty) (Node 4 Empty Empty)) (Node 5 Empty Empty))
bigTree = (Node 5 atree atree)
at2 = (Node2 1 ((Node2 1 (Leaf 2) (Leaf 3))) ((Node2 4 (Leaf 5) (Leaf 6))))

num_empties' :: Tree a -> Int
num_empties' t = num_empties_it [t] 0 where
    num_empties_it :: [Tree a] -> Int -> Int
    num_empties_it [] a = a
    num_empties_it (Empty:ts) a = num_empties_it ts (a+1)
    num_empties_it (Node n l r:ts) a = num_empties_it (l:r:ts) a

num_nodes' :: Tree a -> Int
num_nodes' t = num_nodes_it [t] 0 where
    num_nodes_it :: [Tree a] -> Int -> Int
    num_nodes_it [] a = a
    num_nodes_it (Empty:ts) a = num_nodes_it ts (a)
    num_nodes_it (Node n l r:ts) a = num_nodes_it (l:r:ts) (a+1)

sum_nodes2' :: Num a => Tree2 a -> a
sum_nodes2' t2 = sum_nodes2_it [t2] 0 where
    sum_nodes2_it :: Num a => [Tree2 a] -> a -> a
    sum_nodes2_it [] a = a
    sum_nodes2_it ((Leaf n):t2s) a = sum_nodes2_it t2s (n+a)
    sum_nodes2_it (Node2 n l r:t2s) a = sum_nodes2_it (l:r:t2s) (n+a)

-- Use the technique once more to rewrite inorder2 so it avoids doing any
-- concatenations, using only (:).
-- Hint 1: (:) produces lists from back to front, so you should do the same.
-- Hint 2: You may need to get creative with your lists of trees to get the
-- right output.

inorder2' :: Tree2 a -> [a]
inorder2' t2 = inorder2_it [t2] [] where
    inorder2_it :: [Tree2 a] -> [a] -> [a]
    inorder2_it [] a = a
    inorder2_it (Leaf n:t2s) a = inorder2_it t2s (n:a)
    inorder2_it (Node2 n l r:t2s) a = inorder2_it (r:Leaf n:l:t2s) a



---- Part 3: Higher-order functions ----------------no prolog-----------

-- The functions map, all, any, filter, dropWhile, takeWhile, and break
-- from the Prelude are all higher-order functions. Reimplement them here
-- as list recursions. break should process each element of the list at
-- most once. All functions should produce the same output as the originals

my_map :: (a -> b) -> [a] -> [b]
my_map _ []     = []
my_map f (x:xs) = f x : my_map f xs

my_all :: (a -> Bool) -> [a] -> Bool
my_all _ [] = True
my_all f (x:xs) = f x && my_all f xs

my_any :: (a -> Bool) -> [a] -> Bool
my_any _ [] = False
my_any f (x:xs) = f x || my_any f xs

my_filter :: (a -> Bool) -> [a] -> [a]
my_filter _ [] = []
my_filter f (x:xs)
      | f x       = x : my_filter f xs
      | otherwise = my_filter f xs

my_dropWhile :: (a -> Bool) -> [a] -> [a]
my_dropWhile _ [] = []
my_dropWhile f (x:xs)
      | f x       = my_dropWhile f xs
      | otherwise = (x:xs)

my_takeWhile :: (a -> Bool) -> [a] -> [a]
my_takeWhile _ [] = []
my_takeWhile f (x:xs)
      | f x       = x : my_takeWhile f xs
      | otherwise = []

my_break :: (a -> Bool) -> [a] -> ([a], [a])
my_break _ [] = ([],[])
my_break f (x:xs)
      | f x       = ([],(x:xs))
      | otherwise = let (ys,zs) = my_break f (xs)
                    in  (x:ys, zs)



-- Implement the Prelude functions and, or, concat using foldr

my_and :: [Bool] -> Bool
my_and xs = foldr (&&) True xs

my_or :: [Bool] -> Bool
my_or xs = foldr (||) False xs

my_concat :: [[a]] -> [a]
my_concat xs = foldr (++) [] xs

-- Implement the Prelude functions sum, product, reverse using foldl

my_sum :: Num a => [a] -> a
my_sum = foldl (+) 0

my_product :: Num a => [a] -> a
my_product = foldl (*) 1

my_reverse :: [a] -> [a]
my_reverse = foldl (\acc x -> x:acc) []



---- Part 4: Extra Credit ----------------

-- Convert a Tree into an equivalent Tree2, IF POSSIBLE. That is, given t1,
-- return t2 such that conv21 t2 = t1, if it exists. (In math, this is called
-- the "inverse image" of the function conv21.)  Thus, if conv21 t2 = t1, then
-- it should be that conv 12 t1 = Just t2. If there does not exist such a t2,
-- then conv12 t1 = Nothing. Do some examples on paper first so you can get a
-- sense of when this conversion is possible.

conv12 :: Tree a -> Maybe (Tree2 a)
conv12 Empty = Nothing
conv12 (Node n Empty Empty) = Just (Leaf n)
conv12 (Node n l r) =
        let left = (conv12 l)
            right = (conv12 r)
        in case (left, right) of
                (Just t1, Just t2) -> Just (Node2 n t1 t2)
                _ -> Nothing



-- Binary Search Trees. Determine, by making only ONE PASS through a tree,
-- whether or not it's a Binary Search Tree, which means that for every
-- Node a t1 t2 in the tree, every element in t1 is strictly less than a and
-- every element in t2 is strictly greater than a. Complete this for both
-- Tree a and Tree2 a.

-- Hint: use a helper function that keeps track of the range of allowable
-- element values as you descend through the tree. For this, use the following
-- extended integers, which add negative and positive infinities to Int:
t = (Node 8 (Node 3 Empty Empty) (Node 6 Empty Empty))
t2 = (Node 8 (Node 1 Empty Empty) Empty)
t3 = (Node 1 Empty Empty)
data ExtInt = NegInf | Fin Int | PosInf deriving Eq

instance Show ExtInt where
  show NegInf     = "-oo"
  show (Fin n) = show n
  show PosInf     = "+oo"

instance Ord ExtInt where
  compare NegInf  NegInf  = EQ
  compare NegInf  n       = LT
  compare (Fin n) (Fin m) = compare n m
  compare (Fin n) PosInf  = LT
  compare PosInf  PosInf  = EQ
  compare _       _       = GT
  -- Note: defining compare automatically defines <, <=, >, >=, ==, /=

help :: ExtInt -> ExtInt -> Tree Int -> Bool
help _ _ Empty = True
help x y (Node n l r ) = if (((Fin n) <= x) || ((Fin n) >= y))
                         then False
                         else (help x (Fin n) l) && (help (Fin n) y r)

bst :: Tree Int -> Bool
bst Empty = False
bst (Node n l r) = help NegInf PosInf (Node n l r)


--bst2 :: Tree2 Int -> Bool
--bst2 Leaf n = False
--bst2 (Node2 n l r) = True
