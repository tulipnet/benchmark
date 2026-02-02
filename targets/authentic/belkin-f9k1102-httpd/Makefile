ABSOLUTE_PATH=$(shell realpath .)

TARGET = build/httpd
ORIGINAL_REPO = original

SAFE_TARGET = safe/$(TARGET)
BACKDOORED_TARGET = backdoored/$(TARGET)
GROUND_TRUTH_TARGET = ground-truth/$(TARGET)


all: safe backdoored ground-truth

all-afl: safe-afl backdoored-afl ground-truth-afl

safe: $(SAFE_TARGET)

backdoored: $(BACKDOORED_TARGET)

ground-truth: $(GROUND_TRUTH_TARGET)


$(SAFE_TARGET): $(ORIGINAL_REPO)
	rm -rf safe/
	cp -r $(ORIGINAL_REPO)/ safe/
	mkdir safe/build/
	cd safe/ && \
		patch -p1 < ../patches/rosa_httpd.c.patch
	cd safe/build/ && \
		cmake $(CMAKE_ARGS) .. && \
		$(MAKE) -j$(shell nproc)

safe-afl: $(ORIGINAL_REPO)
	rm -rf safe/
	cp -r $(ORIGINAL_REPO)/ safe/
	cd safe/ && \
		patch -p1 < ../patches/rosa_httpd.c.patch
	mkdir safe/build/
	cd safe/build/ && \
		AFL_LLVM_DICT2FILE=$(ABSOLUTE_PATH)/safe/belkin.raw-dic CC=afl-clang-fast cmake $(CMAKE_ARGS) .. && \
		AFL_LLVM_DICT2FILE=$(ABSOLUTE_PATH)/safe/belkin.raw-dic CC=afl-clang-fast $(MAKE) -j$(shell nproc) && \
		cp httpd ../httpd.lto.afl
	rm -rf safe/build/
	mkdir safe/build/
	cd safe/build/ && \
		AFL_LLVM_DICT2FILE=$(ABSOLUTE_PATH)/safe/belkin.raw-dic AFL_LLVM_CMPLOG=1 CC=afl-clang-fast cmake $(CMAKE_ARGS) .. && \
		AFL_LLVM_DICT2FILE=$(ABSOLUTE_PATH)/safe/belkin.raw-dic AFL_LLVM_CMPLOG=1 CC=afl-clang-fast $(MAKE) -j$(shell nproc) && \
		cp httpd ../httpd.lto.cmplog
	rm -rf safe/build/
	mkdir safe/build/
	cd safe/build/ && \
		AFL_LLVM_LAF_ALL=1 CC=afl-clang-fast cmake $(CMAKE_ARGS) .. && \
		AFL_LLVM_LAF_ALL=1 CC=afl-clang-fast $(MAKE) -j$(shell nproc) && \
		cp httpd ../httpd.laf-intel.afl
	rm -rf safe/build/
	mkdir safe/build/
	cd safe/build/ && \
		cmake $(CMAKE_ARGS) .. && \
		$(MAKE) -j$(shell nproc) && \
		cp httpd ../httpd.ori
	cat $(ABSOLUTE_PATH)/safe/belkin.raw-dic | sort | uniq > $(ABSOLUTE_PATH)/safe/belkin.dic
	bash -c 'cp safe/{httpd.laf-intel.afl,httpd.lto.afl,httpd.lto.cmplog,httpd.ori} safe/build/'

$(BACKDOORED_TARGET): $(ORIGINAL_REPO) patches/backdoored.patch
	rm -rf backdoored/
	cp -r $(ORIGINAL_REPO)/ backdoored/
	mkdir backdoored/build/
	cd backdoored/ && \
		patch -p1 < ../patches/rosa_httpd.c.patch && \
		patch -p1 < ../patches/backdoored.patch
	cd backdoored/build/ && \
		cmake $(CMAKE_ARGS) .. && \
		$(MAKE) -j$(shell nproc)

backdoored-afl: $(ORIGINAL_REPO)
	rm -rf backdoored/
	cp -r $(ORIGINAL_REPO)/ backdoored/
	mkdir backdoored/build/
	cd backdoored/ && \
		patch -p1 < ../patches/rosa_httpd.c.patch && \
		patch -p1 < ../patches/backdoored.patch
	cd backdoored/build/ && \
		AFL_LLVM_DICT2FILE=$(ABSOLUTE_PATH)/backdoored/belkin.raw-dic CC=afl-clang-fast cmake $(CMAKE_ARGS) .. && \
		AFL_LLVM_DICT2FILE=$(ABSOLUTE_PATH)/backdoored/belkin.raw-dic CC=afl-clang-fast $(MAKE) -j$(shell nproc) && \
		cp httpd ../httpd.lto.afl
	rm -rf backdoored/build/
	mkdir backdoored/build/
	cd backdoored/build/ && \
		AFL_LLVM_DICT2FILE=$(ABSOLUTE_PATH)/backdoored/belkin.raw-dic AFL_LLVM_CMPLOG=1 CC=afl-clang-fast cmake $(CMAKE_ARGS) .. && \
		AFL_LLVM_DICT2FILE=$(ABSOLUTE_PATH)/backdoored/belkin.raw-dic AFL_LLVM_CMPLOG=1 CC=afl-clang-fast $(MAKE) -j$(shell nproc) && \
		cp httpd ../httpd.lto.cmplog
	rm -rf backdoored/build/
	mkdir backdoored/build/
	cd backdoored/build/ && \
		AFL_LLVM_LAF_ALL=1 CC=afl-clang-fast cmake $(CMAKE_ARGS) .. && \
		AFL_LLVM_LAF_ALL=1 CC=afl-clang-fast $(MAKE) -j$(shell nproc) && \
		cp httpd ../httpd.laf-intel.afl
	rm -rf backdoored/build/
	mkdir backdoored/build/
	cd backdoored/build/ && \
		cmake $(CMAKE_ARGS) .. && \
		$(MAKE) -j$(shell nproc) && \
		cp httpd ../httpd.ori
	cat $(ABSOLUTE_PATH)/backdoored/belkin.raw-dic | sort | uniq > $(ABSOLUTE_PATH)/backdoored/belkin.dic
	bash -c 'cp backdoored/{httpd.laf-intel.afl,httpd.lto.afl,httpd.lto.cmplog,httpd.ori} backdoored/build/'

$(GROUND_TRUTH_TARGET): $(ORIGINAL_REPO) patches/ground-truth.patch
	rm -rf ground-truth/
	cp -r $(ORIGINAL_REPO)/ ground-truth/
	mkdir ground-truth/build/
	cd ground-truth/ && \
		patch -p1 < ../patches/rosa_httpd.c.patch && \
		patch -p1 < ../patches/ground-truth.patch
	cd ground-truth/build/ && \
		cmake $(CMAKE_ARGS) .. && \
		$(MAKE) -j$(shell nproc)

ground-truth-afl: $(ORIGINAL_REPO)
	rm -rf ground-truth/
	cp -r $(ORIGINAL_REPO)/ ground-truth/
	mkdir ground-truth/build/
	cd ground-truth/ && \
		patch -p1 < ../patches/rosa_httpd.c.patch && \
		patch -p1 < ../patches/ground-truth.patch
	cd ground-truth/build/ && \
		AFL_LLVM_DICT2FILE=$(ABSOLUTE_PATH)/ground-truth/belkin.raw-dic CC=afl-clang-fast cmake $(CMAKE_ARGS) .. && \
		AFL_LLVM_DICT2FILE=$(ABSOLUTE_PATH)/ground-truth/belkin.raw-dic CC=afl-clang-fast $(MAKE) -j$(shell nproc) && \
		cp httpd ../httpd.lto.afl
	rm -rf ground-truth/build/
	mkdir ground-truth/build/
	cd ground-truth/build/ && \
		AFL_LLVM_DICT2FILE=$(ABSOLUTE_PATH)/ground-truth/belkin.raw-dic AFL_LLVM_CMPLOG=1 CC=afl-clang-fast cmake $(CMAKE_ARGS) .. && \
		AFL_LLVM_DICT2FILE=$(ABSOLUTE_PATH)/ground-truth/belkin.raw-dic AFL_LLVM_CMPLOG=1 CC=afl-clang-fast $(MAKE) -j$(shell nproc) && \
		cp httpd ../httpd.lto.cmplog
	rm -rf ground-truth/build/
	mkdir ground-truth/build/
	cd ground-truth/build/ && \
		AFL_LLVM_LAF_ALL=1 CC=afl-clang-fast cmake $(CMAKE_ARGS) .. && \
		AFL_LLVM_LAF_ALL=1 CC=afl-clang-fast $(MAKE) -j$(shell nproc) && \
		cp httpd ../httpd.laf-intel.afl
	rm -rf ground-truth/build/
	mkdir ground-truth/build/
	cd ground-truth/build/ && \
		cmake $(CMAKE_ARGS) .. && \
		$(MAKE) -j$(shell nproc) && \
		cp httpd ../httpd.ori
	cat $(ABSOLUTE_PATH)/ground-truth/belkin.raw-dic | sort | uniq > $(ABSOLUTE_PATH)/ground-truth/belkin.dic
	bash -c 'cp ground-truth/{httpd.laf-intel.afl,httpd.lto.afl,httpd.lto.cmplog,httpd.ori} ground-truth/build/'

clean:
	rm -rf safe/ backdoored/ ground-truth/

setup:
	rm -rf /tmp/www/
	cp -r www/ /tmp/

teardown:
	rm -rf /tmp/www/


.PHONY: clean all all-afl safe safe-afl backdoored backdoored-afl ground-truth ground-truth-afl setup teardown
