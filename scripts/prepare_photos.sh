#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 SOURCE_DIR OUTPUT_DIR [filename:rotation ...]"
  echo "rotation: keep, cw, ccw, or 180"
}

if [[ $# -lt 2 ]]; then
  usage
  exit 2
fi

source_dir=$1
output_dir=$2
shift 2

if [[ ! -d "$source_dir" ]]; then
  echo "Source directory does not exist: $source_dir" >&2
  exit 1
fi

if ! command -v ffmpeg >/dev/null 2>&1; then
  echo "ffmpeg is required." >&2
  exit 1
fi

mkdir -p "$output_dir"

for specification in "$@"; do
  filename=${specification%:*}
  rotation=${specification##*:}
  source_path="$source_dir/$filename"
  output_path="$output_dir/$filename"

  if [[ ! -f "$source_path" ]]; then
    echo "Missing source photo: $source_path" >&2
    exit 1
  fi

  case "$rotation" in
    keep)
      cp -p "$source_path" "$output_path"
      ;;
    cw)
      ffmpeg -y -loglevel error -i "$source_path" -vf transpose=1 "$output_path"
      ;;
    ccw)
      ffmpeg -y -loglevel error -i "$source_path" -vf transpose=2 "$output_path"
      ;;
    180)
      ffmpeg -y -loglevel error -i "$source_path" -vf hflip,vflip "$output_path"
      ;;
    *)
      echo "Unknown rotation '$rotation' for $filename" >&2
      exit 1
      ;;
  esac
done

echo "Prepared photos written to: $output_dir"
echo "Inspect every output before uploading to Vendoo."
