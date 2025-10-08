#!/bin/bash
SOURCE_DIR="/home/yves/sites"
TARGET_DIR="docroot/modules/acerta"

if [ -n "$1" ]; then
  name="$1"
  source_name="drupal-${name//_/-}"
  if [ -d "$SOURCE_DIR/$source_name" ]; then
    rm -rf "$TARGET_DIR/$name"
    ln -s "$SOURCE_DIR/$source_name" "$TARGET_DIR/$name"
    echo "Symlinked $name from $SOURCE_DIR/$source_name"
  else
    echo "Source directory $SOURCE_DIR/$source_name does not exist."
  fi
else
  for module in "$TARGET_DIR"/*; do
    name=$(basename "$module")
    source_name="drupal-${name//_/-}"
    if [ -d "$SOURCE_DIR/$source_name" ]; then
      rm -rf "$module"
      ln -s "$SOURCE_DIR/$source_name" "$TARGET_DIR/$name"
      echo "Symlinked $name from $SOURCE_DIR/$source_name"
    fi
  done
fi

