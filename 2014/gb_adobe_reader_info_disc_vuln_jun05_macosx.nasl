###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_reader_info_disc_vuln_jun05_macosx.nasl 11867 2018-10-12 10:48:11Z cfischer $
#
# Adobe Reader Information Disclosure Vulnerability Jun05 (Mac OS X)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:adobe:acrobat_reader";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804256");
  script_version("$Revision: 11867 $");
  script_cve_id("CVE-2005-1306", "CVE-2005-1623", "CVE-2005-1624");
  script_bugtraq_id(13962, 14076, 14075);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:48:11 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2014-04-15 18:00:27 +0530 (Tue, 15 Apr 2014)");
  script_name("Adobe Reader Information Disclosure Vulnerability Jun05 (Mac OS X)");


  script_tag(name:"summary", value:"This host is installed with Adobe Reader and is prone to information
disclosure vulnerability.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"Flaw exist due to an error in the adobe reader control which allows reading
the contents of certain text files.");
  script_tag(name:"impact", value:"Successful exploitation will allow attackers to gain knowledge of potentially
sensitive information and execute arbitrary local programs on user's system.");
  script_tag(name:"affected", value:"Adobe Reader version 7.0.0 and 7.0.1 on Mac OS X.");
  script_tag(name:"solution", value:"Upgrade to Adobe Reader 7.0.5 or later.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://secunia.com/advisories/15698");
  script_xref(name:"URL", value:"http://securitytracker.com/id?1014212");
  script_xref(name:"URL", value:"http://www.adobe.com/support/techdocs/331710.html");
  script_xref(name:"URL", value:"http://www.adobe.com/support/techdocs/331709.html");
  script_xref(name:"URL", value:"http://www.adobe.com/support/techdocs/331711.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_adobe_prdts_detect_macosx.nasl");
  script_mandatory_keys("Adobe/Reader/MacOSX/Version");
  script_xref(name:"URL", value:"http://get.adobe.com/reader");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!readerVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(readerVer && readerVer =~ "^7")
{
  if(version_is_equal(version:readerVer, test_version:"7.0.0")||
     version_is_equal(version:readerVer, test_version:"7.0.1"))
  {
    security_message( port: 0, data: "The target host was found to be vulnerable" );
    exit(0);
  }
}
