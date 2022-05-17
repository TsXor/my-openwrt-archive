dir=`dirname $0`
git checkout v21.02.3
cp -r $dir/tree/* .
cp -r $dir/tree/.[^.]* .
git am < $dir/patch
