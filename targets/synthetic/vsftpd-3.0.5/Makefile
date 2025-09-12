.DEFAULT_GOAL := all

.PHONY: safe safe-afl backdoored backdoored-afl ground-truth ground-truth-afl clean all all-afl

safe:
	mkdir -p ./$@
	tar xvf ./original/vsftpd-3.0.5.tar.gz -C ./$@/
	patch ./$@/vsftpd-3.0.5/main.c ./patches/rosa_main.c.patch
	patch ./$@/vsftpd-3.0.5/vsf_findlibs.sh ./patches/vsf_findlibs.sh.patch
	$(MAKE) -C ./$@/vsftpd-3.0.5
	cp ./$@/vsftpd-3.0.5/vsftpd ./$@/
	cp ./vsftpd.conf ./$@/

safe-afl: safe
	cp ./$</vsftpd-3.0.5/vsftpd ./$</vsftpd.ori
	$(MAKE) -C ./$</vsftpd-3.0.5 clean
	$(MAKE) CC=afl-clang-lto LD=afl-clang-lto -C ./$</vsftpd-3.0.5
	cp ./$</vsftpd-3.0.5/vsftpd ./$</vsftpd.lto.afl
	$(MAKE) -C ./$</vsftpd-3.0.5 clean
	$(MAKE) AFL_LLVM_CMPLOG=1 CC=afl-clang-lto LD=afl-clang-lto -C ./$</vsftpd-3.0.5
	cp ./$</vsftpd-3.0.5/vsftpd ./$</vsftpd.lto.cmplog
	$(MAKE) -C ./$</vsftpd-3.0.5 clean
	$(MAKE) AFL_LLVM_LAF_ALL=1 CC=afl-clang-fast LD=afl-clang-fast -C ./$</vsftpd-3.0.5
	cp ./$</vsftpd-3.0.5/vsftpd ./$</vsftpd.laf-intel.afl

backdoored:
	mkdir -p ./$@
	tar xvf ./original/vsftpd-3.0.5.tar.gz -C ./$@/
	patch ./$@/vsftpd-3.0.5/main.c ./patches/rosa_main.c.patch
	patch ./$@/vsftpd-3.0.5/vsf_findlibs.sh ./patches/vsf_findlibs.sh.patch
	patch ./$@/vsftpd-3.0.5/prelogin.c ./patches/backdoored_prelogin.c.patch
	$(MAKE) -C ./$@/vsftpd-3.0.5
	cp ./$@/vsftpd-3.0.5/vsftpd ./$@/
	cp ./vsftpd.conf ./$@/

backdoored-afl: backdoored
	cp ./$</vsftpd-3.0.5/vsftpd ./$</vsftpd.ori
	$(MAKE) -C ./$</vsftpd-3.0.5 clean
	$(MAKE) CC=afl-clang-lto LD=afl-clang-lto -C ./$</vsftpd-3.0.5
	cp ./$</vsftpd-3.0.5/vsftpd ./$</vsftpd.lto.afl
	$(MAKE) -C ./$</vsftpd-3.0.5 clean
	$(MAKE) AFL_LLVM_CMPLOG=1 CC=afl-clang-lto LD=afl-clang-lto -C ./$</vsftpd-3.0.5
	cp ./$</vsftpd-3.0.5/vsftpd ./$</vsftpd.lto.cmplog
	$(MAKE) -C ./$</vsftpd-3.0.5 clean
	$(MAKE) AFL_LLVM_LAF_ALL=1 CC=afl-clang-fast LD=afl-clang-fast -C ./$</vsftpd-3.0.5
	cp ./$</vsftpd-3.0.5/vsftpd ./$</vsftpd.laf-intel.afl

ground-truth:
	mkdir -p ./$@
	tar xvf ./original/vsftpd-3.0.5.tar.gz -C ./$@/
	patch ./$@/vsftpd-3.0.5/main.c ./patches/rosa_main.c.patch
	patch ./$@/vsftpd-3.0.5/vsf_findlibs.sh ./patches/vsf_findlibs.sh.patch
	patch ./$@/vsftpd-3.0.5/prelogin.c ./patches/ground-truth_prelogin.c.patch
	$(MAKE) -C ./$@/vsftpd-3.0.5
	cp ./$@/vsftpd-3.0.5/vsftpd ./$@/
	cp ./vsftpd.conf ./$@/

ground-truth-afl: ground-truth
	cp ./$</vsftpd-3.0.5/vsftpd ./$</vsftpd.ori
	$(MAKE) -C ./$</vsftpd-3.0.5 clean
	$(MAKE) CC=afl-clang-lto LD=afl-clang-lto -C ./$</vsftpd-3.0.5
	cp ./$</vsftpd-3.0.5/vsftpd ./$</vsftpd.lto.afl
	$(MAKE) -C ./$</vsftpd-3.0.5 clean
	$(MAKE) AFL_LLVM_CMPLOG=1 CC=afl-clang-lto LD=afl-clang-lto -C ./$</vsftpd-3.0.5
	cp ./$</vsftpd-3.0.5/vsftpd ./$</vsftpd.lto.cmplog
	$(MAKE) -C ./$</vsftpd-3.0.5 clean
	$(MAKE) AFL_LLVM_LAF_ALL=1 CC=afl-clang-fast LD=afl-clang-fast -C ./$</vsftpd-3.0.5
	cp ./$</vsftpd-3.0.5/vsftpd ./$</vsftpd.laf-intel.afl

clean:
	rm -rf ./backdoored ./safe ./ground-truth

all: safe backdoored ground-truth

all-afl: safe-afl backdoored-afl ground-truth-afl