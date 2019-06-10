###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap6_http_userdir_enum.nasl 12115 2018-10-26 09:30:41Z cfischer $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: jah
# NASL-Wrapper: autogenerated
#
# Copyright:
# NSE-Script: The Nmap Security Scanner (http://nmap.org)
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.803531");
  script_version("2019-04-08T06:04:46+0000");
  script_cve_id("CVE-2001-1013");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"2019-04-08 06:04:46 +0000 (Mon, 08 Apr 2019)");
  script_tag(name:"creation_date", value:"2013-02-28 19:00:20 +0530 (Thu, 28 Feb 2013)");
  script_name("Nmap NSE 6.01: http-userdir-enum");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE");
  script_dependencies("nmap_nse.nasl", "find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_mandatory_keys("Tools/Launch/nmap_nse", "Tools/Present/nmap6.01");

  script_add_preference(name:"userdir.users", value:"", type:"entry");
  script_add_preference(name:"limit", value:"", type:"entry");
  script_add_preference(name:"http-max-cache-size", value:"", type:"entry");
  script_add_preference(name:"http.pipeline", value:"", type:"entry");

  script_tag(name:"summary", value:"Attempts to enumerate valid usernames on web servers running with the mod_userdir module or similar
enabled.

The Apache mod_userdir module allows user-specific directories to be accessed using the
http://example.com/~user/ syntax. This script makes http requests in order to discover valid user-
specific directories and infer valid usernames. By default, the script will use Nmap's
'nselib/data/usernames.lst'. An HTTP response status of 200 or 403 means the username is
likely a valid one and the username will be output in the script results along with the status code
(in parentheses).

This script makes an attempt to avoid false positives by requesting a directory which is unlikely to
exist.  If the server responds with 200 or 403 then the script will not continue testing it.

SYNTAX:

userdir.users:  The filename of a username list.

limit:  The maximum number of users to check.

http-max-cache-size:  The maximum memory size (in bytes) of the cache.

http.pipeline:  If set, it represents the number of HTTP requests that'll be
pipelined (ie, sent in a single request). This can be set low to make
debugging easier, or it can be set high to test how a server reacts (its
chosen max is ignored).");

  script_tag(name:"solution_type", value:"Mitigation");

  exit(0);
}

# The corresponding NSE script doesn't belong to the 'safe' category
if (safe_checks()) exit(0);

include ("http_func.inc");

i = 0;

port = get_http_port(default:80);

pref = script_get_preference("userdir.users");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'userdir.users', '=', pref, '"');
}
pref = http_get_user_agent();
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'http.useragent', '=', pref, '"');
}
pref = script_get_preference("limit");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'limit', '=', pref, '"');
}
pref = script_get_preference("http-max-cache-size");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'http-max-cache-size', '=', pref, '"');
}
pref = script_get_preference("http.pipeline");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'http.pipeline', '=', pref, '"');
}

argv = make_list("nmap","--script=http-userdir-enum.nse","-p",port,get_host_ip());

if(i > 0) {
  scriptArgs = "--script-args=";
  foreach arg(args) {
    scriptArgs += arg + ",";
  }
  argv = make_list(argv, scriptArgs);
}

if(TARGET_IS_IPV6())
  argv = make_list(argv, "-6");

timing_policy = get_kb_item("Tools/nmap/timing_policy");
if(timing_policy =~ '^-T[0-5]$')
  argv = make_list(argv, timing_policy);

source_iface = get_preference("source_iface");
if(source_iface =~ '^[0-9a-zA-Z:_]+$') {
  argv = make_list(argv, "-e");
  argv = make_list(argv, source_iface);
}

res = pread(cmd:"nmap", argv:argv);

if(res)
{
  foreach line (split(res))
  {
    if(ereg(pattern:"^\|",string:line)) {
      result +=  substr(chomp(line),2) + '\n';
    }

    error = eregmatch(string:line, pattern:"^nmap: (.*)$");
    if (error) {
      msg = string('Nmap command failed with following error message:\n', line);
      log_message(data : msg, port:port);
    }
  }

  if("http-userdir-enum" >< result) {
    msg = string('Result found by Nmap Security Scanner (http-userdir-enum.nse) ',
                'http://nmap.org:\n\n', result);
    security_message(data : msg, port:port);
  }
}
else
{
  msg = string('Nmap command failed entirely:\n', 'nmap ', argv);
  log_message(data: msg, port:port);
}
