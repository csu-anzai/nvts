###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_mult_vuln02_jun14_win.nasl 11867 2018-10-12 10:48:11Z cfischer $
#
# Google Chrome Multiple Vulnerabilities - 02 June14 (Windows)
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

CPE = "cpe:/a:google:chrome";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804642");
  script_version("$Revision: 11867 $");
  script_cve_id("CVE-2014-3154", "CVE-2014-3155", "CVE-2014-3156", "CVE-2014-3157");
  script_bugtraq_id(67977, 67980, 67981, 67972);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:48:11 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2014-06-19 10:51:54 +0530 (Thu, 19 Jun 2014)");
  script_name("Google Chrome Multiple Vulnerabilities - 02 June14 (Windows)");


  script_tag(name:"summary", value:"The host is installed with Google Chrome and is prone to multiple
vulnerabilities.");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"The flaws are due to,

  - A use-after-free error in the 'ChildThread::Shutdown' function in
content/child/child_thread.cc script related to the filesystem API.

  - An out-of-bounds read flaw in SPDY related to reentrancy.

  - An overflow condition related to bitmap handling in the clipboard code.

  - An overflow condition in the 'FFmpegVideoDecoder::GetVideoBuffer' function
in media/filters/ffmpeg_video_decoder.cc script.");
  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to conduct a denial of
service and possibly have other unspecified impact.");
  script_tag(name:"affected", value:"Google Chrome version prior to 35.0.1916.153 on Windows.");
  script_tag(name:"solution", value:"Upgrade to Google Chrome 35.0.1916.153 or later.");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://secunia.com/advisories/58585");
  script_xref(name:"URL", value:"http://googlechromereleases.blogspot.in/2014/06/stable-channel-update.html");
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_google_chrome_detect_portable_win.nasl");
  script_mandatory_keys("GoogleChrome/Win/Ver");
  script_xref(name:"URL", value:"http://www.google.com/chrome");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!chromeVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_less(version:chromeVer, test_version:"35.0.1916.153"))
{
  security_message( port: 0, data: "The target host was found to be vulnerable" );
  exit(0);
}
