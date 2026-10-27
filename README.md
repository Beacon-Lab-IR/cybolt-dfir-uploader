# CyboltDFIR Uploader

Subidor standalone de ZIPs resultantes de adquisiciones DFIR. Soporta
S3, FTP, SFTP, SMB con autenticación estándar (SigV4 para AWS, certs
SSH, credenciales Windows).

## Quickstart

```bash
./build.sh                  # usa la version del header de VERSION.txt
./build.sh 0.2.0            # fuerza la version

# Output: dist/CyboltDFIR-Uploader-v<VERSION>.zip
```

**Una sola versión:** tag git = ZIP = `AssemblyVersion` = UI
(`AppVersion.Current`).

## Componentes

- `DfirUploaderUi/` — C# WinForms GUI (`DFIR_UPLOADER_UI.exe`), .NET Framework 4.5.2
- `VERSION.txt` — changelog + header de versión

## Uso

1. Copiar `CyboltDFIR-Uploader-v<VERSION>.zip` a la VM de análisis
2. Descomprimir y ejecutar `DFIR_UPLOADER_UI.exe`
3. Sync del config JSON remoto (S3/FTP/SFTP/SMB + credenciales)
4. Browse de la carpeta con la evidencia del triage
5. Subir y obtener SHA-256 / audit log

## Releases

- [GitHub Releases](https://github.com/Beacon-Lab-IR/cybolt-dfir-uploader/releases)
- Cada release genera `CyboltDFIR-Uploader-v<VERSION>.zip`

## Variantes

Este proyecto es self-contained. Para el bundle completo (Triage + Uploader
dentro de un ISO), ver:

- [Beacon-Lab-IR/cybolt-dfir-triage](https://github.com/Beacon-Lab-IR/cybolt-dfir-triage) — wizard de adquisición
- [Beacon-Lab-IR/cybolt-dfir-iso](https://github.com/Beacon-Lab-IR/cybolt-dfir-iso) — ISO que combina ambos

## Licencia

By Cybolt, MIT License.
