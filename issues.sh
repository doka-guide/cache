source .env
mkdir issues
for I in $(seq 1 $PAGE_COUNT); do
  echo ">>>>>> Запрос $I из $PAGE_COUNT:"
  curl --request GET  \
    --header "Accept: application/vnd.github+json" \
    --header "Authorization: Bearer $GITHUB_TOKEN" \
    --header "X-GitHub-Api-Version: 2022-11-28" \
    https://api.github.com/repos/doka-guide/content/issues\?state\=all\&per_page\=$ITEM_COUNT\&page\=$I >> issues/issues.$I.json
done
node issues.js
rm -rf issues
