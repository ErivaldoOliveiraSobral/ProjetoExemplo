﻿using Microsoft.IdentityModel.Claims;
using Microsoft.IdentityModel.WindowsTokenService;
using Microsoft.Win32.SafeHandles;
using System;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Runtime.InteropServices;
using System.Security;
using System.Security.Permissions;
using System.Security.Principal;
using System.Threading;

namespace PortalDeFluxos.Core.BLL.Utilitario
{
    /// <summary>Efetua a conversão do contexto Claims para auteNOTIFcação Windows</summary>
    [PermissionSet(SecurityAction.Demand, Name = "FullTrust")]
    public class ContextoUsuarioSP : IDisposable
    {
        private readonly WindowsImpersonationContext _context;

        public ContextoUsuarioSP()
        {
            IClaimsIdentity idEntity = Thread.CurrentPrincipal.Identity as ClaimsIdentity;
            if (idEntity == null)
                return;

            string upn = idEntity.Claims.Where(c => c.ClaimType == ClaimTypes.Upn).First().Value;
            if (String.IsNullOrEmpty(upn))
                throw new Exception("Falha ao buscar o UPN do claims.");

            WindowsIdentity windowsIdEntity = S4UClient.UpnLogon(upn);
            _context = windowsIdEntity.Impersonate();
        }

        #region [ Liberação do objeto da memória ]
        ~ContextoUsuarioSP()
        {
            this.Dispose(false);
        }

        /// <summary>Realiza a destruição da instância.</summary>
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        /// <summary>
        /// Realiza a destruição da instância.
        /// </summary>
        /// <param name="disposing">Define se a destruição foi realizada explicitamente.</param>
        internal void Dispose(bool disposing)
        {
            if (_context == null)
                return;
         
            _context.Undo();
            _context.Dispose();
        }
        #endregion
    }

    [PermissionSet(SecurityAction.Demand, Name = "FullTrust")]
    public class Impersonation : IDisposable
    {
        private readonly SafeTokenHandle _handle;
        private readonly WindowsImpersonationContext _context;

        const int LOGON32_LOGON_NEW_Credentials = 9;

        public Impersonation(string domain, string username, string password)
        {
            var ok = LogonUser(username, domain, password,
                           LOGON32_LOGON_NEW_Credentials, 0, out this._handle);
            if (!ok)
            {
                var errorCode = Marshal.GetLastWin32Error();
                throw new ApplicationException(string.Format("Could not impersonate the elevated user.  LogonUser returned error code {0}.", errorCode));
            }

            this._context = WindowsIdentity.Impersonate(this._handle.DangerousGetHandle());
        }

        public void Dispose()
        {
            this._context.Dispose();
            this._handle.Dispose();
        }

        [DllImport("advapi32.dll", SetLastError = true, CharSet = CharSet.Unicode)]
        private static extern bool LogonUser(String lpszUsername, String lpszDomain, String lpszPassword, int dwLogonType, int dwLogonProvider, out SafeTokenHandle phToken);

        public sealed class SafeTokenHandle : SafeHandleZeroOrMinusOneIsInvalid
        {
            private SafeTokenHandle()
                : base(true) { }

            [DllImport("kernel32.dll")]
            [ReliabilityContract(Consistency.WillNotCorruptState, Cer.Success)]
            [SuppressUnmanagedCodeSecurity]
            [return: MarshalAs(UnmanagedType.Bool)]
            private static extern bool CloseHandle(IntPtr handle);

            protected override bool ReleaseHandle()
            {
                return CloseHandle(handle);
            }
        }
    }
}
