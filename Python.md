
# Jupyter

Jupyter is made as two separate pieces:

```
┌────────────────────┐
│  JupyterLab Server │
│ (web UI + manager) │
└─────────┬──────────┘
          │
          │ starts
          ▼
┌────────────────────┐
│   Python Kernel    │
│      (.venv)       │
└────────────────────┘
```

The **JupyterLab server** and the **kernel** do **not** have to live in the same Python environment.

---

```bash
python -m ipykernel install \
	--user \
    --name asura-mlkit \
    --display-name "Python (.venv)"
```

It creates a directory like

```
~/.local/share/jupyter/kernels/asura-mlkit/
```

containing:

```
kernel.json
logo-32x32.png
logo-64x64.png
...
```

The important file is `kernel.json`:

```json
{
  "argv": [
    "/home/asura/projects/asura-mlkit/.venv/bin/python",
    "-m",
    "ipykernel_launcher",
    "-f",
    "{connection_file}"
  ],
  "display_name": "Python (.venv)"
}
```

Notice that this file is just metadata. JupyterLab reads it and knows which executable to start.