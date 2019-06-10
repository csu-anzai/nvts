# Copyright (C) 2019 Greenbone Networks GmbH
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (C) of the respective author(s)
#
# SPDX-License-Identifier: GPL-2.0-or-later
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.142369");
  script_version("2019-05-06T09:52:36+0000");
  script_tag(name:"last_modification", value:"2019-05-06 09:52:36 +0000 (Mon, 06 May 2019)");
  script_tag(name:"creation_date", value:"2019-05-06 08:18:30 +0000 (Mon, 06 May 2019)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_name("EasyIO 30P Controller Detection (HTTP)");

  script_tag(name:"summary", value:"Detection of EasyIO 30P controllers.

The script sends a connection request to the server and attempts to detect EasyIO 30P.");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"http://www.easyio.com/");

  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 80);

url = "/main.js";
res = http_get_cache(port: port, item: url);

if ("EasyIO-30P Sedona" >< res && 'GDM name' >< res) {
  version = "unknown";

  # [1,"Model"],[2,"<span id=GDM name=GDM>IO-30S-BM</span>"]
  mod = eregmatch(pattern: 'Model"[^"]+"<span id=GDM name=GDM>([^<]+)', string: res);
  if (!isnull(mod[1])) {
    model = mod[1];
    set_kb_item(name: "easyio_30p/model", value: model);
    extra = "Model: " + model;
  }

  # [1,"Application Software Version"],[2,"<span id=GDV name=GDV>2.0.5.25</span>"]
  vers = eregmatch(pattern: 'Application Software Version"[^"]+"<span id=GDV name=GDV>([0-9.]+)', string: res);
  if (!isnull(vers[1])) {
    version = vers[1];
    concUrl = report_vuln_url(port: port, url: url, url_only: TRUE);
  }

  set_kb_item(name: "easyio_30p/detected", value: TRUE);

  cpe = build_cpe(value: version, exp: "^([0-9.]+)", base: "cpe:/o:easyio:easyio-30p-firmware:");
  if (!cpe)
    cpe = "cpe:/o:easyio:easyio-30p-firmware";

  register_product(cpe: cpe, location: "/", port: port, service: "www");

  log_message(data: build_detection_report(app: "EasyIO 30P Controller", version: version, install: "/", cpe: cpe,
                                           concluded: vers[0], concludedUrl: concUrl, extra: extra),
              port: port);
  exit(0);
}

exit(0);
