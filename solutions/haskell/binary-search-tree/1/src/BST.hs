module BST
    ( BST
    , bstLeft
    , bstRight
    , bstValue
    , empty
    , fromList
    , insert
    , singleton
    , toList
    ) where

data BST a = BST {
    left  :: BST a,
    right :: BST a,
    value :: a
  } | Empty
  deriving (Eq, Show)

empty :: BST a
empty = Empty

bstLeft :: BST a -> Maybe (BST a)
bstLeft Empty = Nothing
bstLeft tree = Just $ left tree


bstRight :: BST a -> Maybe (BST a)
bstRight Empty = Nothing
bstRight tree = Just $ right tree


bstValue :: BST a -> Maybe a
bstValue Empty = Nothing
bstValue tree = Just $ value tree


singleton :: a -> BST a
singleton val = BST {left = Empty, right = Empty, value = val}


insert :: (Ord a) => a -> BST a -> BST a
insert val Empty = singleton val
insert val tree = case val <= (value tree) of
    True -> BST {left = insert val (left tree), right = (right tree), value = (value tree)}
    False -> BST {left = left tree, right = insert val (right tree), value = (value tree)}


fromList :: (Ord a) => [a] -> BST a
fromList = foldl (flip insert) Empty

toList :: BST a -> [a]
toList Empty = []
toList BST {left = leftTree, right = rightTree, value = valueTree} = (toList leftTree) ++ [valueTree] ++ (toList rightTree)