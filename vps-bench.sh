#!/bin/sh

SPEEDTEST_BIN="./speedtest-cli/speedtest_cli.py"

MISSING_REQUIREMENT=0

check_requirement () {
  if ! command -v "$1" > /dev/null; then
    echo "command not found: $1"
    REQUIREMENT_MISSING=1
  fi
}

check_requirement "git"
check_requirement "fio"
check_requirement "openssl"
check_requirement "python"

if [ $REQUIREMENT_MISSING ]; then
  exit 1
fi

if [ ! -f "$SPEEDTEST_BIN" ]; then
  echo "acquiring speedtest-cli"
  git submodule init
  git submodule update
fi

echo "network bench"
python $SPEEDTEST_BIN --simple
echo

echo "disk bench"
fio --minimal ssd-test.fio | awk -F ';' '{ printf "%10s | reads: %8s KB/s %8s iops %6d μs | writes: %8s KB/s %8s iops %6d μs\n", $3, $7, $8, $41, $49, $50, $83 }'
rm disk.test.file
echo

echo "cpu bench"
echo "ghash 8KiB blocks: $(openssl speed ghash -mr 2>/dev/null | grep -e '^\+F:' | cut -d: -f8 | numfmt --to=iec-i --suffix=B/s)"
