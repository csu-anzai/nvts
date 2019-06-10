# Greenbone Community Feed

A git repository driven from the Greenbone Community Feed: http://dl.greenbone.net/community-nvt-feed-current.tar.bz2

This executes `tools/update.sh` every hour, and will publish changes to the feed to this repository.

# Planned Updates

* Resolve dependencies for every NVT received from the community feed and assert that they are present.
* Run every NVT through `openvas-nasl-lint` as an initial attempt to highlight any broken NVTs.
