#!/usr/bin/env sh

sudo update-alternatives --install \
        /usr/bin/llvm-config       llvm-config      /usr/bin/llvm-config-5.0  200 \
--slave /usr/bin/llvm-ar           llvm-ar          /usr/bin/llvm-ar-5.0 \
--slave /usr/bin/llvm-as           llvm-as          /usr/bin/llvm-as-5.0 \
--slave /usr/bin/llvm-bcanalyzer   llvm-bcanalyzer  /usr/bin/llvm-bcanalyzer-5.0 \
--slave /usr/bin/llvm-cov          llvm-cov         /usr/bin/llvm-cov-5.0 \
--slave /usr/bin/llvm-diff         llvm-diff        /usr/bin/llvm-diff-5.0 \
--slave /usr/bin/llvm-dis          llvm-dis         /usr/bin/llvm-dis-5.0 \
--slave /usr/bin/llvm-dwarfdump    llvm-dwarfdump   /usr/bin/llvm-dwarfdump-5.0 \
--slave /usr/bin/llvm-extract      llvm-extract     /usr/bin/llvm-extract-5.0 \
--slave /usr/bin/llvm-link         llvm-link        /usr/bin/llvm-link-5.0 \
--slave /usr/bin/llvm-mc           llvm-mc          /usr/bin/llvm-mc-5.0 \
--slave /usr/bin/llvm-mcmarkup     llvm-mcmarkup    /usr/bin/llvm-mcmarkup-5.0 \
--slave /usr/bin/llvm-nm           llvm-nm          /usr/bin/llvm-nm-5.0 \
--slave /usr/bin/llvm-objdump      llvm-objdump     /usr/bin/llvm-objdump-5.0 \
--slave /usr/bin/llvm-ranlib       llvm-ranlib      /usr/bin/llvm-ranlib-5.0 \
--slave /usr/bin/llvm-readobj      llvm-readobj     /usr/bin/llvm-readobj-5.0 \
--slave /usr/bin/llvm-rtdyld       llvm-rtdyld      /usr/bin/llvm-rtdyld-5.0 \
--slave /usr/bin/llvm-size         llvm-size        /usr/bin/llvm-size-5.0 \
--slave /usr/bin/llvm-stress       llvm-stress      /usr/bin/llvm-stress-5.0 \
--slave /usr/bin/llvm-symbolizer   llvm-symbolizer  /usr/bin/llvm-symbolizer-5.0 \
--slave /usr/bin/llvm-tblgen       llvm-tblgen      /usr/bin/llvm-tblgen-5.0

sudo update-alternatives \
      --install /usr/bin/clang   clang   /usr/bin/clang-5.0     50 \
      --slave   /usr/bin/clang++ clang++ /usr/bin/clang++-5.0  \
      --slave   /usr/bin/lldb    lldb    /usr/bin/lldb-5.0 \
      --slave   /usr/bin/lldb-server lldb-server /usr/bin/lldb-server-5.0
