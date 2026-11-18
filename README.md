# Marcos Martinez — CV

Asesor impositivo y desarrollador de software (MMAC Dev Lab). Trabajo remoto, freelance o full-time.

- 🌐 **Web (ES):** https://martinezmarcos93.github.io/martinezmarcos93.github.io-cv/
- 🌐 **Web (EN):** https://martinezmarcos93.github.io/martinezmarcos93.github.io-cv/en/
- 📄 **PDF:** [español](cv-marcos-martinez-es.pdf) · [english](cv-marcos-martinez-en.pdf) · [bilingüe, 2 páginas](MMCV-2026-27.pdf)
- ✉️ mm.analistacontable@gmail.com · [LinkedIn](https://www.linkedin.com/in/marcos-mart%C3%ADnez-12155b203/)

## Cómo está hecho

El HTML es la **fuente única**: los PDF se generan desde la misma página con estilos de impresión,
así la web y el PDF no pueden contradecirse. Una sola columna para que los sistemas ATS lean el texto en orden.

```text
├── index.html            # CV en español
├── en/index.html         # CV en inglés
├── styles.css            # estilos compartidos (pantalla, celular e impresión A4)
├── foto.jpg              # foto (solo en la web; el PDF va sin foto)
├── scripts/build-pdf.sh  # genera los tres PDF con Chrome headless + pdfunite
└── cv-marcos-martinez*.pdf
```

## Actualizar

1. Editar `index.html` y `en/index.html` (mantener las dos versiones con el mismo contenido).
2. `bash scripts/build-pdf.sh` → debe informar 1 página para ES, 1 para EN y 2 para el bilingüe.
3. Commit y push: GitHub Pages publica solo.

Las secciones con la clase `web-only` (servicios, proyectos) se ven en la web y no van al PDF.
