ABSOLUTE_PATH=$(shell realpath .)

TARGET = sapi/cli/php
ORIGINAL_REPO = original

SAFE_TARGET = safe/$(TARGET)
BACKDOORED_TARGET = backdoored/$(TARGET)
GROUND_TRUTH_TARGET = ground-truth/$(TARGET)


all: safe backdoored ground-truth

all-afl: safe-afl backdoored-afl ground-truth-afl

safe: $(SAFE_TARGET)

backdoored: $(BACKDOORED_TARGET)

ground-truth: $(GROUND_TRUTH_TARGET)


$(SAFE_TARGET): $(ORIGINAL_REPO) patches/safe.patch
	rm -rf safe/
	cp -r $(ORIGINAL_REPO)/ safe/
	cd safe/ && \
		patch -p1 < ../patches/safe.patch && \
		patch -p1 < ../patches/harness.patch && \
		./buildconf && \
		./configure --with-zlib && \
		$(MAKE) -j$(shell nproc)

safe-afl: patches/safe.patch
	rm -rf safe/
	cp -r $(ORIGINAL_REPO)/ safe/
	cd safe/ && \
		patch -p1 < ../patches/safe.patch && \
		patch -p1 < ../patches/harness.patch && \
		./buildconf && \
		./configure --with-zlib && \
		$(MAKE) -j$(shell nproc) ; \
		cp ./sapi/cli/php ./sapi/cli/php.ori ; \
		$(MAKE) -j$(shell nproc) clean ; \
		CC=afl-clang-fast ./buildconf ; \
		CC=afl-clang-fast ./configure --with-zlib ; \
		AFL_LLVM_DICT2FILE=$(ABSOLUTE_PATH)/backdoored/php.dic CC=afl-clang-fast $(MAKE) -j$(shell nproc) ; \
		cp ./sapi/cli/php ./sapi/cli/php.lto.afl ; \
		$(MAKE) -j$(shell nproc) clean ; \
		AFL_LLVM_CMPLOG=1 CC=afl-clang-fast ./buildconf ; \
		AFL_LLVM_CMPLOG=1 CC=afl-clang-fast ./configure --with-zlib ; \
		AFL_LLVM_CMPLOG=1 CC=afl-clang-fast $(MAKE) -j$(shell nproc) ; \
		cp ./sapi/cli/php ./sapi/cli/php.lto.cmplog ; \
		$(MAKE) -j$(shell nproc) clean ; \
		AFL_LLVM_LAF_ALL=1 CC=afl-clang-fast LD=afl-clang-fast ./buildconf ; \
		AFL_LLVM_LAF_ALL=1 CC=afl-clang-fast LD=afl-clang-fast ./configure --with-zlib ; \
		AFL_LLVM_LAF_ALL=1 CC=afl-clang-fast LD=afl-clang-fast $(MAKE) -j$(shell nproc) ; \
		cp ./sapi/cli/php ./sapi/cli/php.laf-intel.afl

$(BACKDOORED_TARGET): $(ORIGINAL_REPO)
	rm -rf backdoored/
	cp -r $(ORIGINAL_REPO)/ backdoored/
	cd backdoored/ && \
		patch -p1 < ../patches/harness.patch && \
		./buildconf && \
		./configure --with-zlib && \
		$(MAKE) -j$(shell nproc)

backdoored-afl:
	rm -rf backdoored/
	cp -r $(ORIGINAL_REPO)/ backdoored/
	cd backdoored/ && \
		patch -p1 < ../patches/harness.patch && \
		./buildconf && \
		./configure --with-zlib && \
		$(MAKE) -j$(shell nproc) ; \
		cp ./sapi/cli/php ./sapi/cli/php.ori ; \
		$(MAKE) -j$(shell nproc) clean ; \
		CC=afl-clang-fast LD=afl-clang-fast ./buildconf ; \
		CC=afl-clang-fast LD=afl-clang-fast ./configure --with-zlib ; \
		AFL_LLVM_DICT2FILE=$(ABSOLUTE_PATH)/backdoored/php.dic CC=afl-clang-fast LD=afl-clang-fast $(MAKE) -j$(shell nproc) ; \
		cp ./sapi/cli/php ./sapi/cli/php.lto.afl ; \
		$(MAKE) -j$(shell nproc) clean ; \
		AFL_LLVM_CMPLOG=1 CC=afl-clang-fast LD=afl-clang-fast ./buildconf ; \
		AFL_LLVM_CMPLOG=1 CC=afl-clang-fast LD=afl-clang-fast ./configure --with-zlib ; \
		AFL_LLVM_CMPLOG=1 CC=afl-clang-fast LD=afl-clang-fast $(MAKE) -j$(shell nproc) ; \
		cp ./sapi/cli/php ./sapi/cli/php.lto.cmplog ; \
		$(MAKE) -j$(shell nproc) clean ; \
		AFL_LLVM_LAF_ALL=1 CC=afl-clang-fast LD=afl-clang-fast ./buildconf ; \
		AFL_LLVM_LAF_ALL=1 CC=afl-clang-fast LD=afl-clang-fast ./configure --with-zlib ; \
		AFL_LLVM_LAF_ALL=1 CC=afl-clang-fast LD=afl-clang-fast $(MAKE) -j$(shell nproc) ; \
		cp ./sapi/cli/php ./sapi/cli/php.laf-intel.afl

$(GROUND_TRUTH_TARGET): $(ORIGINAL_REPO) patches/ground-truth.patch
	rm -rf ground-truth/
	cp -r $(ORIGINAL_REPO)/ ground-truth/
	cd ground-truth/ && \
		patch -p1 < ../patches/ground-truth.patch && \
		patch -p1 < ../patches/harness.patch && \
		./buildconf && \
		./configure --with-zlib && \
		$(MAKE) -j$(shell nproc)

ground-truth-afl:
	rm -rf ground-truth/
	cp -r $(ORIGINAL_REPO)/ ground-truth/
	cd ground-truth/ && \
		patch -p1 < ../patches/ground-truth.patch && \
		patch -p1 < ../patches/harness.patch && \
		./buildconf && \
		./configure --with-zlib && \
		$(MAKE) -j$(shell nproc) ; \
		cp ./sapi/cli/php ./sapi/cli/php.ori ; \
		$(MAKE) -j$(shell nproc) clean ; \
		CC=afl-clang-fast LD=afl-clang-fast ./buildconf ; \
		CC=afl-clang-fast LD=afl-clang-fast ./configure --with-zlib ; \
		AFL_LLVM_DICT2FILE=$(ABSOLUTE_PATH)/backdoored/php.dic CC=afl-clang-fast LD=afl-clang-fast $(MAKE) -j$(shell nproc) ; \
		cp ./sapi/cli/php ./sapi/cli/php.lto.afl ; \
		$(MAKE) -j$(shell nproc) clean ; \
		AFL_LLVM_CMPLOG=1 CC=afl-clang-fast LD=afl-clang-fast ./buildconf ; \
		AFL_LLVM_CMPLOG=1 CC=afl-clang-fast LD=afl-clang-fast ./configure --with-zlib ; \
		AFL_LLVM_CMPLOG=1 CC=afl-clang-fast LD=afl-clang-fast $(MAKE) -j$(shell nproc) ; \
		cp ./sapi/cli/php ./sapi/cli/php.lto.cmplog ; \
		$(MAKE) -j$(shell nproc) clean ; \
		AFL_LLVM_LAF_ALL=1 CC=afl-clang-fast LD=afl-clang-fast ./buildconf ; \
		AFL_LLVM_LAF_ALL=1 CC=afl-clang-fast LD=afl-clang-fast ./configure --with-zlib ; \
		AFL_LLVM_LAF_ALL=1 CC=afl-clang-fast LD=afl-clang-fast $(MAKE) -j$(shell nproc) ; \
		cp ./sapi/cli/php ./sapi/cli/php.laf-intel.afl

clean:
	rm -rf safe/ backdoored/ ground-truth/

setup:
#   No-op.

teardown:
#   No-op.


.PHONY: clean all safe safe-afl backdoored backdoored-afl ground-truth ground-truth-afl setup teardown
