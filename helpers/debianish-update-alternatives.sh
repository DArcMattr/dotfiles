#!/usr/bin/env sh

sudo update-alternatives \
  --install /usr/bin/llvm-config       llvm-config      /usr/bin/llvm-config-10 200 \
  --slave   /usr/bin/llvm-ar           llvm-ar          /usr/bin/llvm-ar-10 \
  --slave   /usr/bin/llvm-as           llvm-as          /usr/bin/llvm-as-10 \
  --slave   /usr/bin/llvm-bcanalyzer   llvm-bcanalyzer  /usr/bin/llvm-bcanalyzer-10 \
  --slave   /usr/bin/llvm-cov          llvm-cov         /usr/bin/llvm-cov-10 \
  --slave   /usr/bin/llvm-diff         llvm-diff        /usr/bin/llvm-diff-10 \
  --slave   /usr/bin/llvm-dis          llvm-dis         /usr/bin/llvm-dis-10 \
  --slave   /usr/bin/llvm-dwarfdump    llvm-dwarfdump   /usr/bin/llvm-dwarfdump-10 \
  --slave   /usr/bin/llvm-extract      llvm-extract     /usr/bin/llvm-extract-10 \
  --slave   /usr/bin/llvm-link         llvm-link        /usr/bin/llvm-link-10 \
  --slave   /usr/bin/llvm-mc           llvm-mc          /usr/bin/llvm-mc-10 \
  --slave   /usr/bin/llvm-nm           llvm-nm          /usr/bin/llvm-nm-10 \
  --slave   /usr/bin/llvm-objdump      llvm-objdump     /usr/bin/llvm-objdump-10 \
  --slave   /usr/bin/llvm-ranlib       llvm-ranlib      /usr/bin/llvm-ranlib-10 \
  --slave   /usr/bin/llvm-readobj      llvm-readobj     /usr/bin/llvm-readobj-10 \
  --slave   /usr/bin/llvm-rtdyld       llvm-rtdyld      /usr/bin/llvm-rtdyld-10 \
  --slave   /usr/bin/llvm-size         llvm-size        /usr/bin/llvm-size-10 \
  --slave   /usr/bin/llvm-stress       llvm-stress      /usr/bin/llvm-stress-10 \
  --slave   /usr/bin/llvm-symbolizer   llvm-symbolizer  /usr/bin/llvm-symbolizer-10 \
  --slave   /usr/bin/llvm-tblgen       llvm-tblgen      /usr/bin/llvm-tblgen-10

sudo update-alternatives \
  --install /usr/bin/clang                    clang                    /usr/bin/clang-10 50 \
  --slave   /usr/bin/clang++                  clang++                  /usr/bin/clang++-10 \
  --slave   /usr/bin/clangd                   clangd                   /usr/bin/clangd-10 \
  --slave   /usr/bin/clang-cl                 clang-cl                 /usr/bin/clang-cl-10 \
  --slave   /usr/bin/clang-query              clang-query              /usr/bin/clang-query-10 \
  --slave   /usr/bin/clang-check              clang-check              /usr/bin/clang-check-10 \
  --slave   /usr/bin/clang-include-fixer      clang-include-fixer      /usr/bin/clang-include-fixer-10 \
  --slave   /usr/bin/clang-offload-bundler    clang-offload-bundler    /usr/bin/clang-offload-bundler-10 \
  --slave   /usr/bin/clang-refactor           clang-refactor           /usr/bin/clang-refactor-10 \
  --slave   /usr/bin/clang-import-test        clang-import-test        /usr/bin/clang-import-test-10 \
  --slave   /usr/bin/clang-apply-replacements clang-apply-replacements /usr/bin/clang-apply-replacements-10 \
  --slave   /usr/bin/clang-change-namespace   clang-change-namespace   /usr/bin/clang-change-namespace-10 \
  --slave   /usr/bin/clang-format             clang-format             /usr/bin/clang-format-10 \
  --slave   /usr/bin/clang-format-diff        clang-format-diff        /usr/bin/clang-format-diff-10 \
  --slave   /usr/bin/lldb                     lldb                     /usr/bin/lldb-10 \
  --slave   /usr/bin/lldb-server              lldb-server              /usr/bin/lldb-server-10
