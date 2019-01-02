module Scene where

import Types

cast :: SceneObject -> Ray -> Maybe (Position, Direction)
cast (Triangle triangle) = castTriangle triangle
cast (Sphere sphere) = castSphere sphere

material :: SceneObject -> Material
material (Triangle (MkTriangle _ _ _ m)) = m
material (Sphere (MkSphere _ _ m)) = m

-- import Data.Sequence(Seq, (|>))
-- import Linear
-- 
-- readSceneFromFile :: FilePath -> IO (Either String Scene)
-- readSceneFromFile path = readScene <$> readFile path
-- 
-- readScene :: String -> IO (Either String Scene)
-- readScene text = do
--     map readCommand (lines text)
-- 
-- data ParserState 
--     = PS 
--     { vertices :: Seq Position
--     , colors :: Seq Color
--     , materials :: Seq Material
--     , objects :: Seq SceneObject
--     , lights :: Seq LightSource
--     , camera :: Maybe Camera
--     }
-- 
-- type ParserAction a = ExceptT String (StateT PS IO) a
-- 
-- execCommand :: String -> ParserAction ()
-- execCommand text = do
--     s@ParserState{..} <- get
--     case words text of
--       ("v":x:y:z) -> do
--         let [x', y', z'] = map readMaybe [x, y, z]
--             error = throwError "Can't parse vertex"
--         newVertex <- maybe error pure (V3 <$> x' <*> y' <*> z')
--         lift $ put (s { vertices = vertices |> newVertex })
--       ("c":r:g:b) -> 
--         put (s { colors = colors |> V3 (readMaybe r) (readMaybe g) (readMaybe b) })
--       ("material":s:d:a:r:shine) -> do
--         let specular = colors ?! read s
--             diffuse = colors ?! read d
--             ambient = colors ?! read a
--             reflected = colors ?! read r
--             shininess = read shine
--             newMaterial = Material specular diffuse ambient reflected shininess
--         in put (s { materials = materials |> newMaterial |> 
--       ("sphere":c:r:m) ->
--       ("triangle":a:b:c:m) ->
--       ("light":p:c) ->
--       ("camera":p:d:u) ->
--       _ ->
--   where
--     readCommand' ("v":x:y:z) = 
--     readCommand' ("c":r:g:b) = 
--     readCommand' ("material":s:d:a:r:shine) = 
--     readCommand' ("sphere":c:r:m) = 
--     readCommand' ("triangle":a:b:c:m) = 
--     readCommand' ("light":p:c) = 
--     readCommand' ("camera":p:d:u) = 
--     readCommand' _ = 

-- vertex:      v 0.42 0.42 0.42
-- color:       c 0.42 0.42 0.42
-- material:    material 3 3 3 3 0.42
-- sphere:      sphere 3 0.42 0
-- triangle:    triangle 3 3 3 0
-- light:       light 0 0
-- camera:      camera 3 3 3
