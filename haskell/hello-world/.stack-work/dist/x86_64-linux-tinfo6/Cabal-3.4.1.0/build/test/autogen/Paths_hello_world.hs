{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_hello_world (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,1,0,5] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/archie/exercism/haskell/hello-world/.stack-work/install/x86_64-linux-tinfo6/3f02f6083c8c87b35a96440db02fea8b1e9950cf6bd7c3ba5e7c217e41776f49/9.0.2/bin"
libdir     = "/home/archie/exercism/haskell/hello-world/.stack-work/install/x86_64-linux-tinfo6/3f02f6083c8c87b35a96440db02fea8b1e9950cf6bd7c3ba5e7c217e41776f49/9.0.2/lib/x86_64-linux-ghc-9.0.2/hello-world-1.1.0.5-5dRhGlnEYDl3OS6hoBEm4F-test"
dynlibdir  = "/home/archie/exercism/haskell/hello-world/.stack-work/install/x86_64-linux-tinfo6/3f02f6083c8c87b35a96440db02fea8b1e9950cf6bd7c3ba5e7c217e41776f49/9.0.2/lib/x86_64-linux-ghc-9.0.2"
datadir    = "/home/archie/exercism/haskell/hello-world/.stack-work/install/x86_64-linux-tinfo6/3f02f6083c8c87b35a96440db02fea8b1e9950cf6bd7c3ba5e7c217e41776f49/9.0.2/share/x86_64-linux-ghc-9.0.2/hello-world-1.1.0.5"
libexecdir = "/home/archie/exercism/haskell/hello-world/.stack-work/install/x86_64-linux-tinfo6/3f02f6083c8c87b35a96440db02fea8b1e9950cf6bd7c3ba5e7c217e41776f49/9.0.2/libexec/x86_64-linux-ghc-9.0.2/hello-world-1.1.0.5"
sysconfdir = "/home/archie/exercism/haskell/hello-world/.stack-work/install/x86_64-linux-tinfo6/3f02f6083c8c87b35a96440db02fea8b1e9950cf6bd7c3ba5e7c217e41776f49/9.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hello_world_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hello_world_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "hello_world_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "hello_world_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hello_world_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hello_world_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
