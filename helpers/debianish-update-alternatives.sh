#!/usr/bin/env sh

sudo update-alternatives \
  --install /usr/bin/llvm-config       llvm-config      /usr/bin/llvm-config-15 200 \
  --slave   /usr/bin/llvm-ar           llvm-ar          /usr/bin/llvm-ar-15 \
  --slave   /usr/bin/llvm-as           llvm-as          /usr/bin/llvm-as-15 \
  --slave   /usr/bin/llvm-bcanalyzer   llvm-bcanalyzer  /usr/bin/llvm-bcanalyzer-15 \
  --slave   /usr/bin/llvm-cov          llvm-cov         /usr/bin/llvm-cov-15 \
  --slave   /usr/bin/llvm-diff         llvm-diff        /usr/bin/llvm-diff-15 \
  --slave   /usr/bin/llvm-dis          llvm-dis         /usr/bin/llvm-dis-15 \
  --slave   /usr/bin/llvm-dwarfdump    llvm-dwarfdump   /usr/bin/llvm-dwarfdump-15 \
  --slave   /usr/bin/llvm-extract      llvm-extract     /usr/bin/llvm-extract-15 \
  --slave   /usr/bin/llvm-link         llvm-link        /usr/bin/llvm-link-15 \
  --slave   /usr/bin/llvm-mc           llvm-mc          /usr/bin/llvm-mc-15 \
  --slave   /usr/bin/llvm-nm           llvm-nm          /usr/bin/llvm-nm-15 \
  --slave   /usr/bin/llvm-objdump      llvm-objdump     /usr/bin/llvm-objdump-15 \
  --slave   /usr/bin/llvm-ranlib       llvm-ranlib      /usr/bin/llvm-ranlib-15 \
  --slave   /usr/bin/llvm-readobj      llvm-readobj     /usr/bin/llvm-readobj-15 \
  --slave   /usr/bin/llvm-rtdyld       llvm-rtdyld      /usr/bin/llvm-rtdyld-15 \
  --slave   /usr/bin/llvm-size         llvm-size        /usr/bin/llvm-size-15 \
  --slave   /usr/bin/llvm-stress       llvm-stress      /usr/bin/llvm-stress-15 \
  --slave   /usr/bin/llvm-symbolizer   llvm-symbolizer  /usr/bin/llvm-symbolizer-15 \
  --slave   /usr/bin/llvm-tblgen       llvm-tblgen      /usr/bin/llvm-tblgen-15

sudo update-alternatives \
  --install /usr/bin/clang                    clang                    /usr/bin/clang-15 50 \
  --slave   /usr/bin/clang++                  clang++                  /usr/bin/clang++-15 \
  --slave   /usr/bin/clangd                   clangd                   /usr/bin/clangd-15 \
  --slave   /usr/bin/clang-cl                 clang-cl                 /usr/bin/clang-cl-15 \
  --slave   /usr/bin/clang-query              clang-query              /usr/bin/clang-query-15 \
  --slave   /usr/bin/clang-check              clang-check              /usr/bin/clang-check-15 \
  --slave   /usr/bin/clang-include-fixer      clang-include-fixer      /usr/bin/clang-include-fixer-15 \
  --slave   /usr/bin/clang-offload-bundler    clang-offload-bundler    /usr/bin/clang-offload-bundler-15 \
  --slave   /usr/bin/clang-refactor           clang-refactor           /usr/bin/clang-refactor-15 \
  --slave   /usr/bin/clang-apply-replacements clang-apply-replacements /usr/bin/clang-apply-replacements-15 \
  --slave   /usr/bin/clang-change-namespace   clang-change-namespace   /usr/bin/clang-change-namespace-15 \
  --slave   /usr/bin/clang-format             clang-format             /usr/bin/clang-format-15 \
  --slave   /usr/bin/clang-format-diff        clang-format-diff        /usr/bin/clang-format-diff-15 \
  --slave   /usr/bin/lldb                     lldb                     /usr/bin/lldb-15 \
  --slave   /usr/bin/lldb-server              lldb-server              /usr/bin/lldb-server-15

sudo update-alternatives \
	--install /usr/bin/python python /usr/bin/python3 50
