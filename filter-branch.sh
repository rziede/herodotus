#!/bin/bash

git filter-branch --prune-empty --tree-filter '
if [[ ! -e web/eis ]]; then
    mkdir -p web/eis
    git ls-tree --name-only $GIT_COMMIT | xargs -I files mv files web/eis
fi' -- --all