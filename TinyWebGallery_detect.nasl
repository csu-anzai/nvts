###############################################################################
# OpenVAS Vulnerability Test
#
# TinyWebGallery Detection
#
# Authors
# Michael Meyer
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100192");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("2019-07-25T12:21:33+0000");
  script_tag(name:"last_modification", value:"2019-07-25 12:21:33 +0000 (Thu, 25 Jul 2019)");
  script_tag(name:"creation_date", value:"2009-05-10 17:01:14 +0200 (Sun, 10 May 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("TinyWebGallery Detection");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
  script_family("Product detection");
  script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"The TinyWebGallery, a free php based photo album / gallery is running
  at this host.");

  script_xref(name:"URL", value:"http://www.tinywebgallery.com");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

SCRIPT_DESC = "TinyWebGallery Detection";

port = get_http_port(default:80);
if(!can_host_php(port:port))exit(0);

foreach dir( make_list_unique( "/tinywebgallery", "/gallery", "/twg", cgi_dirs( port:port ) ) ) {

  install = dir;
  if( dir == "/" ) dir = "";
  url = dir + "/admin/index.php";
  buf = http_get_cache( item:url, port:port );
  if( !buf ) continue;

  if(egrep(pattern:"TWG Administration", string: buf) &&
     egrep(pattern:"TWG Admin [0-9.]+", string: buf)) {

    vers = string("unknown");
    version = eregmatch(pattern:"TWG Admin ([0-9.]+)", string:buf);
    if(!isnull(version[1]))
      vers = version[1];

    tmp_version = string(vers," under ",install);
    set_kb_item(name: string("www/", port, "/TinyWebGallery"), value: tmp_version);
    set_kb_item(name: "tinywebgallery/detected", value: TRUE);
    set_kb_item(name: "tinywebgallery_or_quixplorer/detected", value: TRUE);

    cpe = build_cpe(value:tmp_version, exp:"^([0-9.]+)", base:"cpe:/a:tinywebgallery:tinywebgallery:");
    if(!isnull(cpe))
      register_host_detail(name:"App", value:cpe, desc:SCRIPT_DESC);

    info = string("TinyWebGallery Version '");
    info += string(vers);
    info += string("' was detected on the remote host in the following directory(s):\n\n");
    info += string(install, "\n");
    log_message(port:port,data:info);
    exit(0);
  }
}

exit(0);
