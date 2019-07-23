# Copyright (C) 2019 Greenbone Networks GmbH
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (C) the respective author(s)
#
# SPDX-License-Identifier: GPL-2.0-or-later
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.814989");
  script_version("2019-07-23T06:55:12+0000");
  script_cve_id("CVE-2019-1109");
  script_bugtraq_id(108965);
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:N");
  script_tag(name:"last_modification", value:"2019-07-23 06:55:12 +0000 (Tue, 23 Jul 2019)");
  script_tag(name:"creation_date", value:"2019-07-10 11:36:29 +0530 (Wed, 10 Jul 2019)");
  script_name("Microsoft Office 2016 Spoofing Vulnerability (KB4464534)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4018375");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"A spoofing vulnerability exists when
  Microsoft Office Javascript does not check the validity of the web page
  making a request to Office documents.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to gain access to conduct spoofing attacks and perform unauthorized actions,
  other attacks are also possible.");


  script_tag(name:"affected", value:"Microsoft Office 2016");

  script_tag(name:"solution", value:"The vendor has released updates. Please see the references for more information.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://support.microsoft.com/en-us/help/4464534/");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("MS/Office/Ver");
  script_require_ports(139, 445);
  exit(0);
}

include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

officeVer = get_kb_item("MS/Office/Ver");
if(!officeVer || officeVer !~ "^16\."){
  exit(0);
}

os_arch = get_kb_item("SMB/Windows/Arch");
if("x86" >< os_arch){
  key_list = make_list("SOFTWARE\Microsoft\Windows\CurrentVersion");
}
else if("x64" >< os_arch){
  key_list =  make_list("SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion",
                        "SOFTWARE\Microsoft\Windows\CurrentVersion");
}

foreach key(key_list)
{
  msPath = registry_get_sz(key:key, item:"ProgramFilesDir");
  if(msPath)
  {
    exePath = msPath + "\Microsoft Office\Office16";
    exeVer = fetch_file_version(sysPath:exePath, file_name:"osf.dll");
    if(!exeVer){
      continue ;
    }
    if(version_in_range(version:exeVer, test_version:"16.0", test_version2:"16.0.4873.0999"))
    {
      report = report_fixed_ver(file_checked:exePath + "\osf.dll",
                                file_version:exeVer, vulnerable_range:"16.0 - 16.0.4873.0999");
      security_message(data:report);
      exit(0);
    }
  }
}
exit(99);
