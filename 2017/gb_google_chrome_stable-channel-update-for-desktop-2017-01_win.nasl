##############################################################################
# OpenVAS Vulnerability Test
#
# Google Chrome Security Updates(stable-channel-update-for-desktop-2017-01)-Windows
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.810523");
  script_version("2019-05-10T14:24:23+0000");
  script_cve_id("CVE-2017-5007", "CVE-2017-5006", "CVE-2017-5008", "CVE-2017-5010",
                "CVE-2017-5011", "CVE-2017-5009", "CVE-2017-5012", "CVE-2017-5013",
                "CVE-2017-5014", "CVE-2017-5015", "CVE-2017-5019", "CVE-2017-5016",
                "CVE-2017-5017", "CVE-2017-5018", "CVE-2017-5020", "CVE-2017-5021",
                "CVE-2017-5022", "CVE-2017-5023", "CVE-2017-5024", "CVE-2017-5025",
                "CVE-2017-5026");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"2019-05-10 14:24:23 +0000 (Fri, 10 May 2019)");
  script_tag(name:"creation_date", value:"2017-01-27 16:45:20 +0530 (Fri, 27 Jan 2017)");
  script_name("Google Chrome Security Updates(stable-channel-update-for-desktop-2017-01)-Windows");

  script_tag(name:"summary", value:"The host is installed with Google Chrome
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - Multiple universal XSS errors in Blink component, chrome://apps and
    chrome://downloads.

  - An improper access restriction for files in Devtools.

  - An out of bounds memory access error in WebRTC.

  - A heap overflow error in V8.

  - An address spoofing error in Omnibox.

  - A heap overflow error in Skia.

  - An use after free error in Renderer.

  - An UI spoofing error in Blink component.

  - An uninitialised memory access error in webm video.

  - An use after free error in Extensions.

  - The bypass of Content Security Policy in Blink.

  - A type confusion error in metrics.

  - A heap overflow error in FFmpeg.

  - The various fixes from internal audits, fuzzing and other initiatives.");

  script_tag(name:"impact", value:"Successful exploitation of these
  vulnerabilities will allow remote attacker to bypass security, execute
  arbitrary code, cause denial of service and conduct spoofing attacks.");

  script_tag(name:"affected", value:"Google Chrome version prior to 56.0.2924.76 on Windows");

  script_tag(name:"solution", value:"Upgrade to Google Chrome version
  56.0.2924.76 or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"https://chromereleases.googleblog.com/2017/01/stable-channel-update-for-desktop.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_google_chrome_detect_portable_win.nasl");
  script_mandatory_keys("GoogleChrome/Win/Ver");
  script_xref(name:"URL", value:"http://www.google.com/chrome");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

if(!chr_ver = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_less(version:chr_ver, test_version:"56.0.2924.76"))
{
  report = report_fixed_ver(installed_version:chr_ver, fixed_version:"56.0.2924.76");
  security_message(data:report);
  exit(0);
}
