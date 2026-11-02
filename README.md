# Clubtech email signatures

Company source: https://github.com/clubtechglobal/email-signatures

Signatures and all new image URLs belong to the Clubtech organisation. Do not
publish staff signatures or photos to a personal GitHub account.

## Create a signature

1. Export a square 100 × 100 PNG under roughly 25 KB to
   `images/ctg_profile_<firstname>.png`. Preserve existing filenames.
2. Copy `template.html` to `signatures/firstname-lastname.html` and fill all
   placeholders. If no phone is supplied, omit it or use a supplied LinkedIn link.
   Keep the nested tables, inline styles and fixed 500px card width.
3. Commit the HTML and image, then run `./push.sh`. It pushes **origin only** and
   verifies every signature image against the company repo's public image host.
4. Share the company repo download link and installation steps below.

Image base URL:
`https://raw.githubusercontent.com/clubtechglobal/email-signatures/main/images/`

## Get James's signature

Download the HTML from:
https://github.com/clubtechglobal/email-signatures/raw/refs/heads/main/signatures/james-tham-aphoy.html

Save the file, then open it in Chrome or Safari. The download is HTML source;
open the saved file to see the rendered signature before copying.

## Install

Gmail: Open the saved HTML in a browser → select all → copy. In Gmail,
Settings → See all settings → General → Signature → Create new → paste the
rendered content. Set defaults for new messages and replies/forwards, then
Save Changes at the bottom. Never paste HTML source into the signature box.

Outlook: Open the HTML in a browser, copy the rendered signature, then paste
in Settings → Signatures and save. Windows Outlook may show square corners.

Apple Mail: Copy the rendered signature into Mail → Settings → Signatures;
turn off Always match my default message font if needed.

## Hosting and legacy signatures

The organisation currently disables GitHub Actions, so its GitHub Pages preview
cannot publish. Direct company-owned image URLs work without Actions. A
company-domain rendered preview can be added through a separate website release.

The personal `bradvatne/email-signatures` repository is a **legacy image host**
for previously installed signatures only. Never sync new staff material to it.
James's published photo and signature were removed there during this migration.
Historical Git commits are not erased by removing published files.
Keep pre-existing legacy image URLs alive until their users have migrated;
deleting that host would break images in previously sent mail. The local `pages`
remote is retained only for legacy maintenance; `push.sh` never pushes to it.

Images in mail are public URLs. Never delete or rename a company image already
used in a signature. Gmail may cache old images; re-paste the migrated signature
to switch an installed signature to the company URLs.

Shared banner dimensions are 802 × 104; preserve those dimensions on replacement.
