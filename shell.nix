let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11";
  pkgs = import nixpkgs { config = {}; overlays = []; };
  frameworks = pkgs.darwin.apple_sdk.frameworks;
  llvm = pkgs.llvmPackages_latest;
  os =
    if pkgs.stdenv.hostPlatform.isLinux then
      "linux"
    else if pkgs.stdenv.hostPlatform.isDarwin then
      "darwin"
    else
      throw "unsupported os";
  platformPackages = with pkgs; {
    darwin = [
      pkgs.darwin.xcode_14_1
      # For iOS development.
      ruby
      cocoapods
    ];
  }.${os} or [ ];
in

pkgs.mkShell {
#  buildInputs = platformPackages ++ [
    buildInputs = [
    pkgs.git
#    pkgs.gcc
    pkgs.cmake
    pkgs.python311
#    pkgs.darwin.xcode_14_1
#    pkgs.libcxx
#    llvm.libstdcxxClang
#    llvm.libllvm
#    llvm.libcxx
#    pkgs.clang-tools
    frameworks.Accelerate
    frameworks.AppKit
    frameworks.AudioToolbox
    frameworks.Cocoa
    frameworks.CoreAudio
    frameworks.CoreAudioKit
    frameworks.CoreMIDI
    frameworks.Foundation
    frameworks.IOKit
    frameworks.QuartzCore
    frameworks.WebKit
  ];

  shellHook = ''
#    export CC=${pkgs.gcc}/bin/gcc
#    export CXX=${pkgs.gcc}/bin/g++
#    export CMAKE_C_COMPILER=${pkgs.gcc}/bin/gcc
#    export CMAKE_CXX_COMPILER=${pkgs.gcc}/bin/g++
#    export DYLD_LIBRARY_PATH=$(clang -print-resource-dir)/lib/:$DYLD_LIBRARY_PATH
#    export LD_LIBRARY_PATH=$(clang -print-resource-dir)/lib/:$LD_LIBRARY_PATH
#    export LD=${pkgs.clang}/bin/ld64.lld
#    export LINKXX=${pkgs.clang}/bin/clang++
#    export LINK=${pkgs.clang}/bin/clang
#    export C_INCLUDE_PATH=$(clang -print-resource-dir)/include/
#    export CPLUS_INCLUDE_PATH=$(clang -print-resource-dir)/include/
#    export CUSTOM_CPP_INCLUDE_PATH=${llvm.libcxx}
#    export CUSTOM_CPP_INCLUDE_PATH=$(clang -print-resource-dir)/include/
#    export CC=/Users/ben/dev/llvm/clang+llvm-17.0.1-arm64-apple-darwin22.0/bin/clang
#    export CXX=/Users/ben/dev/llvm/clang+llvm-17.0.1-arm64-apple-darwin22.0/bin/clang++
#    export DYLD_LIBRARY_PATH=/Users/ben/dev/llvm/clang+llvm-17.0.1-arm64-apple-darwin22.0/lib
#    export LD_LIBRARY_PATH=/Users/ben/dev/llvm/clang+llvm-17.0.1-arm64-apple-darwin22.0/lib
#    export LD=/Users/ben/dev/llvm/clang+llvm-17.0.1-arm64-apple-darwin22.0/bin/ld64.lld
#    export LINKXX=/Users/ben/dev/llvm/clang+llvm-17.0.1-arm64-apple-darwin22.0/bin/clang++
#    export LINK=/Users/ben/dev/llvm/clang+llvm-17.0.1-arm64-apple-darwin22.0/bin/clang

  '';  
}


