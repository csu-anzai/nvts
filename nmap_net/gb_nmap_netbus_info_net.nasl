###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_netbus_info_net.nasl 12117 2018-10-26 10:50:36Z cfischer $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Toni Ruottu
# NASL-Wrapper: autogenerated
#
# Copyright:
# NSE-Script: The Nmap Security Scanner (http://nmap.org)
# Copyright (C) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.104052");
  script_version("$Revision: 12117 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 12:50:36 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-06-01 16:32:46 +0200 (Wed, 01 Jun 2011)");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:N");
  script_name("Nmap NSE net: netbus-info");
  script_category(ACT_INIT);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE net");
  script_dependencies("nmap_nse_net.nasl");
  script_mandatory_keys("Tools/Launch/nmap_nse_net");

  script_add_preference(name:"netbus-info.password", value:"", type:"entry");

  script_tag(name:"summary", value:"Opens a connection to a NetBus server and extracts information about the host and the NetBus
service itself.

The extracted host information includes a list of running applications, and the hosts sound volume
settings.

The extracted service information includes it's access control list (acl), server information, and
setup. The acl is a list of IP addresses permitted to access the service. Server information
contains details about the server installation path, restart persistence, user account that the
server is running on, and the amount of connected NetBus clients. The setup information contains
configuration details, such as the services TCP port number, traffic logging setting, password, an
email address for receiving login notifications, an email address used for sending the
notifications, and an smtp-server used for notification delivery.

SYNTAX:

netbus-info.password:  The password used for authentication");

  script_tag(name:"solution_type", value:"Mitigation");

  exit(0);
}

include("nmap.inc");

phase = 0;
if (defined_func("scan_phase")) {
  phase = scan_phase();
}

if (phase == 1) {
    argv = make_array();

    pref = script_get_preference("netbus-info.password");
    if (!isnull(pref) && pref != "") {
        argv["netbus-info.password"] = string('"', pref, '"');
    }
    nmap_nse_register(script:"netbus-info", args:argv);
} else if (phase == 2) {
    res = nmap_nse_get_results(script:"netbus-info");
    foreach portspec (keys(res)) {
        output_banner = 'Result found by Nmap Security Scanner (netbus-info.nse) http://nmap.org:\n\n';
        if (portspec == "0") {
            security_message(data:output_banner + res[portspec], port:0);
        } else {
            v = split(portspec, sep:"/", keep:0);
            proto = v[0];
            port = v[1];
            security_message(data:output_banner + res[portspec], port:port, protocol:proto);
        }
    }
}
