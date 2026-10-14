# CyboltDFIR Uploader

Subidor standalone de ZIPs resultantes de adquisiciones DFIR. Soporta
S3, FTP, SFTP, SMB con autenticación estándar (SigV4 para AWS, certs
SSH, credenciales Windows).

## Quickstart

```bash
./build.sh                  # build v0.1.0 (default)
./build.sh 6.0.0            # build con version especifica

# Output: dist/CyboltDFIR-Uploader-v<VERSION>.zip
```

## Componentes

- `DfirUploaderUi/` — C# WinForms GUI (DFIR_UPLOADER_UI.exe)
- `VERSION.txt` — version del binario

## Uso

1. Copiar `CyboltDFIR-Uploader-v<VERSION>.zip` a la VM de análisis
2. Descomprimir y ejecutar `DFIR_UPLOADER_UI.exe`
3. Ingresar endpoint (S3/FTP/SFTP/SMB) y credenciales
4. Seleccionar el ZIP producido por el wizard de triage
5. Subir y obtener SHA-256 firmado

## Releases

- [GitHub Releases](https://github.com/Beacon-Lab-IR/cybolt-dfir-uploader/releases)
- Cada release genera `CyboltDFIR-Uploader-v<VERSION>.zip`

## Variantes

Este proyecto es self-contained. Para el bundle completo (Triage + Uploader
dentro de un ISO booteable), ver:

- [Beacon-Lab-IR/cybolt-dfir-triage](https://github.com/Beacon-Lab-IR/cybolt-dfir-triage) — wizard de adquisición
- [Beacon-Lab-IR/cybolt-dfir-iso](https://github.com/Beacon-Lab-IR/cybolt-dfir-iso) — ISO booteable que combina ambos

## Licencia

By Cybolt, MIT License.
