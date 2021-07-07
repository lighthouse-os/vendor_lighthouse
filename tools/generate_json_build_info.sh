#!/bin/sh
if [ "$1" ]
then
  file_path=$1
  file_name=$(basename "$file_path")
  DEVICE=$(echo $TARGET_PRODUCT | sed 's/lighthouse_//g')
  if [ -f $file_path ]; then
    file_size=$(stat -c%s $file_path)
    md5=$(cat "$file_path.md5sum" | cut -d' ' -f1)
    datetime=$(grep ro\.build\.date\.utc ./out/target/product/$DEVICE/system/build.prop | cut -d= -f2);
    id=$(sha256sum $file_path | awk '{ print $1 }');
    version=$(echo $file_name | cut -d '-' -f2)
    download="https://downloads.projectlighthouse.workers.dev/$DEVICE/$file_name"
    echo '{

        "error": false,
        "device": "'$DEVICE'",
        "id": "'$id'",
        "filename": "'$file_name'",
        "url": "'$download'",
        "datetime": "'$datetime'",
        "filehash": "'$md5'",
        "size": '$file_size',
        "version": "'$version'"

}' > "out/target/product/${DEVICE}/${file_name}.json"
  fi
fi
