# OpenVAS Vulnerability Test
# Description: Webalizer Cross Site Scripting Vulnerability
#
# Authors:
# Georges Dagousset <georges.dagousset@alert4web.com>
#
# Copyright:
# Copyright (C) 2001 Alert4Web.com
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.10816");
  script_version("2019-04-24T07:26:10+0000");
  script_tag(name:"last_modification", value:"2019-04-24 07:26:10 +0000 (Wed, 24 Apr 2019)");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_bugtraq_id(3473);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2001-0835");
  script_name("Webalizer Cross Site Scripting Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2001 Alert4Web.com");
  script_family("Gain a shell remotely");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"solution", value:"Upgrade to Version 2.01-09 and change the directory in 'OutputDir'.");

  script_tag(name:"summary", value:"Webalizer have a cross-site scripting vulnerability,
  that could allow malicious HTML tags to be injected in the reports generated by the Webalizer.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

dirs = make_list(
"/usage/",      # Standard directory
"/webalizer/"); # Popular directory

port = get_http_port(default:80);

foreach dir(dirs) {

  buf = http_get_cache(item:dir, port:port);
  if(!buf)
    continue;

  if("Generated by The Webalizer" >< buf && egrep(pattern:"Generated by The Webalizer  Ver(\.|sion) ([01]\.|2\.00|2\.01( |\-0[0-6]))", string:buf)) {
    security_message(port:port);
    exit(0);
  }
}

exit(99);