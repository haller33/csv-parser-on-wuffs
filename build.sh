#!/bin/bash -eu
# Copyright 2023 Any
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# ----------------

CC=${CC:-gcc}


mkdir -p bin
# You may need to run
#   go install github.com/google/wuffs/cmd/wuffs-c
# beforehand, to install the wuffs-c compiler.
wuffs-c gen -package_name demo < wuffs/parse.wuffs > src/parse.c

# echo --- C Implementation Prints ---
# $CC src/main.c src/naive-parse.c -o bin/n.out
# ./bin/n.out

echo ------ Wuffs Impl Prints ------
$CC src/main.c src/wuffs-parse.c -o bin/csv_parser.bin
./bin/csv_parser.bin
