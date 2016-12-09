#!/bin/bash
set -e

# default to the first commit in the repository
commit=${1:-8c3981d2f5b9348c7ab5842ecb0420126c779739}

git diff --name-only $commit...HEAD articles
