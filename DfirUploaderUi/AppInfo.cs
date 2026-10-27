using System.Reflection;
using System.Runtime.InteropServices;

[assembly: AssemblyTitle("DFIR_UPLOADER_UI")]
[assembly: AssemblyDescription("DFIR Evidence Uploader (S3/FTP/SFTP/SMB) - By Cybolt, MIT License")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("Cybolt")]
[assembly: AssemblyProduct("CYBOLT-DFIR-UPLOADER")]
[assembly: AssemblyCopyright("Copyright (c) 2026 Cybolt")]
[assembly: AssemblyTrademark("")]
[assembly: AssemblyCulture("")]

[assembly: ComVisible(false)]
[assembly: Guid("9e8d5f0b-4c2e-4f3a-b0c7-8f9e2c3d4e5a")]

// Una sola version: la misma del tag git / ZIP / UI (ej. 0.2.0).
[assembly: AssemblyVersion("0.2.0.0")]
[assembly: AssemblyFileVersion("0.2.0.0")]

namespace DfirUploaderUi
{
    /// <summary>
    /// Version unica del producto (Major.Minor.Build de AssemblyVersion).
    /// </summary>
    internal static class AppVersion
    {
        public static string Current
        {
            get
            {
                var v = typeof(AppVersion).Assembly.GetName().Version;
                return v.Major + "." + v.Minor + "." + v.Build;
            }
        }
    }
}
