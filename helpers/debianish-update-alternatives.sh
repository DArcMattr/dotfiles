#!/usr/bin/env sh

sudo update-alternatives \
  --install /usr/bin/llvm-config       llvm-config      /usr/bin/llvm-config-6.0 200 \
  --slave   /usr/bin/llvm-ar           llvm-ar          /usr/bin/llvm-ar-6.0 \
  --slave   /usr/bin/llvm-as           llvm-as          /usr/bin/llvm-as-6.0 \
  --slave   /usr/bin/llvm-bcanalyzer   llvm-bcanalyzer  /usr/bin/llvm-bcanalyzer-6.0 \
  --slave   /usr/bin/llvm-cov          llvm-cov         /usr/bin/llvm-cov-6.0 \
  --slave   /usr/bin/llvm-diff         llvm-diff        /usr/bin/llvm-diff-6.0 \
  --slave   /usr/bin/llvm-dis          llvm-dis         /usr/bin/llvm-dis-6.0 \
  --slave   /usr/bin/llvm-dwarfdump    llvm-dwarfdump   /usr/bin/llvm-dwarfdump-6.0 \
  --slave   /usr/bin/llvm-extract      llvm-extract     /usr/bin/llvm-extract-6.0 \
  --slave   /usr/bin/llvm-link         llvm-link        /usr/bin/llvm-link-6.0 \
  --slave   /usr/bin/llvm-mc           llvm-mc          /usr/bin/llvm-mc-6.0 \
  --slave   /usr/bin/llvm-mcmarkup     llvm-mcmarkup    /usr/bin/llvm-mcmarkup-6.0 \
  --slave   /usr/bin/llvm-nm           llvm-nm          /usr/bin/llvm-nm-6.0 \
  --slave   /usr/bin/llvm-objdump      llvm-objdump     /usr/bin/llvm-objdump-6.0 \
  --slave   /usr/bin/llvm-ranlib       llvm-ranlib      /usr/bin/llvm-ranlib-6.0 \
  --slave   /usr/bin/llvm-readobj      llvm-readobj     /usr/bin/llvm-readobj-6.0 \
  --slave   /usr/bin/llvm-rtdyld       llvm-rtdyld      /usr/bin/llvm-rtdyld-6.0 \
  --slave   /usr/bin/llvm-size         llvm-size        /usr/bin/llvm-size-6.0 \
  --slave   /usr/bin/llvm-stress       llvm-stress      /usr/bin/llvm-stress-6.0 \
  --slave   /usr/bin/llvm-symbolizer   llvm-symbolizer  /usr/bin/llvm-symbolizer-6.0 \
  --slave   /usr/bin/llvm-tblgen       llvm-tblgen      /usr/bin/llvm-tblgen-6.0

sudo update-alternatives \
  --install /usr/bin/clang             clang             /usr/bin/clang-6.0 50 \
  --slave   /usr/bin/clang++           clang++           /usr/bin/clang++-6.0 \
  --slave   /usr/bin/clang-format      clang-format      /usr/bin/clang-format-6.0 \
  --slave   /usr/bin/clang-format-diff clang-format-diff /usr/bin/clang-format-diff-6.0 \
  --slave   /usr/bin/lldb              lldb              /usr/bin/lldb-6.0 \
  --slave   /usr/bin/lldb-server       lldb-server       /usr/bin/lldb-server-6.0

sudo update-alternatives \
   --install /usr/bin/go  go    /usr/lib/go-1.10/bin/go 50 \
   --slave /usr/bin/gofmt gofmt /usr/lib/go-1.10/bin/gofmt
