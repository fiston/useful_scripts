#!/bin/bash

WRONG_EMAIL="$1"
NEW_NAME="$2"
NEW_EMAIL="$3"

git filter-branch --env-filter "
WRONG_EMAIL=\"$WRONG_EMAIL\"
NEW_NAME=\"$NEW_NAME\"
NEW_EMAIL=\"$NEW_EMAIL\"
if [ \"\$GIT_COMMITTER_EMAIL\" = \"\$WRONG_EMAIL\" ]; then
    export GIT_COMMITTER_NAME=\"\$NEW_NAME\"
    export GIT_COMMITTER_EMAIL=\"\$NEW_EMAIL\"
fi
if [ \"\$GIT_AUTHOR_EMAIL\" = \"\$WRONG_EMAIL\" ]; then
    export GIT_AUTHOR_NAME=\"\$NEW_NAME\"
    export GIT_AUTHOR_EMAIL=\"\$NEW_EMAIL\"
fi
" --tag-name-filter cat -- --branches --tags

