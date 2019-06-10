###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_smb_enum_sessions_net.nasl 12117 2018-10-26 10:50:36Z cfischer $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Ron Bowes
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
  script_oid("1.3.6.1.4.1.25623.1.0.104083");
  script_version("$Revision: 12117 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 12:50:36 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-06-01 16:32:46 +0200 (Wed, 01 Jun 2011)");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:N");
  script_name("Nmap NSE net: smb-enum-sessions");
  script_category(ACT_INIT);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE net");
  script_dependencies("nmap_nse_net.nasl");
  script_mandatory_keys("Tools/Launch/nmap_nse_net");

  script_add_preference(name:"smbbasic", value:"", type:"entry");
  script_add_preference(name:"smbport", value:"", type:"entry");
  script_add_preference(name:"smbsign", value:"", type:"entry");
  script_add_preference(name:"randomseed", value:"", type:"entry");

  script_tag(name:"summary", value:"Enumerates the users logged into a system either locally or through
an SMB share. The local users can be logged on either physically on the
machine, or through a terminal services session.  Connections to a SMB share
are, for example, people connected to fileshares or making RPC calls.
Nmap's connection will also show up, and is generally identified by the one
that connected '0 seconds ago'.

SYNTAX:

smbbasic:     Forces the authentication to use basic security, as opposed to 'extended security'.
Against most modern systems, extended security should work, but there may be cases
where you want to force basic. There's a chance that you'll get better results for
enumerating users if you turn on basic authentication.

smbport:       Override the default port choice. If 'smbport' is open, it's used. It's assumed
to be the same protocol as port 445, not port 139. Since it probably isn't possible to change
Windows' ports normally, this is mostly useful if you're bouncing through a relay or something.

smbsign:       Controls whether or not server signatures are checked in SMB packets. By default, on Windows,
server signatures aren't enabled or required. By default, this library will always sign
packets if it knows how, and will check signatures if the server says to. Possible values are:

  - 'force':      Always check server signatures, even if server says it doesn't support them (will
probably fail, but is technically more secure).

  - 'negotiate': [default] Use signatures if server supports them.

  - 'ignore':    Never check server signatures. Not recommended.

  - 'disable':   Don't send signatures, at all, and don't check the server's. not recommended.
More information on signatures can be found in 'smbauth.lua'.

randomseed:    Set to a value to change the filenames/service names that are randomly generated.");

  script_tag(name:"solution_type", value:"Mitigation");

  exit(0);
}

include("nmap.inc");

# The corresponding NSE script doesn't belong to the 'safe' category
if (safe_checks()) exit(0);

phase = 0;
if (defined_func("scan_phase")) {
  phase = scan_phase();
}

if (phase == 1) {
    argv = make_array();

    pref = script_get_preference("smbbasic");
    if (!isnull(pref) && pref != "") {
        argv["smbbasic"] = string('"', pref, '"');
    }
    pref = script_get_preference("smbport");
    if (!isnull(pref) && pref != "") {
        argv["smbport"] = string('"', pref, '"');
    }
    pref = script_get_preference("smbsign");
    if (!isnull(pref) && pref != "") {
        argv["smbsign"] = string('"', pref, '"');
    }
    pref = script_get_preference("randomseed");
    if (!isnull(pref) && pref != "") {
        argv["randomseed"] = string('"', pref, '"');
    }
    nmap_nse_register(script:"smb-enum-sessions", args:argv);
} else if (phase == 2) {
    res = nmap_nse_get_results(script:"smb-enum-sessions");
    foreach portspec (keys(res)) {
        output_banner = 'Result found by Nmap Security Scanner (smb-enum-sessions.nse) http://nmap.org:\n\n';
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
