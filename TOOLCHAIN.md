# Local toolchain

Retrieved 24 October 2026. Binaries are local to this project; ordinary builds do not use network packages or change the global PATH.

| Tool | Version | Official archive | SHA-256 |
|---|---|---|---|
| Typst | 0.15.1 | https://github.com/typst/typst/releases/download/v0.15.1/typst-x86_64-pc-windows-msvc.zip | `19CE3551153C2FE7EE9FA2F95208310C8F4D3209FEDB699E0333FAF8913F6736` |
| Agda | 2.8.0.2 | https://github.com/agda/agda/releases/download/v2.8.0.2/Agda-v2.8.0.2-win64.zip | `755E19A9244019A3B08A67104DC5A93BD662A7634C4F02A1F34E06B59251B7FC` |

`scripts/setup-tools.ps1` checks these exact archive hashes before extraction. Typst builds with `--root <workspace> --ignore-system-fonts`. Shared formatting is in `shared/book.typ`; no remote Typst package is required.

The lab checker sets both `AGDA_DIR` (configuration) and `Agda_datadir` (embedded data extraction) to the project's `.tools/agda/data`, and uses `--safe --without-K --no-libraries`. The different variables are documented in the [Agda 2.8 command-line reference](https://agda.readthedocs.io/en/v2.8.0/tools/command-line-options.html). It changes only its own process environment. Agda may create `.agdai` interface caches alongside labs.

PDF validation uses locally available Poppler for rendering and Python with pypdf/pdfplumber/Pillow for counts, text/annotation checks, and contact sheets. These validation tools are not required for reading or rebuilding the course PDFs. Mathematical review is distinct from compilation and the machine checking of the four Agda examples.

## Edition 2 verification and CI

The validation dependencies are pinned in qa/requirements.txt: pypdf 6.10.0, pdfplumber 0.11.9, and Pillow 12.3.0. The Windows CI workflow uses Python 3.13 and the same checksum-verified Typst and Agda installers as local builds. Poppler is needed for local visual review, but the automated CI text, link, and bounds checks do not require it.

The shared problem helper accepts optional named optional and idea fields. An absent idea renders no separate idea section; it is never copied automatically from a hint. Mock estimates use 15/30/40 minutes for E/C/A. The multiline inventory parser exports timing and optional-status metadata so QA totals follow the actual records.

PDF byte hashes can change on rebuilding. Current delivery approval requires the exact PDF hash and its rendered contact-sheet hashes; CI does not inherit visual approval from a previous binary. The older pixel-comparison helper remains available for diagnostics, but cannot approve edited content or bypass the current delivery audit.
