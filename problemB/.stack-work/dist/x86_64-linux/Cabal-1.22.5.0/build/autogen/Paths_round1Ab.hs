module Paths_round1Ab (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/snthibaud/Development/Projects/Google Code Jam/Round 1A/round1Ab/.stack-work/install/x86_64-linux/lts-5.11/7.10.3/bin"
libdir     = "/home/snthibaud/Development/Projects/Google Code Jam/Round 1A/round1Ab/.stack-work/install/x86_64-linux/lts-5.11/7.10.3/lib/x86_64-linux-ghc-7.10.3/round1Ab-0.1.0.0-7TkNpwKnAtq2PIXwnFF36O"
datadir    = "/home/snthibaud/Development/Projects/Google Code Jam/Round 1A/round1Ab/.stack-work/install/x86_64-linux/lts-5.11/7.10.3/share/x86_64-linux-ghc-7.10.3/round1Ab-0.1.0.0"
libexecdir = "/home/snthibaud/Development/Projects/Google Code Jam/Round 1A/round1Ab/.stack-work/install/x86_64-linux/lts-5.11/7.10.3/libexec"
sysconfdir = "/home/snthibaud/Development/Projects/Google Code Jam/Round 1A/round1Ab/.stack-work/install/x86_64-linux/lts-5.11/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "round1Ab_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "round1Ab_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "round1Ab_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "round1Ab_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "round1Ab_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
