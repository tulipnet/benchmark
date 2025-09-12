.DEFAULT_GOAL := all

.PHONY: safe safe-afl backdoored backdoored-afl ground-truth ground-truth-afl clean all all-afl

safe:
	mkdir -p ./safe
	rm -rf ./safe/proftpd-1.3.5/
	tar xvf ./original/proftpd-1.3.5.tar.gz -C ./safe/
	patch ./safe/proftpd-1.3.5/src/main.c ./patches/rosa_main.c.patch
	patch ./safe/proftpd-1.3.5/contrib/mod_copy.c ./patches/safe-mod_copy.c.patch
	patch ./safe/proftpd-1.3.5/tests/t/lib/proftpd-1.3.5/Tests/Modules/mod_copy.pm ./patches/safe-mod_copy.pm.patch
	cd ./safe/proftpd-1.3.5 && CC=gcc LD=gcc ./configure --with-modules=mod_copy
	CC=gcc LD=gcc make -C ./safe/proftpd-1.3.5
	cp ./safe/proftpd-1.3.5/proftpd ./safe/proftpd.ori

safe-afl:
	mkdir -p ./safe
	rm -rf ./safe/proftpd-1.3.5/
	tar xvf ./original/proftpd-1.3.5.tar.gz -C ./safe/
	patch ./safe/proftpd-1.3.5/src/main.c ./patches/rosa_main.c.patch
	patch ./safe/proftpd-1.3.5/contrib/mod_copy.c ./patches/safe-mod_copy.c.patch
	patch ./safe/proftpd-1.3.5/tests/t/lib/proftpd-1.3.5/Tests/Modules/mod_copy.pm ./patches/safe-mod_copy.pm.patch
	cd ./safe/proftpd-1.3.5 && CC=afl-clang-lto LD=afl-clang-lto ./configure --with-modules=mod_copy
	CC=afl-clang-lto LD=afl-clang-lto make -C ./safe/proftpd-1.3.5
	cp ./safe/proftpd-1.3.5/proftpd ./safe/proftpd.lto.afl
	rm -rf ./safe/proftpd-1.3.5/
	tar xvf ./original/proftpd-1.3.5.tar.gz -C ./safe/
	patch ./safe/proftpd-1.3.5/src/main.c ./patches/rosa_main.c.patch
	patch ./safe/proftpd-1.3.5/contrib/mod_copy.c ./patches/safe-mod_copy.c.patch
	patch ./safe/proftpd-1.3.5/tests/t/lib/proftpd-1.3.5/Tests/Modules/mod_copy.pm ./patches/safe-mod_copy.pm.patch
	cd ./safe/proftpd-1.3.5 && CC=afl-clang-lto LD=afl-clang-lto ./configure --with-modules=mod_copy
	AFL_LLVM_CMPLOG=1 CC=afl-clang-lto LD=afl-clang-lto make -C ./safe/proftpd-1.3.5
	cp ./safe/proftpd-1.3.5/proftpd ./safe/proftpd.lto.cmplog
	rm -rf ./safe/proftpd-1.3.5/
	tar xvf ./original/proftpd-1.3.5.tar.gz -C ./safe/
	patch ./safe/proftpd-1.3.5/src/main.c ./patches/rosa_main.c.patch
	patch ./safe/proftpd-1.3.5/contrib/mod_copy.c ./patches/safe-mod_copy.c.patch
	patch ./safe/proftpd-1.3.5/tests/t/lib/proftpd-1.3.5/Tests/Modules/mod_copy.pm ./patches/safe-mod_copy.pm.patch
	cd ./safe/proftpd-1.3.5 && CC=afl-clang-fast LD=afl-clang-fast ./configure --with-modules=mod_copy
	AFL_LLVM_LAF_ALL=1 CC=afl-clang-fast LD=afl-clang-fast make -C ./safe/proftpd-1.3.5
	cp ./safe/proftpd-1.3.5/proftpd ./safe/proftpd.laf-intel.afl

backdoored:
	mkdir -p ./backdoored
	rm -rf ./backdoored/proftpd-1.3.5/
	tar xvf ./original/proftpd-1.3.5.tar.gz -C ./backdoored/
	patch ./backdoored/proftpd-1.3.5/src/main.c ./patches/rosa_main.c.patch
	cd ./backdoored/proftpd-1.3.5 && CC=gcc LD=gcc ./configure --with-modules=mod_copy
	CC=gcc LD=gcc make -C ./backdoored/proftpd-1.3.5
	cp ./backdoored/proftpd-1.3.5/proftpd ./backdoored/proftpd.ori

backdoored-afl:
	mkdir -p ./backdoored
	rm -rf ./backdoored/proftpd-1.3.5/
	tar xvf ./original/proftpd-1.3.5.tar.gz -C ./backdoored/
	patch ./backdoored/proftpd-1.3.5/src/main.c ./patches/rosa_main.c.patch
	cd ./backdoored/proftpd-1.3.5 && CC=afl-clang-lto LD=afl-clang-lto ./configure --with-modules=mod_copy
	CC=afl-clang-lto LD=afl-clang-lto make -C ./backdoored/proftpd-1.3.5
	cp ./backdoored/proftpd-1.3.5/proftpd ./backdoored/proftpd.lto.afl
	rm -rf ./backdoored/proftpd-1.3.5/
	tar xvf ./original/proftpd-1.3.5.tar.gz -C ./backdoored/
	patch ./backdoored/proftpd-1.3.5/src/main.c ./patches/rosa_main.c.patch
	cd ./backdoored/proftpd-1.3.5 && CC=afl-clang-lto LD=afl-clang-lto ./configure --with-modules=mod_copy
	AFL_LLVM_CMPLOG=1 CC=afl-clang-lto LD=afl-clang-lto make -C ./backdoored/proftpd-1.3.5
	cp ./backdoored/proftpd-1.3.5/proftpd ./backdoored/proftpd.lto.cmplog
	rm -rf ./backdoored/proftpd-1.3.5/
	tar xvf ./original/proftpd-1.3.5.tar.gz -C ./backdoored/
	patch ./backdoored/proftpd-1.3.5/src/main.c ./patches/rosa_main.c.patch
	cd ./backdoored/proftpd-1.3.5 && CC=afl-clang-lto LD=afl-clang-lto ./configure --with-modules=mod_copy
	AFL_LLVM_LAF_ALL=1 CC=afl-clang-fast LD=afl-clang-fast make -C ./backdoored/proftpd-1.3.5
	cp ./backdoored/proftpd-1.3.5/proftpd ./backdoored/proftpd.laf-intel.afl

ground-truth:
	mkdir -p ./ground-truth
	rm -rf ./ground-truth/proftpd-1.3.5/
	tar xvf ./original/proftpd-1.3.5.tar.gz -C ./ground-truth/
	patch ./ground-truth/proftpd-1.3.5/src/main.c ./patches/rosa_main.c.patch
	patch ./ground-truth/proftpd-1.3.5/contrib/mod_copy.c ./patches/ground_truth-mod_copy.c.patch
	cd ./ground-truth/proftpd-1.3.5 && CC=gcc LD=gcc ./configure --with-modules=mod_copy
	CC=gcc LD=gcc make -C ./ground-truth/proftpd-1.3.5
	cp ./ground-truth/proftpd-1.3.5/proftpd ./ground-truth/proftpd.ori

ground-truth-afl:
	mkdir -p ./ground-truth
	rm -rf ./ground-truth/proftpd-1.3.5/
	tar xvf ./original/proftpd-1.3.5.tar.gz -C ./ground-truth/
	patch ./ground-truth/proftpd-1.3.5/src/main.c ./patches/rosa_main.c.patch
	patch ./ground-truth/proftpd-1.3.5/contrib/mod_copy.c ./patches/ground_truth-mod_copy.c.patch
	cd ./ground-truth/proftpd-1.3.5 && CC=afl-clang-lto LD=afl-clang-lto ./configure --with-modules=mod_copy
	CC=afl-clang-lto LD=afl-clang-lto make -C ./ground-truth/proftpd-1.3.5
	cp ./ground-truth/proftpd-1.3.5/proftpd ./ground-truth/proftpd.lto.afl
	rm -rf ./ground-truth/proftpd-1.3.5/
	tar xvf ./original/proftpd-1.3.5.tar.gz -C ./ground-truth/
	patch ./ground-truth/proftpd-1.3.5/src/main.c ./patches/rosa_main.c.patch
	cd ./ground-truth/proftpd-1.3.5 && CC=afl-clang-lto LD=afl-clang-lto ./configure --with-modules=mod_copy
	AFL_LLVM_CMPLOG=1 CC=afl-clang-lto LD=afl-clang-lto make -C ./ground-truth/proftpd-1.3.5
	cp ./ground-truth/proftpd-1.3.5/proftpd ./ground-truth/proftpd.lto.cmplog
	rm -rf ./ground-truth/proftpd-1.3.5/
	tar xvf ./original/proftpd-1.3.5.tar.gz -C ./ground-truth/
	patch ./ground-truth/proftpd-1.3.5/src/main.c ./patches/rosa_main.c.patch
	cd ./ground-truth/proftpd-1.3.5 && CC=afl-clang-lto LD=afl-clang-lto ./configure --with-modules=mod_copy
	AFL_LLVM_LAF_ALL=1 CC=afl-clang-fast LD=afl-clang-fast make -C ./ground-truth/proftpd-1.3.5
	cp ./ground-truth/proftpd-1.3.5/proftpd ./ground-truth/proftpd.laf-intel.afl

clean:
	rm -rf ./backdoored ./safe ./ground-truth

all: safe backdoored ground-truth

all-afl: safe-afl backdoored-afl ground-truth-afl