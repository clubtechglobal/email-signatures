#!/usr/bin/env bash
# Publish company-owned source only. Never push new staff assets to personal Pages.
set -euo pipefail
cd "$(dirname "$0")"
if [[ -n "$(git status --porcelain)" ]]; then
  echo "Commit changes before publishing." >&2
  exit 1
fi
git push origin main
python3 - <<'VERIFY'
from pathlib import Path
from html.parser import HTMLParser
from urllib.request import urlopen
import time
base = 'https://raw.githubusercontent.com/clubtechglobal/email-signatures/main/images/'
urls = set()
class Images(HTMLParser):
    def handle_starttag(self, tag, attrs):
        if tag == 'img':
            url = dict(attrs)['src']
            if not url.startswith(base):
                raise SystemExit('Non-company image URL: ' + url)
            urls.add(url)
for signature in Path('signatures').glob('*.html'):
    Images().feed(signature.read_text())
for url in sorted(urls):
    expected = (Path('images') / url.rsplit('/', 1)[-1]).read_bytes()
    for attempt in range(12):
        try:
            with urlopen(url, timeout=15) as response:
                if response.read() == expected:
                    break
        except Exception:
            pass
        if attempt == 11:
            raise SystemExit('Public image not current: ' + url)
        time.sleep(5)
    print('Verified company image: ' + url.rsplit('/', 1)[-1])
print('Published to clubtechglobal/email-signatures; personal mirror untouched.')
VERIFY
