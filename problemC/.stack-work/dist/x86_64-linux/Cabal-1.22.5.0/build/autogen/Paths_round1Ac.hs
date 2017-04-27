module Paths_round1Ac (
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

bindir     = "/home/snthibaud/Development/Projects/Google Code Jam/Round 1A/round1Ac/.stack-work/install/x86_64-linux/lts-5.11/7.10.3/bin"
libdir     = "/home/snthibaud/Development/Projects/Google Code Jam/Round 1A/round1Ac/.stack-work/install/x86_64-linux/lts-5.11/7.10.3/lib/x86_64-linux-ghc-7.10.3/round1Ac-0.1.0.0-1K5KIgJeMY0Cr0cbygbyaH"
datadir    = "/home/snthibaud/Development/Projects/Google Code Jam/Round 1A/round1Ac/.stack-work/install/x86_64-linux/lts-5.11/7.10.3/share/x86_64-linux-ghc-7.10.3/round1Ac-0.1.0.0"
libexecdir = "/home/snthibaud/Development/Projects/Google Code Jam/Round 1A/round1Ac/.stack-work/install/x86_64-linux/lts-5.11/7.10.3/libexec"
sysconfdir = "/home/snthibaud/Development/Projects/Google Code Jam/Round 1A/round1Ac/.stack-work/install/x86_64-linux/lts-5.11/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "round1Ac_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "round1Ac_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "round1Ac_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "round1Ac_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "round1Ac_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
