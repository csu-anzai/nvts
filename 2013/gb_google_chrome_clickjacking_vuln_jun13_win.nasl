###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_clickjacking_vuln_jun13_win.nasl 11865 2018-10-12 10:03:43Z cfischer $
#
# Google Chrome Clickjacking Vulnerability June13 (Windows)
#
# Authors:
# Arun Kallavi <karun@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.803675");
  script_version("$Revision: 11865 $");
  script_cve_id("CVE-2013-2866");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:03:43 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-06-24 11:15:34 +0530 (Mon, 24 Jun 2013)");
  script_name("Google Chrome Clickjacking Vulnerability June13 (Windows)");
  script_xref(name:"URL", value:"http://securitytracker.com/id/1028694");
  script_xref(name:"URL", value:"http://googlechromereleases.blogspot.in/2013/06/stable-channel-update_18.html");
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_google_chrome_detect_portable_win.nasl");
  script_mandatory_keys("GoogleChrome/Win/Ver");
  script_tag(name:"impact", value:"Successful exploitation will allow attackers to obtain sensitive information
  and conduct clickjacking attacks against the users Flash configuration.");
  script_tag(name:"affected", value:"Google Chrome version prior to 27.0.1453.116 on Windows");
  script_tag(name:"insight", value:"Flaw within Flash plug-in which does not properly determine whether a user
  wishes to permit camera or microphone access by a Flash application.");
  script_tag(name:"solution", value:"Upgrade to the Google Chrome 27.0.1453.116 or later.");
  script_tag(name:"summary", value:"The host is installed with Google Chrome and is prone to
  Clickjacking vulnerability.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"http://www.google.com/chrome");
  exit(0);
}


include("version_func.inc");

chromeVer = get_kb_item("GoogleChrome/Win/Ver");
if(!chromeVer){
  exit(0);
}

if(version_is_less(version:chromeVer, test_version:"27.0.1453.116")){
  security_message( port: 0, data: "The target host was found to be vulnerable" );
}
