###############################################################################
# OpenVAS Vulnerability Test
#
# Xymon Monitor Version Detection
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# Copyright (c) 2011 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.902503");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("2019-08-30T08:58:27+0000");
  script_tag(name:"last_modification", value:"2019-08-30 08:58:27 +0000 (Fri, 30 Aug 2019)");
  script_tag(name:"creation_date", value:"2011-05-02 12:20:04 +0200 (Mon, 02 May 2011)");
  script_tag(name:"cvss_base", value:"0.0");

  script_name("Xymon Detection");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2011 SecPod");
  script_family("Product detection");
  script_dependencies("http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"Detection of Xymon

  The script sends a connection request to the server and attempts to detect Xymon and to extract its
  version.");

  script_tag(name:"qod_type", value:"remote_banner");

  script_xref(name:"URL", value:"http://xymon.sourceforge.net/");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

port = get_http_port( default:80 );

foreach dir( make_list_unique( "/xymon", "/", cgi_dirs( port:port ) ) ) {

  install = dir;
  if( dir == "/" )
    dir = "";

  res = http_get_cache( item:dir + "/xymon.html", port:port);

  if( res =~ "^HTTP/1.[01] 200" && ">Xymon<" >< res ) {
    version = "unknown";

    ver = eregmatch( pattern:">Xymon ([0-9.]+)<", string:res );
    if( ! isnull( ver[1] ) )
      version = ver[1];

    set_kb_item( name:"xymon/detected", value:TRUE );

    cpe = build_cpe( value:version, exp:"^([0-9.]+)", base:"cpe:/a:xymon:xymon:" );
    if( !cpe )
      cpe = 'cpe:/a:xymon:xymon';

    register_product( cpe:cpe, location:install, port:port, service:"www" );

    log_message( data:build_detection_report( app:"Xymon", version:version, install:install, cpe:cpe,
                                              concluded:ver[0] ),
                 port:port );
  }
}

exit( 0 );
