###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_edgecore_ES3526XA_manager_remote_detect.nasl 10922 2018-08-10 19:21:48Z cfischer $
#
# EdgeCore ES3526XA Manager Remote Version Detection
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.808237");
  script_version("$Revision: 10922 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-08-10 21:21:48 +0200 (Fri, 10 Aug 2018) $");
  script_tag(name:"creation_date", value:"2016-06-27 15:50:17 +0530 (Mon, 27 Jun 2016)");
  script_name("EdgeCore ES3526XA Manager Remote Version Detection");

  script_tag(name:"summary", value:"Detects the installed version of
  EdgeCore ES3526XA Manager.

  This script sends HTTP GET request and try to ensure the presence of
  EdgeCore ES3526XA Manager from the response.");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("gb_get_http_banner.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("SMC6128L2/banner");

  exit(0);
}


include("http_func.inc");
include("host_details.inc");


edgePort = get_http_port(default:80);

banner = get_http_banner(port:edgePort);

#EdgeCore - Layer2+ Fast Ethernet Standalone Switch ES3526XA Manager
#Also rebranded as: *SMC TigerSwitch 10/100 SMC6128L2 Manager*
if(banner && 'WWW-Authenticate: Basic realm="SMC6128L2' >< banner)
{
  edgeVer = "Unknown";

  set_kb_item(name:"EdgeCore/ES3526XA/Manager/Installed", value:TRUE);

  cpe = "cpe:/o:edgecore:es3526xa_manager";

  register_product(cpe:cpe, location:"/", port:edgePort);

  log_message(data: build_detection_report(app: "EdgeCore ES3526XA Manager",
                                           version: edgeVer,
                                           install: "/",
                                           cpe: cpe,
                                           concluded: edgeVer),
                                           port: edgePort);
}
