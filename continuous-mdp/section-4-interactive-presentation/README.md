# Section 4 interactive presentation

This folder contains the complete Section 4 presentation package: the editable QMD source, rendered HTML deck, browser assets, Quarto Live extension, source paper, relevant notebooks, and the Python modules used by the live examples.

## Easiest way to open the presentation on macOS

1. Double-click `OPEN-PRESENTATION.command`.
2. A Terminal window will start a small local web server and open the presentation in your default browser.
3. Use the left and right arrow keys to move through the slides.
4. On an interactive slide, edit the visible Python code and click **Run Code**.
5. When finished, return to the Terminal window and press **Control-C**.

For the self-guided demonstration, run **Guidance preserves progress** first. The next slide reuses that solve to display the guide-dual-induced state-relevance distribution; it can also create its own smaller default run if needed.

The first launch needs an internet connection so the browser can load Pyodide, NumPy, SciPy, and Matplotlib.

Do not rely on double-clicking the HTML file directly. Browsers can block the web worker or local Python resources when a presentation is opened with a `file://` address.

## Manual way to open the rendered presentation

Open Terminal in this folder and run:

```bash
python3 -m http.server 8765 --bind 127.0.0.1
```

Then open:

<http://127.0.0.1:8765/section-4-self-adapting-mdps-research-readout.html>

## Edit and rebuild the QMD source

With Quarto installed, run:

```bash
quarto preview section-4-self-adapting-mdps-research-readout.qmd
```

The Quarto Live extension is already included under `_extensions/`.

## Folder contents

- `section-4-self-adapting-mdps-research-readout.qmd` — editable presentation source
- `section-4-self-adapting-mdps-research-readout.html` — rendered presentation
- `section-4-self-adapting-mdps-research-readout_files/` — required browser assets
- `OPEN-PRESENTATION.command` — macOS launcher
- `paper-section-4-source.pdf` — source paper
- `notebooks/` — the three related repository notebooks
- `config.py`, `mdp.py`, `basis.py`, `policy.py`, `helper.py` — shared model code
- `psmd/` and `self_guided_alp/` — algorithm implementations
- `_extensions/` — vendored Quarto Live extension

