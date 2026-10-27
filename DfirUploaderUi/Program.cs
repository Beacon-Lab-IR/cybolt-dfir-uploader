using System;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Windows.Forms;

namespace DfirUploaderUi
{
    /// <summary>
    /// DFIR_UPLOADER_UI - Subida de evidencia DFIR (S3/FTP/SFTP/SMB).
    /// Version: AppVersion.Current. By Cybolt, MIT License.
    /// </summary>
    internal static class Program
    {
        [STAThread]
        private static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            try
            {
                Application.Run(new DfirUploaderMain());
            }
            catch (Exception ex)
            {
                MessageBox.Show(
                    "Error fatal en DFIR_UPLOADER_UI:\n\n" + ex.Message + "\n\n" + ex.StackTrace,
                    "DFIR_UPLOADER_UI v" + AppVersion.Current,
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Error);
            }
        }

        public const string BinName = "DFIR_UPLOADER_UI.exe";
    }
}