module Paths_gcj_qualification_round_b (
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

bindir     = "/home/snthibaud/Development/Projects/Google Code Jam/gcj-qualification-round-b/.stack-work/install/x86_64-linux/lts-5.11/7.10.3/bin"
libdir     = "/home/snthibaud/Development/Projects/Google Code Jam/gcj-qualification-round-b/.stack-work/install/x86_64-linux/lts-5.11/7.10.3/lib/x86_64-linux-ghc-7.10.3/gcj-qualification-round-b-0.1.0.0-2w5W1URBEcR4Kc29bJR60m"
datadir    = "/home/snthibaud/Development/Projects/Google Code Jam/gcj-qualification-round-b/.stack-work/install/x86_64-linux/lts-5.11/7.10.3/share/x86_64-linux-ghc-7.10.3/gcj-qualification-round-b-0.1.0.0"
libexecdir = "/home/snthibaud/Development/Projects/Google Code Jam/gcj-qualification-round-b/.stack-work/install/x86_64-linux/lts-5.11/7.10.3/libexec"
sysconfdir = "/home/snthibaud/Development/Projects/Google Code Jam/gcj-qualification-round-b/.stack-work/install/x86_64-linux/lts-5.11/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "gcj_qualification_round_b_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "gcj_qualification_round_b_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "gcj_qualification_round_b_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "gcj_qualification_round_b_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "gcj_qualification_round_b_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
