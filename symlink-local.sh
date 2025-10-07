#!/bin/bash
SOURCE_DIR="/home/yves/sites"
TARGET_DIR="docroot/modules/acerta"

for module in "$TARGET_DIR"/*; do
  name=$(basename "$module")
  source_name="drupal-${name//_/-}"
  if [ -d "$SOURCE_DIR/$source_name" ]; then
    rm -rf "$module"
    ln -s "$SOURCE_DIR/$source_name" "$TARGET_DIR/$name"
    echo "Symlinked $name from $SOURCE_DIR/$source_name"
  fi
done

