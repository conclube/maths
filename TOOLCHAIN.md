# Local toolchain

Retrieved 24 October 2026. Binaries are local to this project; ordinary builds do not use network packages or change the global PATH.

| Tool | Version | Official archive | SHA-256 |
|---|---|---|---|
| Typst | 0.15.1 | https://github.com/typst/typst/releases/download/v0.15.1/typst-x86_64-pc-windows-msvc.zip | `19CE3551153C2FE7EE9FA2F95208310C8F4D3209FEDB699E0333FAF8913F6736` |
| Agda | 2.8.0.2 | https://github.com/agda/agda/releases/download/v2.8.0.2/Agda-v2.8.0.2-win64.zip | `755E19A9244019A3B08A67104DC5A93BD662A7634C4F02A1F34E06B59251B7FC` |

`scripts/setup-tools.ps1` checks these exact archive hashes before extraction. Typst builds with `--root <workspace> --ignore-system-fonts`. Shared formatting is in `shared/book.typ`; no remote Typst package is required.

The lab checker sets both `AGDA_DIR` (configuration) and `Agda_datadir` (embedded data extraction) to the project's `.tools/agda/data`, and uses `--safe --without-K --no-libraries`. The different variables are documented in the [Agda 2.8 command-line reference](https://agda.readthedocs.io/en/v2.8.0/tools/command-line-options.html). It changes only its own process environment. Agda may create `.agdai` interface caches alongside labs.

PDF validation uses locally available Poppler for rendering and Python with pypdf/pdfplumber/Pillow for counts, text/annotation checks, and contact sheets. These validation tools are not required for reading or rebuilding the course PDFs. Mathematical review is distinct from compilation and the machine checking of the four Agda examples.
