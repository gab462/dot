# make() { flatpak run --command=make io.neovim.nvim $@; }; && export -f make

CLANG_FOLDER="clang+llvm-18.1.8-x86_64-linux-gnu-ubuntu-18.04"
MUSL_FOLDER="musl-1.2.5"
NCOMPAT_FOLDER="ncurses-compat-libs-6.4-12.20240127.fc40.x86_64"

CLANG_TARBALL="$CLANG_FOLDER.tar.xz"
MUSL_TARBALL="$MUSL_FOLDER.tar.gz"
NCOMPAT_RPM="$NCOMPAT_FOLDER.rpm"

CLANG_URL="https://github.com/llvm/llvm-project/releases/download/llvmorg-18.1.8/$CLANG_TARBALL"
MUSL_URL="https://musl.libc.org/releases/$MUSL_TARBALL"
NCOMPAT_URL="https://kojipkgs.fedoraproject.org//packages/ncurses/6.4/12.20240127.fc40/x86_64/$NCOMPAT_RPM"

extract_rpm() {
    rpm2cpio "$1" | cpio -idmv
}

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PWD/$NCOMPAT_FOLDER/usr/lib64/

curl -LO $NCOMPAT_URL \
    && mkdir $NCOMPAT_FOLDER \
    && mv $NCOMPAT_RPM $NCOMPAT_FOLDER \
    && pushd $NCOMPAT_FOLDER \
    && extract_rpm $NCOMPAT_RPM \
    && rm $NCOMPAT_RPM \
    && popd \
    && curl -LO $CLANG_URL \
    && tar xf $CLANG_TARBALL \
    && rm $CLANG_TARBALL \
    && curl -LO $MUSL_URL \
    && tar xf $MUSL_TARBALL \
    && rm $MUSL_TARBALL \
    && mkdir $MUSL_FOLDER/build \
    && pushd $MUSL_FOLDER/build \
    && CC=../../stub ../configure --prefix=$PWD/../usr \
    && make -j4 \
    && make install
