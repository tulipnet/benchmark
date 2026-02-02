TARGET = thttpd
ORIGINAL_REPO = original

SAFE_TARGET = safe/$(TARGET)
BACKDOORED_TARGET = backdoored/$(TARGET)
GROUND_TRUTH_TARGET = ground-truth/$(TARGET)


all: safe backdoored ground-truth

all-afl: safe-afl backdoored-afl ground-truth-afl

safe: $(SAFE_TARGET)

backdoored: $(BACKDOORED_TARGET)

ground-truth: $(GROUND_TRUTH_TARGET)


$(SAFE_TARGET): $(ORIGINAL_REPO) patches/base.patch
	rm -rf safe/
	cp -r $(ORIGINAL_REPO)/ safe/
	cd safe/ && \
		patch -p1 < ../patches/rosa_thttpd.c.patch && \
		patch -p1 < ../patches/base.patch && \
		./configure && \
		$(MAKE) -j$(shell nproc) thttpd

safe-afl: patches/base.patch
	rm -rf safe/ build/
	cp -r $(ORIGINAL_REPO)/ build/
	mkdir safe/
	cd build/ && \
		patch -p1 < ../patches/rosa_thttpd.c.patch && \
		patch -p1 < ../patches/base.patch && \
		CC=afl-clang-lto ./configure && \
		CC=afl-clang-lto $(MAKE) -j$(shell nproc) thttpd && \
		cp thttpd ../safe/thttpd.lto.afl
	rm -rf build/
	cp -r $(ORIGINAL_REPO)/ build/
	cd build && \
		patch -p1 < ../patches/rosa_thttpd.c.patch && \
		patch -p1 < ../patches/base.patch && \
		AFL_LLVM_CMPLOG=1 CC=afl-clang-lto ./configure && \
		AFL_LLVM_CMPLOG=1 CC=afl-clang-lto $(MAKE) -j$(shell nproc) thttpd && \
		cp thttpd ../safe/thttpd.lto.cmplog
	rm -rf build/
	cp -r $(ORIGINAL_REPO)/ build/
	cd build && \
		patch -p1 < ../patches/rosa_thttpd.c.patch && \
		patch -p1 < ../patches/base.patch && \
		AFL_LLVM_LAF_ALL=1 CC=afl-clang-fast ./configure && \
		AFL_LLVM_LAF_ALL=1 CC=afl-clang-fast $(MAKE) -j$(shell nproc) thttpd && \
		cp thttpd ../safe/thttpd.laf-intel.afl
	rm -rf build/
	cp -r $(ORIGINAL_REPO)/ build/
	cd build && \
		patch -p1 < ../patches/rosa_thttpd.c.patch && \
		patch -p1 < ../patches/base.patch && \
		./configure && \
		$(MAKE) -j$(shell nproc) thttpd && \
		cp thttpd ../safe/thttpd.ori

$(BACKDOORED_TARGET): $(ORIGINAL_REPO) patches/base.patch patches/backdoored.patch
	rm -rf backdoored/
	cp -r $(ORIGINAL_REPO)/ backdoored/
	cd backdoored/ && \
		patch -p1 < ../patches/rosa_thttpd.c.patch && \
		patch -p1 < ../patches/base.patch && \
		patch -p1 < ../patches/backdoored.patch && \
		./configure && \
		$(MAKE) -j$(shell nproc) thttpd

backdoored-afl: patches/base.patch patches/backdoored.patch
	rm -rf backdoored/ build/
	cp -r $(ORIGINAL_REPO)/ build/
	mkdir backdoored/
	cd build/ && \
		patch -p1 < ../patches/rosa_thttpd.c.patch && \
		patch -p1 < ../patches/base.patch && \
		patch -p1 < ../patches/backdoored.patch && \
		CC=afl-clang-lto ./configure && \
		CC=afl-clang-lto $(MAKE) -j$(shell nproc) thttpd && \
		cp thttpd ../backdoored/thttpd.lto.afl
	rm -rf build/
	cp -r $(ORIGINAL_REPO)/ build/
	cd build && \
		patch -p1 < ../patches/rosa_thttpd.c.patch && \
		patch -p1 < ../patches/base.patch && \
		patch -p1 < ../patches/backdoored.patch && \
		AFL_LLVM_CMPLOG=1 CC=afl-clang-lto ./configure && \
		AFL_LLVM_CMPLOG=1 CC=afl-clang-lto $(MAKE) -j$(shell nproc) thttpd && \
		cp thttpd ../backdoored/thttpd.lto.cmplog
	rm -rf build/
	cp -r $(ORIGINAL_REPO)/ build/
	cd build && \
		patch -p1 < ../patches/rosa_thttpd.c.patch && \
		patch -p1 < ../patches/base.patch && \
		patch -p1 < ../patches/backdoored.patch && \
		AFL_LLVM_LAF_ALL=1 CC=afl-clang-fast ./configure && \
		AFL_LLVM_LAF_ALL=1 CC=afl-clang-fast $(MAKE) -j$(shell nproc) thttpd && \
		cp thttpd ../backdoored/thttpd.laf-intel.afl
	rm -rf build/
	cp -r $(ORIGINAL_REPO)/ build/
	cd build && \
		patch -p1 < ../patches/rosa_thttpd.c.patch && \
		patch -p1 < ../patches/base.patch && \
		patch -p1 < ../patches/backdoored.patch && \
		./configure && \
		$(MAKE) -j$(shell nproc) thttpd && \
		cp thttpd ../backdoored/thttpd.ori

$(GROUND_TRUTH_TARGET): $(ORIGINAL_REPO) patches/base.patch patches/ground-truth.patch
	rm -rf ground-truth/
	cp -r $(ORIGINAL_REPO)/ ground-truth/
	cd ground-truth/ && \
		patch -p1 < ../patches/rosa_thttpd.c.patch && \
		patch -p1 < ../patches/base.patch && \
		patch -p1 < ../patches/ground-truth.patch && \
		./configure && \
		$(MAKE) -j$(shell nproc) thttpd

ground-truth-afl: patches/base.patch patches/ground-truth.patch
	rm -rf ground-truth/ build/
	cp -r $(ORIGINAL_REPO)/ build/
	mkdir ground-truth/
	cd build/ && \
		patch -p1 < ../patches/rosa_thttpd.c.patch && \
		patch -p1 < ../patches/base.patch && \
		patch -p1 < ../patches/ground-truth.patch && \
		CC=afl-clang-lto ./configure && \
		CC=afl-clang-lto $(MAKE) -j$(shell nproc) thttpd && \
		cp thttpd ../ground-truth/thttpd.lto.afl
	rm -rf build/
	cp -r $(ORIGINAL_REPO)/ build/
	cd build && \
		patch -p1 < ../patches/rosa_thttpd.c.patch && \
		patch -p1 < ../patches/base.patch && \
		patch -p1 < ../patches/ground-truth.patch && \
		AFL_LLVM_CMPLOG=1 CC=afl-clang-lto ./configure && \
		AFL_LLVM_CMPLOG=1 CC=afl-clang-lto $(MAKE) -j$(shell nproc) thttpd && \
		cp thttpd ../ground-truth/thttpd.lto.cmplog
	rm -rf build/
	cp -r $(ORIGINAL_REPO)/ build/
	cd build && \
		patch -p1 < ../patches/rosa_thttpd.c.patch && \
		patch -p1 < ../patches/base.patch && \
		patch -p1 < ../patches/ground-truth.patch && \
		AFL_LLVM_LAF_ALL=1 CC=afl-clang-fast ./configure && \
		AFL_LLVM_LAF_ALL=1 CC=afl-clang-fast $(MAKE) -j$(shell nproc) thttpd && \
		cp thttpd ../ground-truth/thttpd.laf-intel.afl
	rm -rf build/
	cp -r $(ORIGINAL_REPO)/ build/
	cd build && \
		patch -p1 < ../patches/rosa_thttpd.c.patch && \
		patch -p1 < ../patches/base.patch && \
		patch -p1 < ../patches/ground-truth.patch && \
		./configure && \
		$(MAKE) -j$(shell nproc) thttpd && \
		cp thttpd ../ground-truth/thttpd.ori

clean:
	rm -rf safe/ backdoored/ ground-truth/ build/

setup:
#   No-op.

teardown:
#   No-op.


.PHONY: clean all all-afl safe safe-afl backdoored backdoored-afl ground-truth ground-truth-afl setup teardown
