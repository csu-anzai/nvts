###############################################################################
# OpenVAS Vulnerability Test
#
# Microsoft .NET Framework Denial Of Service And Security Feature Bypass Vulnerabilities (KB4055002)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.812713");
  script_version("2019-05-03T10:54:50+0000");
  script_cve_id("CVE-2018-0764", "CVE-2018-0786");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"2019-05-03 10:54:50 +0000 (Fri, 03 May 2019)");
  script_tag(name:"creation_date", value:"2018-01-10 13:15:49 +0530 (Wed, 10 Jan 2018)");
  script_name("Microsoft .NET Framework Denial Of Service And Security Feature Bypass Vulnerabilities (KB4055002)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Security Updates KB4055002.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to,

  - .NET Framework (and .NET Core) components do not completely validate
    certificates.

  - .NET, and .NET core, improperly process XML documents.");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  attacker who successfully exploited this vulnerability to cause a denial
  of service against a .NET application and also to bypass security.");

  script_tag(name:"affected", value:"Microsoft .NET Framework 4.6/4.6.1/4.6.2/4.7");

  script_tag(name:"solution", value:"The vendor has released updates. Please see the references for more information.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4055002");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(win2008:3, win2008x64:3, win7:2, win7x64:2, win2008r2:2) <= 0){
  exit(0);
}

key = "SOFTWARE\Microsoft\ASP.NET\";
if(!registry_key_exists(key:key)){
  exit(0);
}

foreach item (registry_enum_keys(key:key))
{
  dotPath = registry_get_sz(key:key + item, item:"Path");
  if(dotPath && "\Microsoft.NET\Framework" >< dotPath)
  {
    sysdllVer = fetch_file_version(sysPath:dotPath, file_name:"system.runtime.remoting.dll");
    if(!sysdllVer){
      exit(0);
    }

    ## .NET Framework 4.6 for Windows Server 2008 32-bit/x64 based Systems Service Pack 2
    ## .NET Framework 4.6/4.6.1/4.6.2/4.7  for Windows 7/Windows Server 2008 R2
    if(version_in_range(version:sysdllVer, test_version:"4.6", test_version2:"4.7.2116"))
    {
      report = 'File checked:     ' + dotPath + "system.runtime.remoting.dll" + '\n' +
               'File version:     ' + sysdllVer  + '\n' +
               'Vulnerable range: 4.6 - 4.7.2116\n' ;
      security_message(data:report);
      exit(0);
    }
  }
}

exit(0);
