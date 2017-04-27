module Paths_gcj_qualification_round_c (
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

bindir     = "/home/snthibaud/Development/Projects/Google Code Jam/gcj-qualification-round-c/.stack-work/install/x86_64-linux/lts-5.11/7.10.3/bin"
libdir     = "/home/snthibaud/Development/Projects/Google Code Jam/gcj-qualification-round-c/.stack-work/install/x86_64-linux/lts-5.11/7.10.3/lib/x86_64-linux-ghc-7.10.3/gcj-qualification-round-c-0.1.0.0-CNpVupVDhUL3xmmT0zJifn"
datadir    = "/home/snthibaud/Development/Projects/Google Code Jam/gcj-qualification-round-c/.stack-work/install/x86_64-linux/lts-5.11/7.10.3/share/x86_64-linux-ghc-7.10.3/gcj-qualification-round-c-0.1.0.0"
libexecdir = "/home/snthibaud/Development/Projects/Google Code Jam/gcj-qualification-round-c/.stack-work/install/x86_64-linux/lts-5.11/7.10.3/libexec"
sysconfdir = "/home/snthibaud/Development/Projects/Google Code Jam/gcj-qualification-round-c/.stack-work/install/x86_64-linux/lts-5.11/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "gcj_qualification_round_c_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "gcj_qualification_round_c_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "gcj_qualification_round_c_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "gcj_qualification_round_c_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "gcj_qualification_round_c_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
