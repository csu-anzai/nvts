###############################################################################
# OpenVAS Vulnerability Test
#
# Microsoft OneNote Information Disclosure Vulnerability (2816264)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
#
# Copyright:
# Copyright (c) 2013 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.903304");
  script_version("2019-05-21T06:50:08+0000");
  script_cve_id("CVE-2013-0086");
  script_bugtraq_id(58387);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"2019-05-21 06:50:08 +0000 (Tue, 21 May 2019)");
  script_tag(name:"creation_date", value:"2013-03-13 09:39:46 +0530 (Wed, 13 Mar 2013)");
  script_name("Microsoft OneNote Information Disclosure Vulnerability (2816264)");
  script_xref(name:"URL", value:"http://support.microsoft.com/kb/2760600");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-au/security/bulletin/ms13-025");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("gb_ms_onenote_detect.nasl");
  script_mandatory_keys("MS/Office/OneNote/Ver");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers to disclose sensitive
  information from the affected system.");

  script_tag(name:"affected", value:"Microsoft OneNote 2010 Service Pack 1");

  script_tag(name:"insight", value:"The flaws due to allocating memory when validating buffer sizes during
  the handling of a specially crafted OneNote (.ONE) file.");

  script_tag(name:"solution", value:"The vendor has released updates. Please see the references for more information.");

  script_tag(name:"summary", value:"This host is missing an important security update according to
  Microsoft Bulletin MS13-025.");

  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("version_func.inc");

noteVer = get_kb_item("MS/Office/OneNote/Ver");

if(noteVer && version_in_range(version:noteVer, test_version:"14.0", test_version2:"14.0.6134.4999"))
{
  security_message( port: 0, data: "The target host was found to be vulnerable" );
  exit(0);
}
