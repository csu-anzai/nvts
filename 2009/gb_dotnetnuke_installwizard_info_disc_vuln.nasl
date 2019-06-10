###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_dotnetnuke_installwizard_info_disc_vuln.nasl 14031 2019-03-07 10:47:29Z cfischer $
#
# DotNetNuke Install Wizard Information Disclosure Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:dotnetnuke:dotnetnuke";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800686");
  script_version("$Revision: 14031 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-07 11:47:29 +0100 (Thu, 07 Mar 2019) $");
  script_tag(name:"creation_date", value:"2009-09-03 16:18:01 +0200 (Thu, 03 Sep 2009)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_cve_id("CVE-2008-7101");
  script_bugtraq_id(31145);
  script_name("DotNetNuke Install Wizard Information Disclosure Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH ");
  script_family("Web application abuses");
  script_dependencies("gb_dotnetnuke_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("dotnetnuke/installed");

  script_tag(name:"impact", value:"Successful exploitation could allow remote attackers to view the install wizard
  page and obtain sensitive information.");

  script_tag(name:"affected", value:"DotNetNuke versions 4.0 to 4.8.4 and 5.0.");

  script_tag(name:"insight", value:"An unspecified vulnerability in DotNetNuke which could allow a remote
  attackers to gain unauthorised information.");

  script_tag(name:"solution", value:"Upgrade to DotNetNuke version 4.9.0/5.0.1 or later.");

  script_tag(name:"summary", value:"The host is installed with DotNetNuke and is prone to Information
  Disclosure vulnerability.");

  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/45080");
  script_xref(name:"URL", value:"http://www.dotnetnuke.com/News/SecurityPolicy/Securitybulletinno22/tabid/1175/Default.aspx");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) )
  exit( 0 );

if( ! vers = get_app_version( cpe:CPE, port:port ) )
  exit( 0 );

if( version_is_equal( version:vers, test_version:"5.0" ) ||
    version_in_range( version:vers, test_version:"4.0", test_version2:"4.8.4" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"4.9.0/5.0.1" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );