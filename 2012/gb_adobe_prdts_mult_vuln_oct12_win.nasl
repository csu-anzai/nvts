###############################################################################
# OpenVAS Vulnerability Test
#
# Adobe Flash Player Multiple Vulnerabilities - October 12 (Windows)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:adobe:flash_player";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.802986");
  script_version("2019-05-17T10:45:27+0000");
  script_cve_id("CVE-2012-5248", "CVE-2012-5249", "CVE-2012-5250", "CVE-2012-5251",
                "CVE-2012-5252", "CVE-2012-5253", "CVE-2012-5254", "CVE-2012-5255",
                "CVE-2012-5256", "CVE-2012-5257", "CVE-2012-5258", "CVE-2012-5259",
                "CVE-2012-5260", "CVE-2012-5261", "CVE-2012-5262", "CVE-2012-5263",
                "CVE-2012-5264", "CVE-2012-5265", "CVE-2012-5266", "CVE-2012-5267",
                "CVE-2012-5268", "CVE-2012-5269", "CVE-2012-5270", "CVE-2012-5271",
                "CVE-2012-5272", "CVE-2012-5673", "CVE-2012-5285", "CVE-2012-5286",
                "CVE-2012-5287");
  script_bugtraq_id(55827, 56374, 56375, 56376, 56377);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"2019-05-17 10:45:27 +0000 (Fri, 17 May 2019)");
  script_tag(name:"creation_date", value:"2012-10-15 12:29:16 +0530 (Mon, 15 Oct 2012)");
  script_name("Adobe Flash Player Multiple Vulnerabilities - October 12 (Windows)");
  script_xref(name:"URL", value:"http://secunia.com/advisories/50876/");
  script_xref(name:"URL", value:"http://www.adobe.com/support/security/bulletins/apsb12-22.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2012 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_flash_player_detect_win.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Win/Installed");
  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to execute arbitrary
  code on the target system or cause a denial of service (memory corruption)
  via unspecified vectors.");
  script_tag(name:"affected", value:"Adobe Flash Player version before 10.3.183.29, 11.x before 11.4.402.287 on Windows");
  script_tag(name:"insight", value:"The flaws are due to memory corruption, buffer overflow errors that
  could lead to code execution.");
  script_tag(name:"solution", value:"Update to Adobe Flash Player version 10.3.183.29 or 11.4.402.287 or later.");
  script_tag(name:"summary", value:"This host is installed with Adobe Flash Player and is prone to
  multiple vulnerabilities.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"http://get.adobe.com/flashplayer/");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!infos = get_app_version_and_location( cpe:CPE, exit_no_version:TRUE )) exit(0);
vers = infos['version'];
path = infos['location'];

if( version_is_less( version:vers, test_version:"10.3.183.29" ) ||
    version_in_range( version:vers, test_version:"11.0", test_version2:"11.4.402.278" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"10.3.183.29 or 11.4.402.287", install_path:path );
  security_message( port:0, data:report );
  exit( 0 );
}

exit( 99 );